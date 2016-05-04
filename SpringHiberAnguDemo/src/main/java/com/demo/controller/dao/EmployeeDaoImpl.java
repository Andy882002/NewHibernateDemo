package com.demo.controller.dao;
import java.util.List;



//import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.controller.domain.*;
@Repository(value="employeeDao")
public class EmployeeDaoImpl implements EmployeeDao{

	private static final Logger logger = LoggerFactory.getLogger(EmployeeDaoImpl.class);
	//@Autowired  
	//DataSource dataSource; 
	// @Resource(name="sessionFactory")
	 private SessionFactory sessionFactory;
	 @Autowired
	 public void setSessionFactory(SessionFactory sf) {
			this.sessionFactory = sf;
		}
	 

		
	    @Override
	    public void save( Employee employee ) {
	    	Session session = this.sessionFactory.getCurrentSession();
	        Transaction tx = session.beginTransaction();
	    	//sessionFactory.getCurrentSession().saveOrUpdate ( employee );
	    	 session.persist(employee);
	    	 
	    	tx.commit();
	    	 logger.info("Person has been seved successfully, person details="+employee);
	    }
	 
	   @Override
       public void removeEmployee(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();
        Employee p = (Employee) session.load(Employee.class, new Integer(id));
        if(null != p){
            session.delete(p);
        }
        tx.commit();
        logger.info("Person deleted successfully, person details="+p);
    }
	     
	
	 
	 
	 
	    @SuppressWarnings("unchecked")
	    @Override
	    public List<Employee> listAllEmployee(){
	    	
	    	Session session = this.sessionFactory.getCurrentSession();
	        Transaction tx = session.beginTransaction();
	        List<Employee> personsList = session.createQuery("from Employee").list();
	        tx.commit();
	        for(Employee p : personsList){
	        	logger.info("Person List::"+p);
	        }
	    	
	      return personsList;
	    	 //return this.sessionFactory.getCurrentSession().createQuery("from Employee").list();
	      //return (List<Employee>) sessionFactory.getCurrentSession().createCriteria ( Employee.class ).list();
	    }

       /*This monthod create a error
        * SEVERE: Servlet.service() for servlet [appServlet] in context with path [/controller] threw exception 
        * [Request processing failed; nested exception is org.hibernate.HibernateException: createQuery is not 
        * valid without active transaction] with root cause org.hibernate.HibernateException: createQuery is not 
        * valid without active transaction
	       at org.hibernate.context.ThreadLocalSessionContext$TransactionProtectionWrapper.invoke(ThreadLocalSessionContext.java:341)
	     at com.sun.proxy.$Proxy27.createQuery(Unknown Source)
	      at com.app.controller.dao.EmployeeDaoImpl.loadProductsByCategory(EmployeeDaoImpl.java:65)
        * 
        */

	    @SuppressWarnings("unchecked")
	    @Override
		public List<Employee> loadProductsByCategory() {
	        return this.sessionFactory.getCurrentSession().createQuery("from Employee").list();
	    }
		

	    @Override
	    public void updatePerson(Employee p) {
	        Session session = this.sessionFactory.getCurrentSession();
	        Transaction tx = session.beginTransaction();
	        session.update(p);
	        tx.commit();
	        logger.info("Person updated successfully, Person Details="+p);
	    }

	    @SuppressWarnings("unchecked")
		@Override
	    public Employee getEmployeeById(int id) {
	        Session session = this.sessionFactory.getCurrentSession(); 
	        Transaction tx = session.beginTransaction();
	       
	        //Employee p = (Employee) session.load(Employee.class, new Integer(id));
	        List<Employee> plist =session.createQuery("from Employee where id = "+id).list();
	        tx.commit();
	        logger.info("Person loaded successfully, Person details="+plist.get(0));
	        return plist.get(0);
	    }
}
