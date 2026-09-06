package com.jsp.ojpms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.repository.ApplicationRepository;

@Controller
public class RejectedCandidatesController {

    private final ApplicationRepository applicationRepository;

    public RejectedCandidatesController(
            ApplicationRepository applicationRepository) {

        this.applicationRepository = applicationRepository;
    }

    @GetMapping("/rejectedcandidates")
    public String rejectedCandidates(Model model) {

        List<Application> rejected =
                applicationRepository.findByStatus("REJECTED");

        model.addAttribute("rejected", rejected);

        return "rejected-candidates";
    }
}