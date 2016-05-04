package com.demo.controller.dao;
import java.util.Collection;
import java.util.List;
import com.demo.controller.domain.*;
public interface EmployeeDao {

public void save(Employee p);
    
    public List<Employee> listAllEmployee();
    public List<Employee> loadProductsByCategory();
    public void removeEmployee(int id);
    public void updatePerson(Employee p);
    public Employee getEmployeeById(int id);
}
