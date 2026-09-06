package com.jsp.ojpms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jsp.ojpms.entity.Job;

public interface JobRepository extends JpaRepository<Job, Integer> {
    List<Job> findByTitleContainingIgnoreCaseOrLocationContainingIgnoreCase(String title, String location);

    List<Job> findByRecuriterId(int recruiterId);
}
