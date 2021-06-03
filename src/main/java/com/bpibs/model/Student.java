package com.bpibs.model;

import java.util.List;
import java.util.Set;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Student {

	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
	private String id;
	private boolean active;
	private String enrollNo;
	private String name;
	private String gender;
	private String email;
	private String mobile;
	private String image;
	private String linkedinUrl;
	private String githubUrl;
	@ManyToOne
	private Course course;
	private long startYear;
	private long endYear;

	@ManyToMany
	@JoinTable(name = "student_job", joinColumns = @JoinColumn(name = "student_id"), inverseJoinColumns = @JoinColumn(name = "job_id"))
	private Set<Job> jobs;

	@OneToMany
	@ElementCollection
	private List<Education> education;

	public Student() {

	}

	public Student(boolean active, String enrollNo, String name, String gender, String email, String mobile,
			Course course, long startYear, long endYear, Set<Job> jobs) {
		super();
		this.active = active;
		this.enrollNo = enrollNo;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.mobile = mobile;
		this.course = course;
		this.startYear = startYear;
		this.endYear = endYear;
		this.jobs = jobs;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getEnrollNo() {
		return enrollNo;
	}

	public void setEnrollNo(String enrollNo) {
		this.enrollNo = enrollNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLinkedinUrl() {
		return linkedinUrl;
	}

	public void setLinkedinUrl(String linkedinUrl) {
		this.linkedinUrl = linkedinUrl;
	}

	public String getGithubUrl() {
		return githubUrl;
	}

	public void setGithubUrl(String githubUrl) {
		this.githubUrl = githubUrl;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public long getStartYear() {
		return startYear;
	}

	public void setStartYear(long startYear) {
		this.startYear = startYear;
	}

	public long getEndYear() {
		return endYear;
	}

	public void setEndYear(long endYear) {
		this.endYear = endYear;
	}

	public List<Education> getEducation() {
		return education;
	}

	public void setEducation(List<Education> education) {
		this.education = education;
	}

	public Set<Job> getJobs() {
		return jobs;
	}

	public void setJobs(Set<Job> jobs) {
		this.jobs = jobs;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", gender=" + gender + ", email=" + email + ", mobile=" + mobile
				+ ", image=" + image + ", linkedinUrl=" + linkedinUrl + ", githubUrl=" + githubUrl + ", course="
				+ course + "]";
	}
}
