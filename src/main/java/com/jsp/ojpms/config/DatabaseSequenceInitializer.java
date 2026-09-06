package com.jsp.ojpms.config;

import java.util.List;

import jakarta.annotation.PostConstruct;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class DatabaseSequenceInitializer {

    private final JdbcTemplate jdbcTemplate;

    public DatabaseSequenceInitializer(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @PostConstruct
    public void synchronizeSequences() {
        synchronize("users", "users_seq");
        synchronize("jobs", "jobs_seq");
        synchronize("applications", "applications_seq");
        synchronize("saved_job", "saved_job_seq");
    }

    private void synchronize(String table, String sequence) {
        if (!tableExists(table) || !sequenceExists(sequence)) {
            return;
        }
        jdbcTemplate.queryForObject(
                "SELECT setval(?::regclass, GREATEST(COALESCE((SELECT MAX(id) FROM " + table
                        + "), 1), 1), true)",
                Long.class, sequence);
    }

    private boolean tableExists(String table) {
        return Boolean.TRUE.equals(jdbcTemplate.queryForObject(
                "SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = ?)",
                Boolean.class, table));
    }

    private boolean sequenceExists(String sequence) {
        List<String> sequences = jdbcTemplate.queryForList(
                "SELECT sequence_name FROM information_schema.sequences WHERE sequence_schema = 'public' AND sequence_name = ?",
                String.class, sequence);
        return !sequences.isEmpty();
    }
}
