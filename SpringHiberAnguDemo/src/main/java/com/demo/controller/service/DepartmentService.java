package com.demo.controller.service;
import java.util.List;

import com.demo.controller.domain.Department;
public interface DepartmentService {

	public void saveDepart(Department dp);
	public List<Department> getAlldepartments();
	public Department getOneDepart(int id);
}
