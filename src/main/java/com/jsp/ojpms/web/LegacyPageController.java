package com.jsp.ojpms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LegacyPageController {

    @GetMapping("/")
    public String home() {
        return "forward:/home.jsp";
    }
}