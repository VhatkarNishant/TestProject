package com.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	private static SessionFactory sessionFactory;
	
	static //Initialize static members
	{
		if(sessionFactory==null){
			sessionFactory=new Configuration().configure("/com/nt/cfg/hibernate.cfg.xml").buildSessionFactory();
		}
	}
	
	
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

}//end class
