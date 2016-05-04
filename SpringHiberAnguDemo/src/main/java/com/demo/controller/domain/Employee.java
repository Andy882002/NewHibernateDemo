package com.demo.controller.domain;

import javax.persistence.Column;
import javax.annotation.*;
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
@Table(name="Employee")
public class Employee {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
     private int id;
     private String name;
     private String address;
     private double salary;
     private int age;
     
     public int getId() {
 		return id;
 	}
 	public void setId(int id) {
 		this.id = id;
 	}
 	public String getName() {
 		return name;
 	}
 	public void setName(String name) {
 		this.name = name;
 	}
 	public String getAddress() {
 		return address;
 	}
 	public void setAddress(String address) {
 		this.address = address;
 	}
 	public double getSalary() {
 		return salary;
 	}
 	public void setSalary(double salary) {
 		this.salary = salary;
 	}
 	public int getAge() {
 		return age;
 	}
 	public void setAge(int age) {
 		this.age = age;
 	}
 	@Override
 	public String toString() {
 		return "Employee [id=" + id + ", name=" + name + ", address=" + address
 				+ ", salary=" + salary + ", age=" + age + "]";
 	}
 	public Employee(){}
}
