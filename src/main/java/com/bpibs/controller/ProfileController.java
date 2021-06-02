package com.bpibs.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bpibs.model.Student;
import com.bpibs.model.auth.MyUserDetails;
import com.bpibs.model.auth.User;
import com.bpibs.repo.StudentRepo;
import com.bpibs.service.UserDetailsServiceImpl;

@Controller
public class ProfileController {

	@Autowired
	StudentRepo studentRepo;

	@Autowired
	UserDetailsServiceImpl userService;

	@GetMapping("/update-password")
	public String updatePaswordForm() {
		return "update-password";
	}

	@PostMapping("/update-password")
	public String updatePasword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, RedirectAttributes attributes) {
		User user = userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

		if (userService.validatePassword(user, currentPassword)) {

			userService.changeUserPassword(user, newPassword);
			attributes.addFlashAttribute("message", "Password updated.");
		} else {

			attributes.addFlashAttribute("error", "Old Password is incorrect!");
			return "redirect:/update-password";
		}

		return "redirect:/home";
	}

	@GetMapping("/update-profile")
	public String updateProfileForm(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getPrincipal() instanceof UserDetails) {
			MyUserDetails userDetails = (MyUserDetails) auth.getPrincipal();
			User user = userDetails.getUser();

			if (auth.getAuthorities().toString().contains("ADMIN")) {
				model.addAttribute("user", user);
				return "admin/update-profile";
			} else if (auth.getAuthorities().toString().contains("STUDENT")) {
				model.addAttribute("student", studentRepo.findByEmail(user.getUsername()));
				return "student/update-profile";
			}
		}
		return "redirect:/logout";
	}

	@PostMapping("/update-profile")
	public String updateProfile(@RequestParam("image") MultipartFile image, @RequestParam("name") String name,
			@RequestParam("enrollNo") String enrollNo, @RequestParam("email") String email,
			@RequestParam("gender") String gender, @RequestParam("mobile") String mobile,
			@RequestParam("linkedinUrl") String linkedinUrl, @RequestParam("githubUrl") String githubUrl, Model model,
			RedirectAttributes attributes) {

		attributes.addFlashAttribute("message", "Profile updated successfully.");

		String imageFileName = "";

		if (image.getSize() != 0) {
			String originalFileName = StringUtils.cleanPath(image.getOriginalFilename());
			imageFileName = String.join(".", "profile-image", originalFileName.split("\\.")[1]);
		}

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.getPrincipal() instanceof UserDetails) {
			MyUserDetails userDetails = (MyUserDetails) auth.getPrincipal();
			User user = userDetails.getUser();

			if (auth.getAuthorities().toString().contains("ADMIN")) {

				model.addAttribute("user", user);
				return "admin/update-profile";
			} else if (auth.getAuthorities().toString().contains("STUDENT")) {

				Student student = studentRepo.findByEmail(user.getUsername());
				student.setName(name);
				student.setEnrollNo(enrollNo);
				student.setEmail(email);
				student.setGender(gender);
				student.setMobile(mobile);
				student.setLinkedinUrl(linkedinUrl);
				student.setGithubUrl(githubUrl);

				if (image.getSize() != 0)
					student.setImage(imageFileName);

				studentRepo.save(student);

				if (image.getSize() != 0) {
					String uploadDir = "user-data/" + student.getId();
					saveFile(uploadDir, imageFileName, image);
				}

			}
		}
		return "redirect:/home";
	}

	public void saveFile(String uploadDir, String fileName, MultipartFile file) {
		Path uploadPath = Paths.get(uploadDir);

		try {
			if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}

			try (InputStream inputStream = file.getInputStream()) {
				Path filePath = uploadPath.resolve(fileName);
				Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException ioe) {
				throw new IOException("Could not save file: " + fileName, ioe);
			}

		} catch (IOException e) {

		}

	}
}
