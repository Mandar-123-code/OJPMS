package com.jsp.ojpms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jsp.ojpms.repository.ApplicationRepository;
import com.jsp.ojpms.repository.JobRepository;

@Controller
public class DeleteJobController {

    private final JobRepository jobRepository;
    private final ApplicationRepository applicationRepository;

    public DeleteJobController(JobRepository jobRepository, ApplicationRepository applicationRepository) {
        this.jobRepository = jobRepository;
        this.applicationRepository = applicationRepository;
    }

    @Transactional
    @GetMapping("/deletejob")
    public String deleteJob(@RequestParam int id) {
        applicationRepository.deleteByJobId(id);
        jobRepository.deleteById(id);
        return "redirect:/postedjobs";
    }
}
