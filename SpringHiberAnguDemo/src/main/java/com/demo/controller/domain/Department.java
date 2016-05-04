package com.demo.controller.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Department")
public class Department {

	@Id
    @Column(name="dpid")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int dpid;
	private int pid;
	private String name;
	public int getDpid() {
		return dpid;
	}
	public void setDpid(int dpid) {
		this.dpid = dpid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
