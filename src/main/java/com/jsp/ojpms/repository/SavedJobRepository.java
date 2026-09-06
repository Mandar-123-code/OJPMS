package com.jsp.ojpms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jsp.ojpms.entity.SavedJob;

public interface SavedJobRepository extends JpaRepository<SavedJob, Integer> {
    boolean existsByUserIdAndJobId(int userId, int jobId);

    List<SavedJob> findByUserId(int userId);
}
