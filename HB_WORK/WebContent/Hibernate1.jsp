<%@page import="java.util.List"%>
<%@page import="com.hibernate.Student"%>
<%@page import="com.hibernate.StudentService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <!-- java code-->
    
    <%
    	//data section
    	String roll="",name="",address="";
    	String msg="";
    	
    	StudentService stud=new StudentService();
    
    	//if btnsave is clicked
    	if(request.getParameter("btnsave")!=null){
    		
    		roll=request.getParameter("roll");
    		name=request.getParameter("name");
    		address=request.getParameter("address");
    		
    		if(request.getParameter("btnsave").equals("Save")){
    			
    			Student stu=new Student();
    			stu.setRollNo(Integer.parseInt(roll));
    			stu.setName(name);
    			stu.setAddress(address);
    			System.out.println(roll);
    			System.out.println(name);
    			System.out.println(address);


    			stud.saveStudent(stu);
    			
    			msg="Student record is save";
    		}else{
    		Student stu=stud.getStudent(Integer.parseInt(roll));
    		stu.setName(name);
    		stu.setAddress(address);
    		stud.updateStudent(stu);
    		
    		msg="Student record is Updated";
    		
    		}//end inner if-else
    	}else{
    		
    		if(request.getParameter("droll")!=null){
    		Student stu=stud.getStudent(Integer.parseInt(request.getParameter("droll")));
    		stud.deleteStudent(stu);
    		}
    	}//end outer if-else
    
    %>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Using Service Class</title>

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
			roll:{
				required:true,
				digits:true
			},
			name:{
				required:true,
				pattern:/^[a-zA-Z ]+$/
			},
			address:{
				required:true
			}
		},
		
		messages:{
			roll:{
				required:"Roll No is Required",
				digits:"Only Integers are allowed"
			},
			name:{
				required:"Name is required",
				pattern:"only characters"
			},
			address:{
				required:"Address is required"
			}
		}
	});
	
	
});

function setData(rn,nm,ad){
	t1=document.getElementById("roll");
	t2=document.getElementById("name");
	t3=document.getElementById("address");
	t4=document.getElementById("btnsave");
	
	t1.value=rn;
	t2.value=nm;
	t3.value=ad;
	t4.value="Update";
	
	t1.readOnly=true;
	t2.focus();	
}


function clearData(){
	t1=document.getElementById("roll");
	t2=document.getElementById("name");
	t3=document.getElementById("address");
	t4=document.getElementById("btnsave");

	t1.value="";
	t2.value="";
	t3.value="";
	t4.value="Save";
	
	t1.readOnly=false;
	t1.focus();

}
</script>



<body>
	<div class="container">
		<br>
			<form id="form1" name="form1" method="post" action="">
				<table class="table table-bordered">
				
					<tr>
						<td colspan="2">Student Data Entry Form</td>
					</tr>
					
					<tr>
						<td>Roll No</td>
						<td>
							<input type="text" id="roll" name="roll" class="form-control" placeholder="Roll No"  /> 
						</td>
					</tr>
					
					<tr>
						<td>Student Name</td>
						<td>
							<input type="text" id="name" name="name" class="form-control" placeholder="Student Name"/> 
						</td>
					</tr>
					
					<tr>
						<td>Student Address</td>
						<td>
							<input type="text" id="address" name="address" class="form-control" placeholder="Student Address" /> 
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
							<%=msg%>
					 	</td>
					</tr>
		</table>

		<table class="table table-bordered table-striped">
			<tr>
				<td>Roll No</td>
				<td>Student Name</td>
				<td>Student Address</td>
				<td>Operation</td>
			</tr>

				<%
					List<Student> stu=stud.getStudent();
				
					for(Student studs:stu)
					{
				%>
			<tr>
				<td onclick="setData(<%=studs.getRollNo() %>,'<%=studs.getName() %>','<%=studs.getAddress() %>');"><%=studs.getRollNo()%></td>
				<td onclick="setData(<%=studs.getRollNo() %>,'<%=studs.getName() %>','<%=studs.getAddress() %>');"><%=studs.getName()%></td>
				<td onclick="setData(<%=studs.getRollNo() %>,'<%=studs.getName() %>','<%=studs.getAddress() %>');"><%=studs.getAddress()%></td>
				<td>
					<a onclick="setData(<%=studs.getRollNo() %>,'<%=studs.getName() %>','<%=studs.getAddress() %>');" class="btn btn-info">Edit</a>
					<a onclick="return confirm('Do you want to delete data')" href="?droll=<%=studs.getRollNo()%>" class="btn btn-danger">Delete</a>
				</td>
			</tr>

			<% }%>
</table>

</form>
</div>
	
</body>
</html>