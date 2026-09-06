package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.JobRepository;
import com.jsp.ojpms.repository.UserRepository;
import com.jsp.ojpms.util.EmailUtil;

@Controller
public class ScheduleInterviewController {

        private final UserRepository userRepository;
        private final JobRepository jobRepository;

        public ScheduleInterviewController(
                        UserRepository userRepository,
                        JobRepository jobRepository) {

                this.userRepository = userRepository;
                this.jobRepository = jobRepository;
        }

        @PostMapping("/scheduleinterview")
        public String scheduleInterview(
                        @RequestParam("userId") int userId,
                        @RequestParam("jobId") int jobId,
                        @RequestParam("date") String date,
                        @RequestParam("time") String time,
                        @RequestParam("mode") String mode) {

                // Fetch candidate
                User user = userRepository.findById(userId).orElse(null);

                // Fetch job
                Job job = jobRepository.findById(jobId).orElse(null);

                if (user == null || job == null) {
                        return "redirect:/shortlistedcandidates";
                }

                // Email subject
                String subject = "Interview Scheduled - "
                                + job.getTitle();

                // Email message
                String message = "Dear " + user.getName() + ",\n\n"
                                + "Congratulations!\n\n"
                                + "You have been shortlisted for the position of "
                                + job.getTitle()
                                + ".\n\n"
                                + "Interview Details\n\n"
                                + "Date : " + date + "\n"
                                + "Time : " + time + "\n"
                                + "Mode : " + mode + "\n\n"
                                + "Please be available 10 minutes before the scheduled time.\n\n"
                                + "Best Wishes,\n"
                                + "Recruitment Team\n"
                                + "OJPMS";

                // Send email to candidate
                EmailUtil.sendEmail(
                                user.getEmail(),
                                subject,
                                message);

                return "redirect:/shortlistedcandidates";
        }
}