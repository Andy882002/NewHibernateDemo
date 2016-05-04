package com.demo.controller.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.controller.dao.EmployeeDao;
import com.demo.controller.domain.Employee;
@Service(value="employeeService")
public class EmployeeServiceImpl implements EmployeeService{

private EmployeeDao employeeDao;
	
	// @Autowired
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	@Override
    @Transactional	
    public void save(Employee p){
		employeeDao.save(p);
   }
	@Override
    @Transactional	
	 public void removeEmployee(int id){
		 employeeDao.removeEmployee(id);
	 }
    @Override
    @Transactional
    public List<Employee> listAllEmployee(){
    
    	return employeeDao.listAllEmployee();
    }
    @Override
    @Transactional
    public List<Employee> loadProductsByCategory(){
    	return employeeDao.loadProductsByCategory();
    }
    @Override
    @Transactional
    public void updatePerson(Employee p){
    
    	employeeDao.updatePerson(p);
    }
    @Override
    @Transactional
    public Employee getEmployeeById(int id){
    	return employeeDao.getEmployeeById(id);
    }
}
