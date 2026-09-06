package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.JobRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class PostJobController {

	private final JobRepository jobRepository;

	public PostJobController(JobRepository jobRepository) {
		this.jobRepository = jobRepository;
	}

	@PostMapping("/postjob")
	public String postJob(
			@RequestParam("title") String title,
			@RequestParam("description") String description,
			@RequestParam("location") String location,
			@RequestParam("salary") String salary,
			@RequestParam("lastDate") String lastDate,
			HttpSession session) {

		System.out.println(title);
		System.out.println(description);
		System.out.println(location);
		System.out.println(salary);

		Job job = new Job();

		job.setTitle(title);
		job.setDescription(description);
		job.setLocation(location);
		job.setSalary(Double.parseDouble(salary));
		job.setLastDate(lastDate);

		// Get logged-in recruiter from session
		User recruiter = (User) session.getAttribute("user");

		job.setRecuriter(recruiter);

		// Save job
		jobRepository.save(job);

		return "redirect:/post-job.jsp";
	}
}