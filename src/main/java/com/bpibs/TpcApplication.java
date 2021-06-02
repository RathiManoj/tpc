package com.bpibs;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.bpibs.model.auth.Role;
import com.bpibs.repo.RoleRepo;

@SpringBootApplication
public class TpcApplication {

	public static void main(String[] args) {
		SpringApplication.run(TpcApplication.class, args);
	}

	@Bean
	public CommandLineRunner loadRoles(RoleRepo repo) {
		return (args)->{
			repo.save(new Role(1,"ADMIN"));
			repo.save(new Role(2,"STUDENT"));
		};
	}

}
