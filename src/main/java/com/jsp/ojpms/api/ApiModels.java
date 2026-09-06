package com.jsp.ojpms.api;

import java.util.List;

import com.jsp.ojpms.entity.Application;
import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.SavedJob;
import com.jsp.ojpms.entity.User;

public final class ApiModels {

    private ApiModels() {
    }

    public record UserResponse(int id, String name, String email, String role) {
        public static UserResponse from(User user) {
            return new UserResponse(user.getId(), user.getName(), user.getEmail(), user.getRole());
        }
    }

    public record JobResponse(int id, String title, String description, String location,
            double salary, String lastDate, int recruiterId) {
        public static JobResponse from(Job job) {
            return new JobResponse(job.getId(), job.getTitle(), job.getDescription(), job.getLocation(),
                    job.getSalary(), job.getLastDate(), job.getRecuriter().getId());
        }
    }

    public record ApplicationResponse(int id, int jobId, int userId, String status) {
        public static ApplicationResponse from(Application application) {
            return new ApplicationResponse(application.getId(), application.getJob().getId(),
                    application.getUser().getId(), application.getStatus());
        }
    }

    public record SavedJobResponse(int id, int jobId, int userId) {
        public static SavedJobResponse from(SavedJob savedJob) {
            return new SavedJobResponse(savedJob.getId(), savedJob.getJob().getId(), savedJob.getUser().getId());
        }
    }

    public record PageResponse<T>(List<T> items, int count) {
    }
}
