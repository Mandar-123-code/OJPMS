package com.jsp.ojpms.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "jobs")
public class Job {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String title;
	private String description;
	private String location;
	private double salary;
	private String lastDate;

	@ManyToOne
	@JoinColumn(name = "recuriter_id")
	private User recuriter;

	public Job() {
		super();

	}

	public Job(String title, String description, String location, double salary, String lastDate, User recuriter) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
		this.salary = salary;
		this.lastDate = lastDate;
		this.recuriter = recuriter;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public User getRecuriter() {
		return recuriter;
	}

	public void setRecuriter(User recuriter) {
		this.recuriter = recuriter;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	@Override
	public String toString() {
		return "Job [id=" + id + ", title=" + title + ", description=" + description + ", location=" + location
				+ ", salary=" + salary + ", recuriter=" + recuriter + "]";
	}

}
