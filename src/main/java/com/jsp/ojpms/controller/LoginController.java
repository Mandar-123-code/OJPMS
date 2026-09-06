package com.jsp.ojpms.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;

@Controller
public class LoginController {

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;

	public LoginController(
			UserRepository userRepository,
			PasswordEncoder passwordEncoder) {

		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
	}

	@PostMapping("/login")
	public String login(
			@RequestParam String email,
			@RequestParam String password,
			HttpSession session,
			Model model) {

		User user = userRepository.findByEmail(email)
				.orElse(null);

		// User does not exist
		if (user == null) {

			model.addAttribute(
					"error",
					"Invalid email or password");

			return "forward:/login.jsp";
		}

		// Check BCrypt password
		if (!passwordEncoder.matches(
				password,
				user.getPassword())) {

			model.addAttribute(
					"error",
					"Invalid email or password");

			return "forward:/login.jsp";
		}

		// ==============================
		// LOGIN SUCCESS
		// ==============================

		session.setAttribute(
				"user",
				user);

		// ==============================
		// JOB SEEKER
		// ==============================

		if ("JOB_SEEKER".equalsIgnoreCase(
				user.getRole())
				||
				"USER".equalsIgnoreCase(
						user.getRole())) {

			return "redirect:/user-dashboard.jsp";
		}

		// ==============================
		// RECRUITER
		// ==============================

		if ("RECRUITER".equalsIgnoreCase(
				user.getRole())) {

			return "redirect:/recruiter-dashboard.jsp";
		}

		return "redirect:/home.jsp";
	}
}