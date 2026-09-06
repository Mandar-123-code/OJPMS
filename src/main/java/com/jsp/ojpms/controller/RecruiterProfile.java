package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;

@Controller
public class RecruiterProfile {

	private final UserRepository userRepository;

	public RecruiterProfile(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@GetMapping("/recruiterprofile")
	public String recruiterProfile(@RequestParam("id") int id,
			Model model) {

		System.out.println("Recruiter ID: " + id);

		User user = userRepository.findById(id).orElse(null);

		if (user == null) {
			return "redirect:/home.jsp";
		}

		model.addAttribute("user", user);

		return "recruiter-profile";
	}
}