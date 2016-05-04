package com.demo.controller.service;

import com.demo.controller.domain.*;
import java.util.List;

public interface EmployeeService {

public void save(Employee p);
    
    public List<Employee> listAllEmployee();
    public List<Employee> loadProductsByCategory();
    public void removeEmployee(int id);
    public void updatePerson(Employee p);
    public Employee getEmployeeById(int id);
}
