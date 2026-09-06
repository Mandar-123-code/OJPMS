package com.jsp.ojpms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.repository.JobRepository;

@Controller
public class ViewJobController {

	private final JobRepository jobRepository;

	public ViewJobController(JobRepository jobRepository) {
		this.jobRepository = jobRepository;
	}

	@GetMapping("/viewjob")
	public String viewJob(
			@RequestParam(value = "search", required = false) String search,
			Model model) {

		List<Job> list;

		/*
		 * Home page se request aati hai:
		 * /viewjob?search=&company=&location=&experience=&posted=
		 *
		 * Search empty hone par saare jobs fetch karenge.
		 */

		if (search == null || search.trim().isEmpty()) {

			list = jobRepository.findAll();

		} else {

			list = jobRepository
					.findByTitleContainingIgnoreCaseOrLocationContainingIgnoreCase(
							search.trim(),
							search.trim());
		}

		model.addAttribute("jobs", list);

		return "viewjob";
	}
}