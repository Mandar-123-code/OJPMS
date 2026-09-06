package com.jsp.ojpms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jsp.ojpms.entity.SavedJob;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.SavedJobRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class ViewSavedJobController {

    private final SavedJobRepository savedJobRepository;

    public ViewSavedJobController(
            SavedJobRepository savedJobRepository) {

        this.savedJobRepository = savedJobRepository;
    }

    @GetMapping("/savedjob")
    public String viewSavedJobs(
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login.jsp";
        }

        List<SavedJob> savedJobs = savedJobRepository.findByUserId(user.getId());

        model.addAttribute("savedJobs", savedJobs);

        return "savedjob";
    }
}