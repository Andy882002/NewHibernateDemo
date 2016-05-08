package com.demo.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.controller.domain.Department;
import com.demo.controller.domain.Employee;
import com.demo.controller.service.DepartmentService;
import com.demo.controller.service.EmployeeService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private DepartmentService departmentService;
	
	@Autowired(required=true)
	@Qualifier(value="departmentService")
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	
     private EmployeeService employeeService;
    
    @Autowired(required=true)
    @Qualifier(value="employeeService")
    public void setEmployeeService(EmployeeService ps){
        this.employeeService = ps;
    }
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/showalls", method = RequestMethod.GET)
	public @ResponseBody List<Department> getalls(){
		List<Department> dlist=new ArrayList<Department>();
		dlist=departmentService.getAlldepartments();
		return dlist;
	}
	
	@RequestMapping(value = "/getone/{id}", method = RequestMethod.GET)
	public @ResponseBody Department getalls(@PathVariable("id") int id){
		Department dpart =new Department();
		dpart=departmentService.getOneDepart(id);
		return dpart;
	}
	
	@RequestMapping(value = "/showallEmps", method = RequestMethod.GET)
	 public @ResponseBody List<Employee> getAllEmp2() {
		 List<Employee> eplist=this.employeeService.listAllEmployee();
		 return eplist;
	 }
	
	@RequestMapping(value="/mytable", method = RequestMethod.GET)
	public String showtables(){
		return "Angtap";    //mytap"; //"showtable";
	}
	
	@RequestMapping(value = "/showall", method = RequestMethod.GET, headers="Accept=application/json")
	 public @ResponseBody List<Employee> getAllEmp() {
		 List<Employee> eplist= new ArrayList<Employee>();
		 eplist=(List<Employee>)employeeService.listAllEmployee();
		/* List<Employee> eplist2= new ArrayList<Employee>();
				 eplist=(List<Employee>)employeeService.listAllEmployee();
				 int i=0;
				 Employee emps2=new Employee();
				 emps2=eplist.get(1);
				 System.out.println(" --------   " + emps2.toString());
				 for (Employee ep : eplist) {
					 Employee emps=new Employee();
					 //emps=new Employee();
					 emps.setAddress(ep.getAddress());
					 emps.setAge(ep.getAge());
					 emps.setId(ep.getId());
					 emps.setName(ep.getName());
					 emps.setSalary(ep.getSalary());
					 eplist2.add(emps);
					 System.out.println(" ****   " + emps.toString());
				 }*/
			//Employee ep=new Employee();
		 return eplist;//emps2;
	 }
	
	@RequestMapping(value = "/employees/{id}", method = RequestMethod.GET, headers="Accept=application/json")
    public @ResponseBody List<Employee> updateUser2(@PathVariable("id") int id) {
        System.out.println("Updating User ");
        //Employee epm=new Employee();
        Employee emp1=new Employee();
        List<Employee> list=new ArrayList<Employee>();
       // List<Employee> list2=new ArrayList<Employee>();
        try {
        	//list2=(List<Employee>)employeeService.listAllEmployee();
        //epm=(Employee)this.employeeService.getEmployeeById(id);
        	emp1=employeeService.getEmployeeById(id);
        	//epm=list2.get(id);
        	System.out.println("Updating User "+emp1.getAddress());
        list.add(emp1);
        //return list;
        }catch(Exception e){
        	e.toString();
        }
       //List<Employee> list;
	// employeeService.updatePerson(epm);
       return list;
    }
	
	 @RequestMapping(value = "/employee/{id}", method = RequestMethod.PUT)
	    public  @ResponseBody List<Employee> updateUser(@PathVariable("id") int id, @RequestBody Employee employee) {
		 List<Employee> list=new ArrayList<Employee>();
		 System.out.println("*****"+employee.toString());
	       Employee emp =employeeService.getEmployeeById(id);
	       try {
	       employeeService.updatePerson(employee);
	       
	       System.out.println("Look Me Updating User !!!!....  "+emp.getAddress());
	       System.out.println("*****"+employee.toString());
	       //employeeService.save(employee);
	       list.add(emp);
	       }catch (Exception e){
	    	   System.out.println(e.getStackTrace());
	       }
	       return list;
	    }
	 @RequestMapping(value = "/deletemp/{id}", method = RequestMethod.DELETE)
	 public @ResponseBody List<Employee> deleteEmp(@PathVariable("id") int id){
		 List<Employee> list=new ArrayList<Employee>();
		// list=employeeService.listAllEmployee();
		 try {
			 employeeService.removeEmployee(id);
			 list=employeeService.listAllEmployee();
		 }catch(Exception e){
			 System.out.println(e.getStackTrace());
		 }
		  return list; 
	 }
	 @RequestMapping(value = "/newperson", method = RequestMethod.GET) 
		public ModelAndView MyPerson() { 
		return new ModelAndView("person", "command", new Employee()); 
		} 
		 
		 @RequestMapping(value = "/addperson", method = RequestMethod.POST) 
	   public String addStudent(@ModelAttribute("SpringWeb")Employee person, ModelMap model) { 		 
		 //List<Employee> list=new ArrayList<Employee>();
		 employeeService.save(person);
		 System.out.println("save one employee *****  "+person.toString());
		 //Employee emp =new Employee(); //employeeService.getEmployeeById(id);
		
		  return "showtable";
	 }
	 //empsave
	 @RequestMapping(value="/empsave", method=RequestMethod.POST)
	 public String saveOne(@RequestBody Employee employee) {
		
		 employeeService.save(employee);
		
		  return "showtable"; //"mytap";
	 }
}
