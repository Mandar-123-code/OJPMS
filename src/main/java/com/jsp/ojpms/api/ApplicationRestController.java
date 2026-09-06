package com.jsp.ojpms.api;

import java.util.List;

import jakarta.validation.constraints.NotBlank;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.ApplicationRepository;
import com.jsp.ojpms.repository.JobRepository;
import com.jsp.ojpms.repository.UserRepository;

@RestController
@RequestMapping("/api/applications")
public class ApplicationRestController {

    private final ApplicationRepository applicationRepository;
    private final JobRepository jobRepository;
    private final UserRepository userRepository;

    public ApplicationRestController(ApplicationRepository applicationRepository, JobRepository jobRepository,
            UserRepository userRepository) {
        this.applicationRepository = applicationRepository;
        this.jobRepository = jobRepository;
        this.userRepository = userRepository;
    }

    @PostMapping("/jobs/{jobId}")
    @PreAuthorize("hasRole('USER')")
    public ApiModels.ApplicationResponse apply(@PathVariable int jobId, Authentication authentication) {
        User user = currentUser(authentication);
        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Job not found"));
        if (applicationRepository.existsByUserIdAndJobId(user.getId(), jobId)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "You already applied for this job");
        }
        return ApiModels.ApplicationResponse.from(applicationRepository.save(new Application(job, user, "APPLIED")));
    }

    @GetMapping("/me")
    public List<ApiModels.ApplicationResponse> mine(Authentication authentication) {
        return applicationRepository.findByUserId(currentUser(authentication).getId()).stream()
                .map(ApiModels.ApplicationResponse::from).toList();
    }

    @GetMapping("/jobs/{jobId}")
    @PreAuthorize("hasRole('RECRUITER')")
    public List<ApiModels.ApplicationResponse> forJob(@PathVariable int jobId, Authentication authentication) {
        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Job not found"));
        if (job.getRecuriter().getId() != currentUser(authentication).getId()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Only the job owner can view applications");
        }
        return applicationRepository.findByJobId(jobId).stream().map(ApiModels.ApplicationResponse::from).toList();
    }

    @PatchMapping("/{id}/status")
    @PreAuthorize("hasRole('RECRUITER')")
    public ApiModels.ApplicationResponse updateStatus(@PathVariable int id, @RequestBody StatusRequest request,
            Authentication authentication) {
        Application application = applicationRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Application not found"));
        if (application.getJob().getRecuriter().getId() != currentUser(authentication).getId()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Only the job owner can update applications");
        }
        application.setStatus(request.status().toUpperCase());
        return ApiModels.ApplicationResponse.from(applicationRepository.save(application));
    }

    private User currentUser(Authentication authentication) {
        return userRepository.findByEmail(authentication.getName())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not found"));
    }

    public record StatusRequest(@NotBlank String status) {
    }
}
