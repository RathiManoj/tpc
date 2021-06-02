package com.bpibs.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpibs.model.Course;

public interface CourseRepo extends JpaRepository<Course, String> {

	public Course findByName(String name);

}
