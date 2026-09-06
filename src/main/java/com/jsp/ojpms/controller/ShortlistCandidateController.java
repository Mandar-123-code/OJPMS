package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.repository.ApplicationRepository;

@Controller
public class ShortlistCandidateController {

        private final ApplicationRepository applicationRepository;

        public ShortlistCandidateController(
                        ApplicationRepository applicationRepository) {

                this.applicationRepository = applicationRepository;
        }

        @GetMapping("/shortlistcandidate")
        public String shortlistCandidate(
                        @RequestParam("userId") int userId,
                        @RequestParam("jobId") int jobId) {

                Application app = applicationRepository.findByUserIdAndJobId(
                                userId,
                                jobId);

                if (app != null) {

                        app.setStatus("SHORTLISTED");

                        applicationRepository.save(app);
                }

                return "redirect:/viewapplicants?jobId=" + jobId;
        }
}