package com.demo.controller.service;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.controller.domain.Department;
import com.demo.controller.dao.*;

@Service(value="departmentService")
public class DepartmentServiceImpl implements DepartmentService{

	private DepartmentDao departmentdao;
	//@Autowired
	public void setDepartmentdao(DepartmentDao departmentdao) {
		this.departmentdao = departmentdao;
	}
	@Override
    @Transactional	
	public void saveDepart(Department dp){
		departmentdao.saveDepart(dp);
	}
	@Override
    @Transactional	
	public List<Department> getAlldepartments(){
		return departmentdao.getAlldepartments();
	}
	@Override
    @Transactional	
	public Department getOneDepart(int id){
		return departmentdao.getOneDepart(id);
	}
}
