package com.jsp.ojpms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import com.jsp.ojpms.entity.Application;

public interface ApplicationRepository extends JpaRepository<Application, Integer> {

    boolean existsByUserIdAndJobId(int userId, int jobId);

    List<Application> findByUserId(int userId);

    List<Application> findByJobId(int jobId);

    Application findByUserIdAndJobId(int userId, int jobId);

    List<Application> findByStatus(String status);

    @Modifying
    @Transactional
    void deleteByJobId(int jobId);
}