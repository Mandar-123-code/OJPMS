package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;
import com.jsp.ojpms.util.PasswordUtil;

@Controller
public class EditUserProfile {

	private final UserRepository userRepository;

	public EditUserProfile(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@PostMapping("/edituserprofile")
	public String editUserProfile(
			@RequestParam("id") int id,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			Model model) {

		String encodePass = PasswordUtil.encode(password);

		System.out.println(id);
		System.out.println(name);
		System.out.println(email);
		System.out.println(encodePass);

		User user = new User();

		user.setId(id);
		user.setName(name);
		user.setEmail(email);
		user.setPassword(encodePass);

		userRepository.save(user);

		model.addAttribute(
				"msg",
				"Profile Updated Successfully");

		return "profile";
	}
}