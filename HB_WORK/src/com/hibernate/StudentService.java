package com.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class StudentService {

	
	private SessionFactory sessionFactory;
	private Session session;
	
	//no-arg constructor
	public StudentService() {
		sessionFactory=HibernateUtil.getSessionFactory();
	}
	
	
	
	public void saveStudent(Student stud) {
		
		session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(stud);
		session.getTransaction().commit();
		session.close();

	}//end saveStudent
	
	public Student getStudent(int roll) {
	
		//By default SessionFactory has a default session object
		//which we can use in process of records retrieval
		session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Student stud=session.get(Student.class,roll); 
		session.getTransaction().commit();		
		return stud;
	}//end getStudent
	
	public void updateStudent(Student stud) {
		
		session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(stud);
		session.getTransaction().commit();
		session.close();
	}//end updateStudent
	
	
	public void deleteStudent(Student stud) {
		
		session=sessionFactory.openSession();
		session.beginTransaction();
		session.delete(stud);
		session.getTransaction().commit();
		session.close();
	}//end deleteStudent
	
	
	public List<Student> getStudent(){
		
		//By default SessionFactory has a default session object
		//which we can use in process of records retrieval
		session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		List<Student> studs=session.createQuery("from Student").list();
		session.getTransaction().commit();		
		return studs;
	}
}//end class
