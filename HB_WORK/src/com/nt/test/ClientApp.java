package com.nt.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.nt.domain.EmpDetails;

public class ClientApp {

	public static void main(String[] args) {
		
		//activate hibernate f/w
		Configuration cfg=new Configuration();
		
		//mapping data into cfg object
		cfg=cfg.configure("/com/nt/cfg/hibernate.cfg.xml");
		
		//create session factory
		SessionFactory factory=	cfg.buildSessionFactory();
		
		//get session obj
	    Session ses=factory.openSession();
		
	    //create domain class obj
	    EmpDetails ed=new EmpDetails();
	    ed.setNo(3);
	    ed.setFname("nishant");
	    ed.setLname("vhatkar");
	    ed.setMail("raja@gmail.com");
	    
	    
	    Transaction tx=null;
	    try {
	    	tx=ses.beginTransaction();
	    	ses.save(ed);
	    	tx.commit();
	    	System.out.println("Object is stored");
	    	
	    	
	    	
	    EmpDetails ed1=ses.get(EmpDetails.class, 1);
	    if(ed1!=null) {
	    	System.out.println(ed1.getNo()+" "+ed1.getFname()+" "+ed1.getLname()+" "+ed1.getMail());
	    }else {
	    	System.out.println("Records not found");
	    }
	    }catch(Exception ex) {
	    	ex.printStackTrace();
	    	tx.rollback();
	    }
	    
	    ses.close();
	    factory.close();
	}//end main 
}//end class
