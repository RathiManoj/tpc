package com.bpibs.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpibs.model.Education;

public interface EducationRepo extends JpaRepository<Education, String> {

}
