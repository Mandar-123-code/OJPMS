package com.jsp.ojpms.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.ApplicationRepository;

@Controller
public class ViewApplicantsController {

    private final ApplicationRepository applicationRepository;

    public ViewApplicantsController(
            ApplicationRepository applicationRepository) {

        this.applicationRepository = applicationRepository;
    }

    @GetMapping("/viewapplicants")
    public String viewApplicants(
            @RequestParam("jobId") int jobId,
            Model model) {

        System.out.println(jobId);

        List<Application> applications = applicationRepository.findByJobId(jobId);

        List<User> applicants = new ArrayList<>();

        for (Application app : applications) {
            applicants.add(app.getUser());
        }

        model.addAttribute("applicants", applicants);
        model.addAttribute("jobId", jobId);

        return "view-applicants";
    }
}