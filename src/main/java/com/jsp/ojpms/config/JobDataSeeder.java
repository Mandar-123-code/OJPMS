package com.jsp.ojpms.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.JobRepository;
import com.jsp.ojpms.repository.UserRepository;
import com.jsp.ojpms.util.PasswordUtil;

@Component
public class JobDataSeeder implements CommandLineRunner {

    private final JobRepository jobRepository;
    private final UserRepository userRepository;

    public JobDataSeeder(JobRepository jobRepository,
            UserRepository userRepository) {

        this.jobRepository = jobRepository;
        this.userRepository = userRepository;
    }

    @Override
    public void run(String... args) {

        // TCS
        User tcs = getOrCreateRecruiter(
                "TCS",
                "tcs@smarthire.com");

        // Infosys
        User infosys = getOrCreateRecruiter(
                "Infosys",
                "infosys@smarthire.com");

        // Wipro
        User wipro = getOrCreateRecruiter(
                "Wipro",
                "wipro@smarthire.com");

        // ==========================================
        // 1. JAVA DEVELOPER - TCS
        // ==========================================

        if (!jobExists("Java Developer", "Pune")) {

            Job job = new Job();

            job.setTitle("Java Developer");
            job.setDescription("Full Time");
            job.setLocation("Pune");
            job.setSalary(12);
            job.setLastDate("31-12-2026");
            job.setRecuriter(tcs);

            jobRepository.save(job);
        }

        // ==========================================
        // 2. REACT DEVELOPER - INFOSYS
        // ==========================================

        if (!jobExists("React Developer", "Mumbai")) {

            Job job = new Job();

            job.setTitle("React Developer");
            job.setDescription("Full Time");
            job.setLocation("Mumbai");
            job.setSalary(10);
            job.setLastDate("31-12-2026");
            job.setRecuriter(infosys);

            jobRepository.save(job);
        }

        // ==========================================
        // 3. FULL STACK DEVELOPER - WIPRO
        // ==========================================

        if (!jobExists("Full Stack Developer", "Bangalore")) {

            Job job = new Job();

            job.setTitle("Full Stack Developer");
            job.setDescription("Full Time");
            job.setLocation("Bangalore");
            job.setSalary(18);
            job.setLastDate("31-12-2026");
            job.setRecuriter(wipro);

            jobRepository.save(job);
        }

        System.out.println("======================================");
        System.out.println("SMARTHIRE JOB DATA SEEDED SUCCESSFULLY");
        System.out.println("======================================");
    }

    private boolean jobExists(String title, String location) {

        return jobRepository
                .findAll()
                .stream()
                .anyMatch(job -> job.getTitle().equalsIgnoreCase(title)
                        &&
                        job.getLocation().equalsIgnoreCase(location));
    }

    private User getOrCreateRecruiter(String name, String email) {

        return userRepository.findByEmail(email)
                .orElseGet(() -> {

                    User recruiter = new User();

                    recruiter.setName(name);
                    recruiter.setEmail(email);

                    // Existing project uses Base64 login
                    recruiter.setPassword(
                            PasswordUtil.encode("123456"));

                    recruiter.setRole("RECRUITER");

                    return userRepository.save(recruiter);
                });
    }
}