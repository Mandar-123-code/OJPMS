package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.repository.JobRepository;

@Controller
public class EditJobController {

	private final JobRepository jobRepository;

	public EditJobController(JobRepository jobRepository) {
		this.jobRepository = jobRepository;
	}

	@PostMapping("/editjobs")
	public String editJob(
			@RequestParam("id") int id,
			@RequestParam("title") String title,
			@RequestParam("location") String location,
			@RequestParam("salary") double salary,
			@RequestParam("description") String description) {

		Job job = jobRepository.findById(id).orElse(null);

		if (job != null) {

			job.setTitle(title);
			job.setLocation(location);
			job.setSalary(salary);
			job.setDescription(description);

			jobRepository.save(job);
		}

		return "redirect:/postedjobs";
	}
}