package com.demo.controller.dao;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.controller.domain.Department;
import com.demo.controller.dao.DepartmentDao;

@Repository(value="departmentdao")
public class DepartmentDaoImpl implements DepartmentDao{

	private static final Logger logger = LoggerFactory.getLogger(DepartmentDaoImpl.class);
	
	 private SessionFactory sessionFactory;
	 @Autowired
	 public void setSessionFactory(SessionFactory sf) {
			this.sessionFactory = sf;
		}
	 
  @Override
	public void saveDepart(Department dp){
		Session session = this.sessionFactory.getCurrentSession();
       Transaction tx = session.beginTransaction();
   	//sessionFactory.getCurrentSession().saveOrUpdate ( employee );
   	 session.persist(dp);
   	 
   	tx.commit();
   	 logger.info("Person has been seved successfully, person details="+dp);
		
	}
  @SuppressWarnings("unchecked")
  @Override
	public List<Department> getAlldepartments(){
		Session session = this.sessionFactory.getCurrentSession();
       Transaction tx = session.beginTransaction();
       List<Department> departmentList = session.createQuery("from Department").list();
       tx.commit();
       for(Department p : departmentList){
       	logger.info("Person List::"+p);
       }
   	
     return departmentList;
	}
  @Override
	public Department getOneDepart(int id){
		Session session = this.sessionFactory.getCurrentSession(); 
       Transaction tx = session.beginTransaction();
       Department p = (Department) session.load(Department.class, new Integer(id));
       tx.commit();
       logger.info("Person loaded successfully, Person details="+p);
       return p;
	}
	
}
