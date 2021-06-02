package com.bpibs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bpibs.model.Job;
import com.bpibs.model.Student;
import com.bpibs.repo.CourseRepo;
import com.bpibs.repo.JobRepo;
import com.bpibs.repo.StudentRepo;

@Controller
public class JobController {

	@Autowired
	CourseRepo courseRepo;

	@Autowired
	JobRepo jobRepo;

	@Autowired
	StudentRepo studentRepo;

	@GetMapping("/jobs")
	public String index(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth.getAuthorities().toString().contains("ADMIN")) {

			model.addAttribute("jobs", jobRepo.findByActive(true));
			model.addAttribute("courses", courseRepo.findAll());
			return "college/jobs/index";

		} else if (auth.getAuthorities().toString().contains("STUDENT")) {
			Student student = studentRepo.findByEmail(auth.getName());
			model.addAttribute("student", student);
			List<Job> jobs = jobRepo.findByCoursesAndActive(student.getCourse(), true);
			jobs.removeAll(student.getJobs());
			model.addAttribute("jobs", jobs);
			return "student/jobs";
		}

		return "redirect:/logout";
	}

	@GetMapping("/jobs/apply/{id}")
	public String applyForJob(@PathVariable("id") String id, RedirectAttributes attributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Student student = studentRepo.findByEmail(auth.getName());
		Job job = jobRepo.getOne(id);
		student.getJobs().add(job);
		studentRepo.save(student);
		attributes.addFlashAttribute("message",
				"Sucessfully applied for the job title " + job.getJobTitle() + " at " + job.getCompanyName());
		return "redirect:/jobs";
	}

	@GetMapping("/jobs/withdraw/{id}")
	public String withdrawForJob(@PathVariable("id") String id, RedirectAttributes attributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Student student = studentRepo.findByEmail(auth.getName());
		Job job = jobRepo.getOne(id);
		student.getJobs().remove(job);
		studentRepo.save(student);
		attributes.addFlashAttribute("message",
				"Application withdrawn for the job title " + job.getJobTitle() + " at " + job.getCompanyName());
		return "redirect:/jobs";
	}

	@GetMapping("/jobs/applied")
	public String applliedJobs(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Student student = studentRepo.findByEmail(auth.getName());

		model.addAttribute("jobs", student.getJobs());

		return "student/jobs-applied";
	}

	@GetMapping("/jobs/{id}/{status}")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String setJobActive(@PathVariable("id") String id, @PathVariable("status") String status,
			RedirectAttributes attributes) {

		Job job = jobRepo.getOne(id);

		if (job == null) {
			attributes.addFlashAttribute("error", "Invalid Job!");
			return "redirect:/job";
		}

		if (status.equals("activate")) {
			job.setActive(true);
		} else if (status.equals("deactivate")) {
			job.setActive(false);
		}
		jobRepo.save(job);
		attributes.addFlashAttribute("message", "Job status updated");
		return "redirect:/jobs";
	}

	@GetMapping("/jobs/new")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String newJobForm(Model model) {
		model.addAttribute("courses", courseRepo.findAll());
		return "college/jobs/new";
	}

	@PostMapping("/jobs")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String newJob(@ModelAttribute Job job) {
		job.setActive(true);
		jobRepo.save(job);
		return "redirect:/jobs";
	}

	@GetMapping("/jobs/byCourse/{courseId}")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String jobByCourse(@PathVariable String courseId, Model model) {
		model.addAttribute("courses", courseRepo.findAll());
		model.addAttribute("jobs", jobRepo.findByCourses(courseRepo.getOne(courseId)));
		return "college/jobs/index";
	}
}
