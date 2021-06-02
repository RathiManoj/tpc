package com.bpibs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bpibs.model.Course;
import com.bpibs.repo.CourseRepo;

@Controller
public class CourseController {

	@Autowired
	CourseRepo repo;

	@GetMapping("/college/courses")
	public String index(Model model) {
		model.addAttribute("courses", repo.findAll());
		return "college/courses/index";
	}

	@PostMapping("/college/courses")
	public String saveCourse(@ModelAttribute Course course) {
		repo.save(course);
		return "redirect:/college/courses";
	}

	@GetMapping("/college/courses/new")
	public String newCourseForm() {
		return "college/courses/new";
	}
}
