<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  
  <style type="text/css">
  
  body{
     width: 100%;
     height: 1200px;
     /* background-image: url("./images/bg_image.jpg");
     background-size: cover; */
     background: linear-gradient(180deg, rgba(241, 247, 246, 1) 0%, rgba(247, 253, 255, 1) 100%);
  
  }
  
   .container{
   
       display: flex;
       justify-content: space-around;
       align-items: center;
       width: 100%;
       height: 150px;
       background-color: navy;
   
   }
   
   .box1{
        
        width: 20%;
        display: column; /* Set the display property to flex */
    	justify-content: center; /* Center content horizontally */
    	align-items: flex-start; /* Center content vertically */
    
   }
   .box2{
      width: 60%;
      height: 100%;
    /*   background: fuchsia; */
       display: flex;
       justify-content: center;
       align-items: center;
        color: white;
   }
   p{
   text-align: center;
   }
   
   #userName, #userid{
   
      font-size: 20px;
      font-family: monospace;
      font-weight: bold;
      color: white;
      
   }
   
   .head1 {
	
	font-family: sans-serif;
	font-size: 56px;
	font-weight: bold;      
	}
	
	.box3{
	    width: 20%;
	    display: flex;
       justify-content: center;
       align-items: center;
	
	}
	
	.image{
	  width: 120px;
	  height: 120px;
	  border-radius: 100%;
	  align-self: center;
	  
	}
	
	.containerBox{
       display: flex;
       justify-content: center;
       align-items: center;
       width: 100%;
       height: 250px;
       margin-top:50px;
      /*  background-color: navy; */
   
	}
	
	.ContBox1{
	
	    width: 350px;
	    height: 100%;
	    background: linear-gradient(180deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);
	    margin: 50px;
	    border-radius: 20px;
	     display: flex;
         justify-content: center;
         align-items: center;
	  
	}
	.register,.update,.remove,.list{
	  color: white;
	  font-size: 35px;
	  text-align: center;
	}
	
	.ContBox1:hover {
	
	   width: 360px;
	    height: 100%;
	    background: linear-gradient(90deg, rgba(0, 255, 235, 1) 0%, rgba(7, 58, 187, 1) 100%);
	    margin: 50px;
	    border-radius: 20px;
	     display: flex;
         justify-content: center;
         align-items: center;
	
     }
}
   
  </style>


<meta charset="UTF-8">
<title>DashBoard</title>
</head>
<body>


   <!-- Head box  -->   
   <div class="container">
   
        <!-- left side box -->
        <div class="box1">
        
         <p id="userName"></p>
         <p id="userid"></p>
        
        </div>
        
        <!--  main box -->
        <div class="box2">
        
        <label class="head1">DashBoard</label>
        
        </div>
        
        <!-- right side box -->
        <div class="box3">
          
          <img alt="logo" src="./images/logo.jpg" class="image"/>
          
        </div>
        
   
   </div>


   <!-- Container Box for Two -->
   
   <div class = containerBox>
   
       <div class="ContBox1"  onclick="openRegister()">
        
        <p class="register">New Registration</p>
       
       </div>
       
       <div class="ContBox1" onclick="openUpdate()">
       
        <p class="update">Update Student</p>
       
       </div>
   
   </div>
   
   <div class = containerBox>
   
       <div class="ContBox1"  onclick="openListOfStudent()">
       
        <p class="list">List Of Student</p>
       
       </div>
       
       <div class="ContBox1" onclick="openRemove()">
       
        <p class="remove">Remove Student</p>
       
       </div>
   
   </div>
   
   
   <%  String user = request.getParameter("username") ; 
		   String id = request.getParameter("userid");  %> 


  <script type="text/javascript">
  
  alert("Hello world");
  
  document.getElementById("userName").textContent  = '<%= user  %>';
  document.getElementById("userid").textContent  = "User ID: "+ '<%= id  %>';
  
  function openRegister()
  {
	  
	  window.location.href = "RegistrationForm.jsp";
	  
  }
  
  function openListOfStudent()
  {
	  
	  window.location.href = "RegistrationFormList.jsp";
	  
  }
  
  function openUpdate()
  {
	  window.location.href = "UpdateStudent.jsp";
  }
  
  function openRemove()
  {
	  window.location.href = "DeleteStudent.jsp";
  }
  
  
  </script>

</body>
</html>