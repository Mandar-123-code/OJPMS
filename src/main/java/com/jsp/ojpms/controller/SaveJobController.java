package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.SavedJob;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.JobRepository;
import com.jsp.ojpms.repository.SavedJobRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class SaveJobController {

    private final SavedJobRepository savedJobRepository;
    private final JobRepository jobRepository;

    public SaveJobController(
            SavedJobRepository savedJobRepository,
            JobRepository jobRepository) {

        this.savedJobRepository = savedJobRepository;
        this.jobRepository = jobRepository;
    }

    @GetMapping("/savejob")
    public String saveJob(
            @RequestParam(value = "jobid", required = false) String jobIdStr,
            HttpSession session) {

        System.out.println("jobid = " + jobIdStr);

        // Check job ID
        if (jobIdStr == null || jobIdStr.isEmpty()) {
            return "redirect:/viewjob";
        }

        int jobId = Integer.parseInt(jobIdStr);

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Check whether user is logged in
        if (user == null) {
            return "redirect:/login.jsp";
        }

        // Check whether job is already saved
        if (!savedJobRepository.existsByUserIdAndJobId(
                user.getId(), jobId)) {

            // Fetch job
            Job job = jobRepository.findById(jobId).orElse(null);

            if (job != null) {

                SavedJob savedJob = new SavedJob();

                savedJob.setUser(user);
                savedJob.setJob(job);

                // Save job
                savedJobRepository.save(savedJob);
            }
        }

        return "redirect:/viewjob";
    }
}