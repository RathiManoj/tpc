package com.bpibs.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bpibs.model.auth.Role;

public interface RoleRepo extends JpaRepository<Role, Integer> {

	Role findByRole(String role);
}
