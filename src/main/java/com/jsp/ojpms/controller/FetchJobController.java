package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.repository.JobRepository;

@Controller
public class FetchJobController {

	private final JobRepository jobRepository;

	public FetchJobController(JobRepository jobRepository) {
		this.jobRepository = jobRepository;
	}

	@GetMapping("/fetchjob")
	public String fetchJob(
			@RequestParam("id") int id,
			Model model) {

		Job job = jobRepository.findById(id).orElse(null);

		model.addAttribute("job", job);

		return "edit-job";
	}
}