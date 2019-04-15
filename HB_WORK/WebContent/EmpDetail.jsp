<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.nt.domain.EmpDetails"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<!--Java Code-->
	<%
		//data section 
		String eid="",fname="",lname="",email="";
		String msg="";
		
		Configuration cfg=null;
		SessionFactory sf=null;
		Session sn=null;
		Transaction tx=null;
		
		
		//hibernet code
		
		//active hibernet framework
		cfg=new Configuration();
		cfg=cfg.configure("/com/nt/cfg/hibernate.cfg.xml");
		
		//create session factory
		sf=cfg.buildSessionFactory();
		
		
		
		//if btnsave is clicked
		if(request.getParameter("btnsave")!=null){
			
			eid=request.getParameter("eid");
			fname=request.getParameter("fname");
			lname=request.getParameter("lname");
			email=request.getParameter("email");
			
			
			//get session obj
			sn=sf.openSession();
			tx=sn.beginTransaction();
			
			if(request.getParameter("btnsave").equals("Save")){
				
				EmpDetails emp=new EmpDetails();
				
				emp.setNo(Integer.parseInt(eid));
				emp.setFname(fname);
				emp.setLname(lname);
				emp.setMail(email);
				
				//save into db
				sn.save(emp);

				msg="Employee data is save..";
			}else{
				
				EmpDetails emp=sn.get(EmpDetails.class,Integer.parseInt(eid));
				emp.setNo(Integer.parseInt(eid));
				emp.setFname(fname);
				emp.setLname(lname);
				emp.setMail(email);
				
				//update data
				sn.update(emp);
				
				msg="Emp details is updated";
			}
			
			
			tx.commit();
			sn.close();
		}else{
			
			
				
				//delete record
				if(request.getParameter("eid")!=null){
					

					//get session obj
					sn=sf.openSession();
					tx=sn.beginTransaction();
					
					EmpDetails emp=sn.get(EmpDetails.class,Integer.parseInt(request.getParameter("eid")));
					sn.delete(emp);
				
				
					tx.commit();
					sn.close();

				}//end if
			
		}//end if else
		
			
	%>










<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>

	<!--Bootstrap link-->
	<link href="bootstrap/bootstrap.css" rel="stylesheet"/>
	
	<!--  Include jQuery Core Library -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/additional-methods.js"></script>
	
	
	<style>
		label.error /* apply to such label which has error css class */
		{
			color:red;
			font-weight: bold;
		}
	</style>
	
</head>


<script>
$(document).ready(function(){
	
	//Write your jquery code
	$("#form1").validate({
		rules:{
			eid:{
				required:true,
				digits:true
			},
			fname:{
				required:true,
				pattern:/^[a-zA-Z ]+$/
			},
			lname:{
				required:true,
				pattern:/^[a-zA-Z ]+$/

			},
			email:{
				required:true,
                email:true,
                accept:"[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}" 

			}
		},
		
		messages:{
			eid:{
				required:"Id  is Required",
				digits:"Only Integers are allowed"
			},
			fname:{
				required:"First name is required",
				pattern:"only characters"
			},
			lname:{
				required:"Last name is required",
			},
			email:{
				required:"Email id is requried",
	            email: "Please enter a valid email address."

			}
		}
	});
	
	
});

	function setData(eid,fname,lname,email){
		t1=document.getElementById("eid");
		t2=document.getElementById("fname");
		t3=document.getElementById("lname");
		t4=document.getElementById("email");
		t5=document.getElementById("btnsave");
		
		t1.value=eid;
		t2.value=fname;
		t3.value=lname;
		t4.value=email;
		t5.value="Update"
		
		t1.readOnly=true;
		t2.focus();
		
		
	}//end function setdata

	function clearData(){
		
		t1=document.getElementById("eid");
		t2=document.getElementById("fname");
		t3=document.getElementById("lname");
		t4=document.getElementById("email");
		t5=document.getElementById("btnsave");
		
		t1.value="";
		t2.value="";
		t3.value="";
		t4.value="";
		t5.value="Save";
	
		t1.readonly=false;
		t1.focus();
	}//end function cleardata

</script>




<body>
	<div class="container">
		<br>
			<form id="form1" name="form1" method="post" action="">
				<table class="table table-bordered">
					<tr>
					<td colspan="2">Employee Data Entry Form</td>
					</tr>
					
					<tr>
						<td>Employee Id</td>
						<td>
							<input type="number" id="eid" name="eid" class="form-control" placeholder="Employee Id"  /> 
						</td>
					</tr>
					
					<tr>
						<td>First Name</td>
						<td>
							<input type="text" id="fname" name="fname" class="form-control email.invalid" placeholder="First Name"/> 
						</td>
					</tr>
					
					<tr>
						<td>Last Name</td>
						<td>
							<input type="text" id="lname" name="lname" class="form-control" placeholder="Last Name" /> 
						</td>
					</tr>
					
					<tr>
						<td>Email Id</td>
						<td>
							<input type="email" id="email" name="email" class="form-control" placeholder="Email" /> 
						</td>
					</tr>
					
					<tr>
						<td></td>
						<td>
							<input type="submit" id="btnsave" name="btnsave" value="Save" class="btn btn-primary" />
							<input type="button" name="btnreset" value="Clear" class="btn btn-danger" onclick="clearData();" /> 
						</td>
					</tr>
					
					<tr>
						<td></td>
						<td>
							<%
							out.println(msg);

							%>
							
 						</td>
					</tr>
			</table>

			<table class="table table-bordered table-striped">
			
				<tr>
					<td>Employee Id</td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Email</td>
					<td>Operation</td>
			   </tr>


					<%
						//get session obj
						sn=sf.openSession();
						tx=sn.beginTransaction();
						List<EmpDetails> emp2=sn.createQuery("from EmpDetails").list();//from classname
						
						for(EmpDetails emp:emp2){
						
					%>
				

				<tr>
					
					<td onclick="setData(<%=emp.getNo()%>,'<%=emp.getFname()%>','<%=emp.getLname()%>','<%=emp.getMail()%>');"><%=emp.getNo()%></td>
					<td onclick="setData(<%=emp.getNo()%>,'<%=emp.getFname()%>','<%=emp.getLname()%>','<%=emp.getMail()%>');"><%=emp.getFname()%></td>
					<td onclick="setData(<%=emp.getNo()%>,'<%=emp.getFname()%>','<%=emp.getLname()%>','<%=emp.getMail()%>');"><%=emp.getLname()%></td>
					<td onclick="setData(<%=emp.getNo()%>,'<%=emp.getFname()%>','<%=emp.getLname()%>','<%=emp.getMail()%>');"><%=emp.getMail()%></td>
					
					<td>
						<a onclick="setData(<%=emp.getNo()%>,'<%=emp.getFname()%>','<%=emp.getLname()%>','<%=emp.getMail()%>');" class="btn btn-info">Edit</a>
						<a onclick="return confirm('Do you want to delete record?');" href="?eid=<%=emp.getNo()%>" class="btn btn-danger">Delete</a>
					</td>
				</tr>
				
				<%
				
					}//end for each
						
						tx.commit();
						sn.close();

				%>


</table>

</form>
</div>
	
</body>
</html>