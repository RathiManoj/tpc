package com.bpibs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bpibs.model.College;
import com.bpibs.model.Course;
import com.bpibs.repo.CollegeRepo;
import com.bpibs.repo.CourseRepo;
import com.bpibs.repo.StudentRepo;

@Controller
public class CollegeController {

	@Autowired
	private CollegeRepo collegeRepo;

	@Autowired
	private CourseRepo courseRepo;

	@Autowired
	private StudentRepo studentRepo;

	@GetMapping("/college-details")
	public String getCollegeDetails(Model model) {
		List<College> collegeList = collegeRepo.findAll();
		if (collegeList.size() > 0) {
			model.addAttribute("college", collegeList.get(0));
			List<Course> coursesList = courseRepo.findAll();
			Map<Course, Long> map = new HashMap<>();
			for (Course course : coursesList) {
				map.put(course, studentRepo.countByCourse(course));
			}
			model.addAttribute("courses", map);
		}
		return "college-details";
	}

	@PreAuthorize("hasAuthority('ADMIN')")
	@GetMapping("/college-preferences")
	public String updateCollegePrefrencesFrom(Model model) {
		List<College> collegeList = collegeRepo.findAll();
		if (collegeList.size() > 0) {
			model.addAttribute("college", collegeList.get(0));
		}
		return "college/college-preferences";
	}

	@PreAuthorize("hasAuthority('ADMIN')")
	@PostMapping("/college-preferences")
	public String updateCollegePrefrences(@ModelAttribute College college) {
		collegeRepo.save(college);
		return "redirect:/college-details";
	}
}
