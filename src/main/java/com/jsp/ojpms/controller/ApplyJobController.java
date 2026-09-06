package com.jsp.ojpms.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.ApplicationRepository;
import com.jsp.ojpms.repository.JobRepository;
import com.jsp.ojpms.util.EmailUtil;

import jakarta.servlet.http.HttpSession;

@Controller
public class ApplyJobController {

        private final ApplicationRepository applicationRepository;
        private final JobRepository jobRepository;

        public ApplyJobController(
                        ApplicationRepository applicationRepository,
                        JobRepository jobRepository) {

                this.applicationRepository = applicationRepository;
                this.jobRepository = jobRepository;
        }

        @PostMapping("/applyjob")
        public String applyJob(
                        @RequestParam("jobId") String stringId,
                        HttpSession session,
                        Model model) {

                System.out.println("jobId: " + stringId);

                int id = Integer.parseInt(stringId.trim());

                User user = (User) session.getAttribute("user");

                // Fetch job
                Job job = jobRepository.findById(id).orElse(null);

                if (job == null) {
                        model.addAttribute("error", "JOB NOT FOUND");
                        return "viewjob";
                }

                // Check application deadline
                if (job.getLastDate() != null && !job.getLastDate().isEmpty()) {

                        LocalDate today = LocalDate.now();
                        LocalDate lastDate = LocalDate.parse(job.getLastDate());

                        if (today.isAfter(lastDate)) {

                                model.addAttribute("errorJobId", id);

                                model.addAttribute(
                                                "error",
                                                "APPLICATION CLOSED. LAST DATE WAS "
                                                                + job.getLastDate());

                                List<Job> list = jobRepository.findAll();

                                model.addAttribute("jobs", list);

                                return "viewjob";
                        }
                }

                // Create application
                Application application = new Application();

                application.setJob(job);
                application.setUser(user);

                // Check whether already applied
                if (applicationRepository.existsByUserIdAndJobId(
                                user.getId(),
                                job.getId())) {

                        model.addAttribute("errorJobId", id);

                        System.out.println("already applied");

                        model.addAttribute("error", "ALREADY APPLIED");

                        List<Job> list = jobRepository.findAll();

                        model.addAttribute("jobs", list);

                        return "viewjob";
                }

                // Save application
                applicationRepository.save(application);

                // --------------------------------
                // Mail to Job Seeker
                // --------------------------------

                String subject = "Application for " + job.getTitle();

                String message = "Hello " + user.getName() + ",\n\n"
                                + "You have successfully applied for the job: "
                                + job.getTitle() + "\n"
                                + "Location: " + job.getLocation() + "\n\n"
                                + "We will notify you soon.\n\n"
                                + "Best Regards\n"
                                + "Portal Team";

                EmailUtil.sendEmail(
                                user.getEmail(),
                                subject,
                                message);

                // --------------------------------
                // Mail to Recruiter
                // --------------------------------

                User recruiter = job.getRecuriter();

                String recruiterSubject = "New Application for " + job.getTitle();

                String recruiterMessage = "Hello,\n\n"
                                + "A new Candidate has Applied.\n"
                                + "Name: " + user.getName() + "\n"
                                + "Email: " + user.getEmail() + "\n\n"
                                + "Please login to review.\n\n"
                                + "Best Regards\n"
                                + "Job Portal Team";

                EmailUtil.sendEmail(
                                recruiter.getEmail(),
                                recruiterSubject,
                                recruiterMessage);

                // Redirect to View Jobs
                return "redirect:/viewjob";
        }
}