<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="org.ranchi.com.Pojo.RegistrationDetails"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>

   <style type="text/css">
   
       body{
    		 width: 100%;
    		 /* background-image: url("./images/bg_image.jpg");
    		 background-size: cover; */
    		 background: linear-gradient(0deg, rgba(0, 255, 235, 1) 0%, rgba(7, 58, 187, 1) 100%);
    		 
    		 display: flex;
    		 justify-content: center;
    		 align-content: center;
    		 padding: 50px;
  
  			}
  			
  			.container{
  			 width: 800px;
    		 /* background-image: url("./images/bg_image.jpg");
    		 background-size: cover; */
    		background:white;
    		 border-radius:20px;
    		 display: grid;
             place-items: center;
             padding-bottom: 50px;
  			}
  			h3{
  			 text-align: center;
  			 font-size: 35px;
  			 font-family: cursive;
  			}
  			.containerBox{
  			    width: 400px;
    		 /* background-image: url("./images/bg_image.jpg");
    		 background-size: cover; */
    		 border: 20px;
    		 align-content: center;
  			}
  			
  			input{
  			
  			  width:300px;
  			  height: 40px;
  			  border-radius: 10px;
  			
  			}
  			p{
  			  width: 100%;
  			  background: silver;
  			  padding-top:10px;
  			  padding-bottom10px;
  			  text-align: center;
  			  font-size: 20px;
  			  font-family: monospace;
  			}
  			.gt{
  			
  			  width:20px;
  			  height:20px;
  			  font-size: 16px;
  			  color: black;
  			  
  			}
  			
  			form{
  			
  			    width: 100%;
  			 display: grid;
             place-items: center;
             padding-bottom: 50px;
  			}
   
   </style>

