package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ScheduleInterviewPageController {

        @GetMapping("/scheduleinterviewpage")
        public String scheduleInterviewPage(
                        @RequestParam("userId") int userId,
                        @RequestParam("jobId") int jobId,
                        Model model) {

                model.addAttribute("userId", userId);
                model.addAttribute("jobId", jobId);

                return "schedule-interview";
        }
}