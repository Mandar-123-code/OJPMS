package com.jsp.ojpms.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;

@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner createDummyUsers(
            UserRepository userRepository,
            PasswordEncoder passwordEncoder) {

        return args -> {

            // ==========================================
            // DUMMY JOB SEEKER
            // ==========================================

            if (!userRepository.existsByEmail(
                    "user@smarthire.com")) {

                User user = new User(

                        "Demo Job Seeker",

                        "user@smarthire.com",

                        passwordEncoder.encode(
                                "user123"),

                        "JOB_SEEKER");

                userRepository.save(user);

                System.out.println(
                        "=================================");

                System.out.println(
                        "Dummy Job Seeker Created");

                System.out.println(
                        "Email    : user@smarthire.com");

                System.out.println(
                        "Password : user123");

                System.out.println(
                        "=================================");
            }

            // ==========================================
            // DUMMY RECRUITER
            // ==========================================

            if (!userRepository.existsByEmail(
                    "recruiter@smarthire.com")) {

                User recruiter = new User(

                        "Demo Recruiter",

                        "recruiter@smarthire.com",

                        passwordEncoder.encode(
                                "recruiter123"),

                        "RECRUITER");

                userRepository.save(
                        recruiter);

                System.out.println(
                        "=================================");

                System.out.println(
                        "Dummy Recruiter Created");

                System.out.println(
                        "Email    : recruiter@smarthire.com");

                System.out.println(
                        "Password : recruiter123");

                System.out.println(
                        "=================================");
            }
        };
    }
}