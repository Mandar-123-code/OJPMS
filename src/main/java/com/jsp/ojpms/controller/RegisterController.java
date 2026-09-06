package com.jsp.ojpms.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;

@Controller
public class RegisterController {

	private final UserRepository userRepository;
	private final PasswordEncoder passwordEncoder;

	public RegisterController(
			UserRepository userRepository,
			PasswordEncoder passwordEncoder) {

		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
	}

	@PostMapping("/register")
	public String register(
			@RequestParam String name,
			@RequestParam String email,
			@RequestParam String password,
			@RequestParam String role) {

		// ==============================
		// CHECK EXISTING EMAIL
		// ==============================

		if (userRepository.existsByEmail(email)) {

			return "redirect:/register.jsp?error=email_exists";
		}

		// ==============================
		// CREATE USER
		// ==============================

		User user = new User(

				name,

				email,

				passwordEncoder.encode(password),

				role);

		userRepository.save(user);

		return "redirect:/login.jsp?registered=true";
	}
}