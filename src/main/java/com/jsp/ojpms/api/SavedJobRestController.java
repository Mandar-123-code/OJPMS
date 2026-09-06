package com.jsp.ojpms.api;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.SavedJob;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.JobRepository;
import com.jsp.ojpms.repository.SavedJobRepository;
import com.jsp.ojpms.repository.UserRepository;

@RestController
@RequestMapping("/api/saved-jobs")
@PreAuthorize("hasRole('USER')")
public class SavedJobRestController {

    private final SavedJobRepository savedJobRepository;
    private final JobRepository jobRepository;
    private final UserRepository userRepository;

    public SavedJobRestController(SavedJobRepository savedJobRepository, JobRepository jobRepository,
            UserRepository userRepository) {
        this.savedJobRepository = savedJobRepository;
        this.jobRepository = jobRepository;
        this.userRepository = userRepository;
    }

    @GetMapping
    public List<ApiModels.SavedJobResponse> list(Authentication authentication) {
        return savedJobRepository.findByUserId(currentUser(authentication).getId()).stream()
                .map(ApiModels.SavedJobResponse::from).toList();
    }

    @PostMapping("/{jobId}")
    public ApiModels.SavedJobResponse save(@PathVariable int jobId, Authentication authentication) {
        User user = currentUser(authentication);
        if (savedJobRepository.existsByUserIdAndJobId(user.getId(), jobId)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Job is already saved");
        }
        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Job not found"));
        SavedJob savedJob = new SavedJob();
        savedJob.setUser(user);
        savedJob.setJob(job);
        return ApiModels.SavedJobResponse.from(savedJobRepository.save(savedJob));
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id, Authentication authentication) {
        SavedJob savedJob = savedJobRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Saved job not found"));
        if (savedJob.getUser().getId() != currentUser(authentication).getId()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "This saved job belongs to another user");
        }
        savedJobRepository.delete(savedJob);
    }

    private User currentUser(Authentication authentication) {
        return userRepository.findByEmail(authentication.getName())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "User not found"));
    }
}
