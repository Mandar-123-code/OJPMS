package com.jsp.ojpms.api;

import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.PositiveOrZero;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.ApplicationRepository;
import com.jsp.ojpms.repository.JobRepository;
import com.jsp.ojpms.repository.UserRepository;

@RestController
@RequestMapping("/api/jobs")
public class JobRestController {

    private final JobRepository jobRepository;
    private final ApplicationRepository applicationRepository;
    private final UserRepository userRepository;

    public JobRestController(JobRepository jobRepository, ApplicationRepository applicationRepository,
            UserRepository userRepository) {
        this.jobRepository = jobRepository;
        this.applicationRepository = applicationRepository;
        this.userRepository = userRepository;
    }

    @GetMapping
    public List<ApiModels.JobResponse> list(@RequestParam(required = false) String search) {
        List<Job> jobs = search == null || search.isBlank()
                ? jobRepository.findAll()
                : jobRepository.findByTitleContainingIgnoreCaseOrLocationContainingIgnoreCase(search, search);
        return jobs.stream().map(ApiModels.JobResponse::from).toList();
    }

    @GetMapping("/{id}")
    public ApiModels.JobResponse get(@PathVariable int id) {
        return ApiModels.JobResponse.from(findJob(id));
    }

    @GetMapping("/mine")
    @PreAuthorize("hasRole('RECRUITER')")
    public List<ApiModels.JobResponse> mine(Authentication authentication) {
        User recruiter = currentUser(authentication);
        return jobRepository.findByRecuriterId(recruiter.getId()).stream()
                .map(ApiModels.JobResponse::from).toList();
    }

    @PostMapping
    @PreAuthorize("hasRole('RECRUITER')")
    public ApiModels.JobResponse create(@Valid @RequestBody JobRequest request, Authentication authentication) {
        Job job = new Job(request.title(), request.description(), request.location(), request.salary(),
                request.lastDate(), currentUser(authentication));
        return ApiModels.JobResponse.from(jobRepository.save(job));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('RECRUITER')")
    public ApiModels.JobResponse update(@PathVariable int id, @Valid @RequestBody JobRequest request,
            Authentication authentication) {
        Job job = findJob(id);
        ensureOwner(job, authentication);
        job.setTitle(request.title());
        job.setDescription(request.description());
        job.setLocation(request.location());
        job.setSalary(request.salary());
        job.setLastDate(request.lastDate());
        return ApiModels.JobResponse.from(jobRepository.save(job));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('RECRUITER')")
    public void delete(@PathVariable int id, Authentication authentication) {
        Job job = findJob(id);
        ensureOwner(job, authentication);
        applicationRepository.deleteByJobId(id);
        jobRepository.delete(job);
    }

    private Job findJob(int id) {
        return jobRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Job not found"));
    }

    private User currentUser(Authentication authentication) {
        return userRepository.findByEmail(authentication.getName())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not found"));
    }

    private void ensureOwner(Job job, Authentication authentication) {
        if (job.getRecuriter().getId() != currentUser(authentication).getId()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN,
                    "Only the recruiter who posted the job can change it");
        }
    }

    public record JobRequest(@NotBlank String title, @NotBlank String description, @NotBlank String location,
            @PositiveOrZero double salary, @NotBlank String lastDate) {
    }
}
