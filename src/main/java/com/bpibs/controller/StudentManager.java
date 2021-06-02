package com.bpibs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bpibs.model.Student;
import com.bpibs.model.auth.Role;
import com.bpibs.model.auth.User;
import com.bpibs.repo.CourseRepo;
import com.bpibs.repo.RoleRepo;
import com.bpibs.repo.StudentRepo;
import com.bpibs.service.UserDetailsServiceImpl;

@Controller
public class StudentManager {

	@Autowired
	private StudentRepo studentRepo;
	@Autowired
	private CourseRepo courseRepo;

	@Autowired
	RoleRepo roleRepo;
	@Autowired
	UserDetailsServiceImpl userService;

	@GetMapping("/college/students")
	public String listStudents(Model model) {
		model.addAttribute("courses", courseRepo.findAll());
		model.addAttribute("students", studentRepo.findByOrderByNameAsc());
		return "/college/students/index";
	}

	@GetMapping("/college/students/new")
	public String importStudentsForm(Model model) {
		model.addAttribute("courses", courseRepo.findAll());
		return "college/students/new";
	}

	@PostMapping("/college/students")
	public String saveSingleStudent(@ModelAttribute Student student) {
		saveStudentHelper(student);
		return "redirect:/college/students";
	}

	@PostMapping("/college/students/importStudents")
	public String importStudents(@RequestParam MultipartFile file, @RequestParam String course,
			@RequestParam long startYear, @RequestParam long endYear) {
		if (!file.isEmpty()) {
			try (Reader reader = new BufferedReader(new InputStreamReader(file.getInputStream()));
					CSVParser parser = new CSVParser(reader, CSVFormat.EXCEL.withHeader().withDelimiter(','))) {

				for (CSVRecord record : parser) {
					Student student = new Student();
					student.setEnrollNo(record.get("Roll_NO"));
					student.setName(record.get("NAME"));
					student.setGender(record.get("GENDER"));
					student.setEmail(record.get("EMAIL"));
					student.setMobile(record.get("MOBILE"));
					student.setCourse(courseRepo.getOne(course));
					student.setStartYear(startYear);
					student.setEndYear(endYear);

					saveStudentHelper(student);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/college/students";
	}

	@GetMapping("/college/students/byCourse/{courseId}")
	public String studentsByCourse(@PathVariable String courseId, Model model) {
		model.addAttribute("courses", courseRepo.findAll());
		model.addAttribute("students", studentRepo.findByCourseOrderByNameAsc(courseRepo.getOne(courseId)));
		return "college/students/index";
	}

	public void saveStudentHelper(Student student) {
		student.setActive(true);
		studentRepo.save(student);

		User user = new User();
		user.setName(student.getName());
		user.setUsername(student.getEmail());
		user.setActive(student.isActive());
		Set<Role> roles = new HashSet<>();
		roles.add(roleRepo.findByRole("STUDENT"));
		user.setRoles(roles);

		user.setPassword(student.getEmail());
		userService.save(user);
	}
}
