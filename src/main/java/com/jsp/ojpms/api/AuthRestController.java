package com.jsp.ojpms.api;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.repository.UserRepository;

@RestController
@RequestMapping("/api/auth")
public class AuthRestController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthRestController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/health")
    public String health() {
        return "ok";
    }

    @PostMapping("/register")
    public ResponseEntity<ApiModels.UserResponse> register(@Valid @RequestBody RegisterRequest request) {
        if (userRepository.existsByEmail(request.email())) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Email is already registered");
        }
        String role = request.role() == null || request.role().isBlank()
                ? "USER"
                : request.role().trim().toUpperCase();
        if (!role.equals("USER") && !role.equals("RECRUITER")) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Role must be USER or RECRUITER");
        }
        User user = new User(request.name(), request.email(), passwordEncoder.encode(request.password()), role);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiModels.UserResponse.from(userRepository.save(user)));
    }

    @GetMapping("/me")
    public ApiModels.UserResponse me(Authentication authentication) {
        return userRepository.findByEmail(authentication.getName())
                .map(ApiModels.UserResponse::from)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
    }

    public record RegisterRequest(@NotBlank String name, @Email @NotBlank String email,
            @Size(min = 8) String password, String role) {
    }
}
