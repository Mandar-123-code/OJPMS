package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;

@Controller
public class EditRecruiterProfile {

	private final UserRepository userRepository;

	public EditRecruiterProfile(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@GetMapping("/editrecruiterprofile")
	public String editRecruiterProfile(
			@RequestParam("userId") int userId,
			Model model) {

		User user = userRepository.findById(userId).orElse(null);

		if (user == null) {
			return "redirect:/home.jsp";
		}

		model.addAttribute("user", user);

		return "editrecruiterprofile";
	}
}