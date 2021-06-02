package com.bpibs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bpibs.model.auth.MyUserDetails;
import com.bpibs.model.auth.User;
import com.bpibs.repo.JobRepo;
import com.bpibs.repo.RoleRepo;
import com.bpibs.repo.StudentRepo;
import com.bpibs.repo.UserRepo;
import com.bpibs.service.UserDetailsServiceImpl;

@Controller
public class HomeController {

	@Autowired
	RoleRepo roleRepo;

	@Autowired
	UserRepo userRepo;

	@Autowired
	StudentRepo studentRepo;

	@Autowired
	JobRepo jobRepo;

	@Autowired
	UserDetailsServiceImpl userService;

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/header")
	public String header(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getPrincipal() instanceof UserDetails) {
			MyUserDetails userDetails = (MyUserDetails) auth.getPrincipal();
			User user = userDetails.getUser();
			model.addAttribute("username", user.getName());
			if (userDetails.getAuthorities().toString().contains("ADMIN")) {
				return "admin/header";
			} else if (userDetails.getAuthorities().toString().contains("STUDENT")) {
				return "student/header";
			}
		}
		return "header";
	}

	@GetMapping("/footer")
	public String footer() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getPrincipal() instanceof UserDetails) {
			MyUserDetails userDetails = (MyUserDetails) auth.getPrincipal();
			if (userDetails.getAuthorities().toString().contains("ADMIN")) {
				return "admin/footer";
			} else if (userDetails.getAuthorities().toString().contains("STUDENT")) {
				return "student/footer";
			}
		}
		return "footer";
	}

	@GetMapping("/error")
	public String errorPage() {
		return "error/error";
	}

	@GetMapping("/register")
	public String registerForm(Model model) {
		model.addAttribute("roles", roleRepo.findAll());
		return "register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute User user) {
		userService.save(user);
		return "redirect:/";
	}

	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	@GetMapping("/home")
	public String home(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getPrincipal() instanceof UserDetails) {
			MyUserDetails userDetails = (MyUserDetails) auth.getPrincipal();
			User user = userDetails.getUser();

			if (auth.getAuthorities().toString().contains("ADMIN")) {
				model.addAttribute("user", user);
				model.addAttribute("activeJobs",jobRepo.countByActive(true));
				model.addAttribute("deactiveJobs",jobRepo.countByActive(false));
				return "admin/index";
			} else if (auth.getAuthorities().toString().contains("STUDENT")) {
				model.addAttribute("student", studentRepo.findByEmail(user.getUsername()));
				return "student/index";
			}
		}
		return "redirect:/logout";
	}
}
