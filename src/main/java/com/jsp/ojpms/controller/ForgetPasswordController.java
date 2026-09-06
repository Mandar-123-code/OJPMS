package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.repository.UserRepository;
import com.jsp.ojpms.util.PasswordUtil;

@Controller
public class ForgetPasswordController {

	private final UserRepository userRepository;

	public ForgetPasswordController(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@GetMapping("/reset")
	public String resetPassword(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			Model model) {

		String encodePass = PasswordUtil.encode(password);

		int updatedRows = userRepository.updatePassword(email, encodePass);

		if (updatedRows > 0) {

			model.addAttribute(
					"msg1",
					"Password Updated Successfully");

			return "login";
		}

		model.addAttribute(
				"msg2",
				"INVALID EMAIL ID..");

		return "reset";
	}
}