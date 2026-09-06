package com.jsp.ojpms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.ApplicationRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyApplicationsController {

        private final ApplicationRepository applicationRepository;

        public MyApplicationsController(
                        ApplicationRepository applicationRepository) {

                this.applicationRepository = applicationRepository;
        }

        @GetMapping("/myapplications")
        public String myApplications(
                        HttpSession session,
                        Model model) {

                // Check whether user is logged in
                if (session == null ||
                                session.getAttribute("user") == null) {

                        return "redirect:/login.jsp";
                }

                // Get logged-in user
                User user = (User) session.getAttribute("user");

                // Fetch user's applications
                List<Application> applications = applicationRepository.findByUserId(
                                user.getId());

                // Send data to JSP
                model.addAttribute(
                                "applications",
                                applications);

                model.addAttribute(
                                "totalApplications",
                                applications.size());

                // Open my-applications.jsp
                return "my-applications";
        }
}