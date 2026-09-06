package com.jsp.ojpms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.JobRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class PostedJobsController {

    private final JobRepository jobRepository;

    public PostedJobsController(JobRepository jobRepository) {
        this.jobRepository = jobRepository;
    }

    @GetMapping("/postedjobs")
    public String postedJobs(
            HttpSession session,
            Model model) {

        // Get logged-in recruiter
        User recruiter = (User) session.getAttribute("user");

        // Check whether recruiter is logged in
        if (recruiter == null) {
            return "redirect:/login.jsp";
        }

        // Fetch jobs posted by recruiter
        List<Job> jobs = jobRepository.findByRecuriterId(
                recruiter.getId());

        // Send jobs to JSP
        model.addAttribute("jobs", jobs);

        // Open JSP
        return "posted-jobs-by-recruiter";
    }
}