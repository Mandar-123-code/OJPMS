package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;

@Controller
public class EditProfileController {

	private final UserRepository userRepository;

	public EditProfileController(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@GetMapping("/editprofile")
	public String editProfile(@RequestParam("userId") int userId,
			Model model) {

		User user = userRepository.findById(userId).orElse(null);

		if (user == null) {
			return "redirect:/profile.jsp";
		}

		model.addAttribute("user", user);

		return "editprofile";
	}
}