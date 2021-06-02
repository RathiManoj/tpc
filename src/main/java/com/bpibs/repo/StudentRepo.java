package com.bpibs.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpibs.model.Course;
import com.bpibs.model.Student;

public interface StudentRepo extends JpaRepository<Student, String> {
	
	public long countByCourse(Course course);

	public Student findByEmail(String email);

	public Student findByName(String name);
	
	public Student findByEnrollNo(String enrollNo);
	
	public List<Student> findByOrderByEnrollNoAsc();
	
	public List<Student> findByOrderByNameAsc();
	
	public List<Student> findByCourseOrderByNameAsc(Course course);
}
