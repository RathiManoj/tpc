package com.bpibs.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpibs.model.Course;
import com.bpibs.model.Job;

public interface JobRepo extends JpaRepository<Job, String> {

	long countByActive(boolean active);

	List<Job> findByCourses(Course course);

	List<Job> findByCoursesAndActive(Course course, boolean active);

	List<Job> findByActive(boolean active);

}
