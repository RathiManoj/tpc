package com.bpibs.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpibs.model.College;

public interface CollegeRepo extends JpaRepository<College, String> {

}
