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
public class ViewSavedJobsController {

    private final SavedJobRepository savedJobRepository;

    public ViewSavedJobsController(
            SavedJobRepository savedJobRepository) {

        this.savedJobRepository = savedJobRepository;
    }

    @GetMapping("/viewjobs")
    public String viewSavedJobs(
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("user");

        System.out.println("User from session = " + user);

        if (user == null) {
            return "redirect:/login.jsp";
        }

        System.out.println("User Id = " + user.getId());

        List<SavedJob> list = savedJobRepository.findByUserId(user.getId());

        System.out.println(
                "Saved Jobs Count = " + list.size());

        model.addAttribute("savedJobs", list);

        return "saved-jobs";
    }
}