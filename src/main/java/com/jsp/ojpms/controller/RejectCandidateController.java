package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.repository.ApplicationRepository;

@Controller
public class RejectCandidateController {

        private final ApplicationRepository applicationRepository;

        public RejectCandidateController(
                        ApplicationRepository applicationRepository) {

                this.applicationRepository = applicationRepository;
        }

        @GetMapping("/rejectcandidate")
        public String rejectCandidate(
                        @RequestParam("userId") int userId,
                        @RequestParam("jobId") int jobId) {

                Application app = applicationRepository.findByUserIdAndJobId(userId, jobId);

                if (app != null) {
                        app.setStatus("REJECTED");
                        applicationRepository.save(app);
                }

                return "redirect:/viewapplicants?jobId=" + jobId;
        }
}