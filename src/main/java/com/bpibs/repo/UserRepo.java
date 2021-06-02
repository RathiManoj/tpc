package com.bpibs.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpibs.model.auth.User;

public interface UserRepo extends JpaRepository<User, String> {

	User findByUsername(String username);

}
