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
function check(){
	t1=document.getElementById("roll");
	t2=document.getElementById("name");
	t3=document.getElementById("address");
	
	s1=document.getElementById("eroll");
	s2=document.getElementById("ename");
	s3=document.getElementById("eaddress");
	
	flag=true;
	
	if(t1.value==""){
		s1.innerHTML="Roll No is required";
		t1.focus();
		flag=false;
	}else{
		var rollvalid=/^\d+$/; //object of RegExp class				
		if(!(rollvalid.test(t1.value))){
			s1.innerHTML="Only integers are allowed in Roll no";
			t1.focus();
			flag=false;
		}else{		
		s1.innerHTML="";
		}
	}
	
	if(t2.value==""){
		s2.innerHTML="Name is required";
		t2.focus();
		flag=false;
	}else{
		//var namevalid=/^[a-zA-Z ]+$/; //object of RegExp class
		var namevalid=new RegExp("^[a-zA-Z ]+$"); //object of RegExp class		
		if(!(namevalid.test(t2.value))){
			s2.innerHTML="Only chars and spaces are allowed in Name";
			t2.focus();
			flag=false;
		}else{		
		s2.innerHTML="";
		}
	}
	
	if(t3.value==""){
		s3.innerHTML="Address is required";
		t3.focus();
		flag=false;
	}else{
		s3.innerHTML="";
	}
	
	return flag;
	
}
