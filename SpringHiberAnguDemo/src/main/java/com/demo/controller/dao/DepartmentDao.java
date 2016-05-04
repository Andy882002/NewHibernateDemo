package com.demo.controller.dao;
import java.util.List;

import com.demo.controller.domain.*;
public interface DepartmentDao {

	public void saveDepart(Department dp);
	public List<Department> getAlldepartments();
	public Department getOneDepart(int id);
}
