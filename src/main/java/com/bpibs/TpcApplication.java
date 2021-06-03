package com.bpibs;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashSet;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.bpibs.model.College;
import com.bpibs.model.Course;
import com.bpibs.model.Job;
import com.bpibs.model.Student;
import com.bpibs.model.auth.Role;
import com.bpibs.model.auth.User;
import com.bpibs.repo.CollegeRepo;
import com.bpibs.repo.CourseRepo;
import com.bpibs.repo.JobRepo;
import com.bpibs.repo.RoleRepo;
import com.bpibs.repo.StudentRepo;
import com.bpibs.service.UserDetailsServiceImpl;

@SpringBootApplication
public class TpcApplication {

	public static void main(String[] args) {
		SpringApplication.run(TpcApplication.class, args);
	}

	@Bean
	public CommandLineRunner loadData(RoleRepo roleRepo, UserDetailsServiceImpl userService, CollegeRepo collegeRepo,
			CourseRepo courseRepo, JobRepo jobRepo, StudentRepo studentRepo) {
		return (args) -> {
			// Roles
			roleRepo.save(new Role(1, "ADMIN"));
			roleRepo.save(new Role(2, "STUDENT"));

			// Users
			userService.save(new User("Admin", "admin@tpc.com", "password", true,
					new HashSet<Role>(Arrays.asList(roleRepo.getOne(1)))));
			userService.save(new User("Manoj", "manoj@email.com", "password", true,
					new HashSet<Role>(Arrays.asList(roleRepo.getOne(2)))));
			userService.save(new User("Trisha", "trisha@email.com", "password", true,
					new HashSet<Role>(Arrays.asList(roleRepo.getOne(2)))));
			userService.save(new User("Vrinda", "vrinda@email.com", "password", true,
					new HashSet<Role>(Arrays.asList(roleRepo.getOne(2)))));
			userService.save(new User("Tushar", "tushar@email.com", "password", true,
					new HashSet<Role>(Arrays.asList(roleRepo.getOne(2)))));
			userService.save(new User("Rohit", "rohit@email.com", "password", true,
					new HashSet<Role>(Arrays.asList(roleRepo.getOne(2)))));

			// College Details
			collegeRepo.save(new College("Bhai Parmanand Institute of Business Studies", "Opp. madhuban Colony",
					"Shakarpur", "Delhi", "110092", "India", "https://bpibs.in", "Mr. Kaushal Mehta",
					"Training & Placement Officer", "5697456225", "tpo@bpibs.in"));

			// Courses
			Course mca = courseRepo.save(new Course("Master of Computer Application", 3, 180));
			Course mba = courseRepo.save(new Course("Master of Business Administration", 3, 180));
			Course bvoc = courseRepo.save(new Course("Bachelor of Vocation", 3, 180));

			// Jobs
			Job editor = jobRepo.save(new Job("Codingiri", "Internship", "Video Editor", Arrays.asList(mca, bvoc),
					"http://codingiri.tech", "New Delhi", LocalDate.now(), true));
			Job writer = jobRepo.save(new Job("Codingiri", "Part-time", "Content Writer", Arrays.asList(mca, mba, bvoc),
					"http://codingiri.tech", "New Delhi", LocalDate.now(), true));
			Job sd = jobRepo.save(new Job("Codingiri", "Full-time", "SDE", Arrays.asList(mca), "http://codingiri.tech",
					"New Delhi", LocalDate.now(), true));

			// Students
			studentRepo.save(new Student(true, "101", "Manoj", "Male", "manoj@email.com", "2365987415", mca, 2018, 2021,
					new HashSet<Job>(Arrays.asList(sd))));
			studentRepo.save(new Student(true, "102", "Trisha", "Female", "trisha@email.com", "2365987415", mca, 2018,
					2021, new HashSet<Job>(Arrays.asList(writer, editor))));
			studentRepo.save(new Student(true, "103", "Vrinda", "Female", "vrinda@email.com", "2365987415", mca, 2018,
					2021, new HashSet<Job>(Arrays.asList(sd, writer))));
			studentRepo.save(new Student(true, "104", "Tushar", "Male", "tushar@email.com", "2365987415", mba, 2018,
					2021, null));
			studentRepo.save(new Student(true, "105", "Rohit", "Male", "rohit@email.com", "2365987415", bvoc, 2018,
					2021, new HashSet<>(Arrays.asList(writer))));
		};
	}

}
