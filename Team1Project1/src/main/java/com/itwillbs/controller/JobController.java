package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/jobs")
public class JobController {

    private final JdbcTemplate jdbcTemplate;

    public JobController(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 직종 가져오기
    @GetMapping("/categories")
    public List<Map<String, Object>> getJobCategories() {
        String sql = "SELECT id, name FROM job_categories";
        return jdbcTemplate.queryForList(sql);
    }

    // 특정 직종에 속하는 직무 가져오기
    @GetMapping("/positions")
    public List<Map<String, Object>> getJobPositions(@RequestParam("categoryId") int categoryId) {
        String sql = "SELECT id, name FROM job_positions WHERE category_id = ?";
        return jdbcTemplate.queryForList(sql, categoryId);
    }
}