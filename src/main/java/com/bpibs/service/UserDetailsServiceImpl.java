package com.bpibs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bpibs.model.auth.MyUserDetails;
import com.bpibs.model.auth.User;
import com.bpibs.repo.UserRepo;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	UserRepo repo;

	@Autowired
	PasswordEncoder encoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = repo.findByUsername(username);
		if (user == null)
			throw new UsernameNotFoundException("User not found with username: " + username);
		return new MyUserDetails(user);
	}

	public User save(User user) {
		if (repo.findByUsername(user.getUsername()) != null ? true : false) {
			user.setActive(false);
			return user;
		}
		user.setPassword(encoder.encode(user.getPassword()));
		user.setActive(true);
		repo.save(user);
		return user;
	}

	public User findByUsername(String name) {
		return repo.findByUsername(name);
	}

	public boolean validatePassword(User user, String currentPassword) {
		return encoder.matches(currentPassword, user.getPassword());
	}

	public User changeUserPassword(User user, String password) {
		user.setPassword(encoder.encode(password));
		return repo.save(user);
	}
}
