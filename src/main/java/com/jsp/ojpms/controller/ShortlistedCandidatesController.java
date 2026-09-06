package com.jsp.ojpms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.repository.ApplicationRepository;

@Controller
public class ShortlistedCandidatesController {

        private final ApplicationRepository applicationRepository;

        public ShortlistedCandidatesController(
                        ApplicationRepository applicationRepository) {

                this.applicationRepository = applicationRepository;
        }

        @GetMapping("/shortlistedcandidates")
        public String shortlistedCandidates(Model model) {

                List<Application> shortlisted = applicationRepository.findByStatus("SHORTLISTED");

                model.addAttribute("shortlisted", shortlisted);

                return "shortlisted-candidates";
        }
}