</head>
<body>
      
      
      <div class="container">
      
           <h3>Update Form</h3>
           
           <form action="UpdateStudent.jsp" method="post">
           
           <p>Personal Details</p>
           
           <div class="containerBox"> 
                <label>Registration id</label><br>
                <input type="number" name="rid" required="required" placeholder="Registration id" />
             </div>
           
             <div class="containerBox"> 
                <label>FullName</label><br>
                <input name="fullname" required="required" />
             </div>
             
             <div class="containerBox"> 
                 <label>Father Name</label><br>
                 <input name="father" required="required" />
             </div>
           
             
              <div class="containerBox"> 
                  <label>Mother Name</label><br>
                  <input name="mother" required="required" />
              </div>
              
             <div class="containerBox"> 
                  <label>Date of Birth</label><br>
                  <input type="date" name="dob" required="required" />
             </div><br>
                
				 <div class="containerBox"> 
				 
					 <label for="gender">Select Gender:</label>
				      <input class="gt" type="radio" name="gender" value="male"><label class="gt">Male</label>
				      <input class="gt" type="radio" name="gender" value="female"><label class="gt">Female</label>
				      <input class="gt" type="radio" name="gender" value="other"><label class="gt">Other</label>
				 </div><br>
               
             <div class="containerBox">
                     <label>Email ID</label><br>
                     <input name="email" required="required" />
             </div>
                  
             <div class="containerBox">
                     <label>Mobile No.</label><br>
         			  <input name="mobile" required="required" />			
             </div>
       
           
              <p>Address Details</p>
           
          
             <div class="containerBox">
                     <label>Address</label><br>
     				 <input name="address" required="required" />
             </div>
           
             <div class="containerBox">
                       <label>Post</label><br>
       				   <input name="post" required="required" />
             </div>
           
             <div class="containerBox">
                      <label>District</label><br>
                      <input name="district" required="required" />
             </div>
           
             <div class="containerBox">
                    <label>State</label><br>
                    <input name="state" required="required" />
             </div>
           
             <div class="containerBox">
                       <label>Pin Code</label><br>
                       <input name="pincode" required="required" /><br>
             </div>
             
                <p>Educational Details</p>
                
              <div class="containerBox">
                     <label>Higher Education</label><br>
     				 <input name="education" required="required" />
             </div>
           
             <div class="containerBox">
                       <label>College</label><br>
       				   <input name="college" required="required" />
             </div>
           
             <div class="containerBox">
                      <label>Stream</label><br>
                      <input name="stream" required="required" />
             </div>
           
             <div class="containerBox">
                    <label>Total Marks</label><br>
                    <input name="totalmarks" required="required" />
             </div>
           
             <div class="containerBox">
                       <label>Percentage</label><br>
                       <input name="percentage" required="required" /><br>
             </div>
             
             <br>
             
              <div class="containerBox">
                  
                       <input type="submit" value="Submit" /><br>
             </div>
       
           </form>
           
           
           <%
           
           String rid = request.getParameter("rid");
           String fullname = request.getParameter("fullname");
           String father = request.getParameter("father");
           String mother = request.getParameter("mother");
           String dob = request.getParameter("dob");
           String gender = request.getParameter("gender");
           String email = request.getParameter("email");
           String mobile = request.getParameter("mobile");
           String address = request.getParameter("address");
           String post = request.getParameter("post");
           String district = request.getParameter("district");
           String state = request.getParameter("state");
           String pincode = request.getParameter("pincode");
           String education = request.getParameter("education");
           String college = request.getParameter("college");
           String stream = request.getParameter("stream");
           String totalmarks = request.getParameter("totalmarks");
           String percentage = request.getParameter("percentage");
           
          
           
           if(rid != null || fullname != null || father != null || mother !=null || dob != null 
        	|| gender != null || email != null || mobile !=null || address !=null || post != null
        	|| district !=null || state !=null || pincode !=null || education !=null || college !=null
        	|| stream !=null || totalmarks !=null || percentage !=null)
           {
        	   System.out.println("Succuss fully send");
        	   
        	   System.out.println("rid: "+rid);
        	   System.out.println("fullname: "+fullname);
               System.out.println("father: "+father);
               System.out.println("mother: "+mother);
               System.out.println("dob: "+dob);
               System.out.println("gender: "+gender);
               System.out.println("email: "+email);
               System.out.println("mobile: "+mobile);
               System.out.println("address: "+address);
               System.out.println("post: "+post);
               System.out.println("district: "+district);
               System.out.println("state: "+state);
               System.out.println("pincode: "+pincode);
               System.out.println("education: "+education);
               System.out.println("college: "+college);
               System.out.println("stream: "+stream);
               System.out.println("totalmarks: "+totalmarks);
               System.out.println("percentage: "+percentage);
               
               RegistrationDetails rd = new RegistrationDetails();
               rd.setId(Integer.parseInt(rid));
               rd.setFullname(fullname);
               rd.setFather(father);
               rd.setMother(mother);
               rd.setDob(dob);
               rd.setGender(gender);
               rd.setEmail(email);
               rd.setMobile(mobile);
               rd.setAddress(address);
               rd.setPost(post);
               rd.setDistrict(district);
               rd.setState(state);
               rd.setPincode(pincode);
               rd.setEducation(education);
               rd.setCollege(college);
               rd.setStream(stream);
               rd.setTotalmarks(totalmarks);
               rd.setPercentage(percentage);
               
               EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
               EntityManager manager = factory.createEntityManager();
               EntityTransaction transaction = manager.getTransaction();;
               transaction.begin();
               transaction.commit();
               
               RegistrationDetails details = manager.find(RegistrationDetails.class, Integer.parseInt(rid));
              
               if(details != null)
               {  
            	   transaction.begin();
            	   manager.merge(rd);
            	   transaction.commit();
               %>
                    <script type="text/javascript">alert("Successfully Updated your records");</script>
               
               <%}
               else{
            	   %>
            	   <script type="text/javascript">alert("Your records is not updated! Please entered correct userid");</script>
              <% }
               manager.close();
               factory.close();
               
              
           }
           else
           {
        	   System.out.print("Succuss fully  not send");
           }
        
           %>
           
      
      </div>
      
      
</body>
</html>