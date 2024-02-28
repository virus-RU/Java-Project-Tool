<%@page import="java.net.URLEncoder"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="org.ranchi.com.Pojo.RegistrationDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegistrationList</title>

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
	
	table{
	
	 border-style: solid;
	 width: 100%;
	
	}
	th{
	 border: 1px solid #dddddd;
     text-align: center;
     padding: 8px;
	}
	td{
	
	 border: 1px solid #dddddd;
     text-align: center;
     padding: 8px;
	}
	
	.containerSearch{
	
	   width:95%;
	   height: 50px;
	   display: flex;
	   justify-content: flex-end;
	   margin-top: 20px;
	  
	}
	

</style>


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
   
   <div class="containerSearch">
          <div>
               
                 <form action="RegistrationFormList.jsp" method="post"> <input type="text" name = "rid" required="required" placeholder="userid"><input type="submit" value="Search"/> </form>
          
          </div>
   </div>
   
   <h1>List of Registered Student</h1>
   
   <table class="table_default" id=tableHide>
   
   <tr><th>ID</th><th>Name</th><th>Father</th><th>Mother</th><th>DOB</th><th>Gender</th><th>Email</th><th>Mobile</th><th>Address</th><th>Post</th><th>District</th><th>State</th><th>Pincode</th><th>Education</th><th>College</th><th>Stream</th><th>Total Marks</th><th>Percentage</th></tr>
   
    <% RegistrationDetails details = new RegistrationDetails();
      
      EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
      EntityManager manager = factory.createEntityManager();
      EntityTransaction transaction = manager.getTransaction();
      transaction.begin();
      
	  String qry = "Select u from RegistrationDetails u";
      
      TypedQuery<RegistrationDetails> query = manager.createQuery(qry, RegistrationDetails.class);

      
      List<RegistrationDetails> resultList = query.getResultList();
      transaction.commit();  
      if(resultList.size()>0)
      {
    	 System.out.println("Data is Here!") ;
    	 for(int i = 0; i<resultList.size(); i++)
    	 {
    	 %>
    	  <tr>
    	   <td><%=resultList.get(i).getId() %></td>
    	   <td><%=resultList.get(i).getFullname() %></td>
    	   <td><%=resultList.get(i).getFather() %></td>
    	   <td><%=resultList.get(i).getMother() %></td>
    	   <td><%=resultList.get(i).getDob() %></td>
    	   <td><%=resultList.get(i).getGender() %></td>
    	   <td><%=resultList.get(i).getEmail() %></td>
    	   <td><%=resultList.get(i).getMobile() %></td>
    	   <td><%=resultList.get(i).getAddress() %></td>
    	   <td><%=resultList.get(i).getPost() %></td>
    	   <td><%=resultList.get(i).getDistrict() %></td>
    	   <td><%=resultList.get(i).getState() %></td>
    	   <td><%=resultList.get(i).getPincode() %></td>
    	   <td><%=resultList.get(i).getEducation() %></td> 
    	   <td><%=resultList.get(i).getCollege() %></td>
    	   <td><%=resultList.get(i).getStream() %></td>
    	   <td><%=resultList.get(i).getTotalmarks() %></td>
    	   <td><%=resultList.get(i).getPercentage() %></td> 
    	  
    	  </tr>
    	 
    	 <% }%>
      <%
      }
      else
      {
    	  System.out.println("Data is not Here!") ;
      }
      
   
   
   %>
   
   </table>
   
   
   
    
           <%
           
           String rid = request.getParameter("rid");
         
           
           if(rid != null)
           {
        	   System.out.println("Succuss fully send");
        	   
        	   System.out.println("rid: "+rid);
        	  
               
               RegistrationDetails rd = new RegistrationDetails();
               rd.setId(Integer.parseInt(rid));
         
               transaction.begin();
               transaction.commit();
               
               RegistrationDetails dd = manager.find(RegistrationDetails.class, Integer.parseInt(rid));
              
               if(dd != null)
               {  
            	   transaction.begin();
            	   //manager.remove(dd);
            	   transaction.commit();
               %>
                    <script type="text/javascript"> 
                    var myDiv = document.getElementById("tableHide");
                    myDiv.style.display = 'none';</script>
                    
                    <table id="tableShow">
                      <tr><th>ID</th><th>Name</th><th>Father</th><th>Mother</th><th>DOB</th><th>Gender</th><th>Email</th><th>Mobile</th><th>Address</th><th>Post</th><th>District</th><th>State</th><th>Pincode</th><th>Education</th><th>College</th><th>Stream</th><th>Total Marks</th><th>Percentage</th></tr>
                      <tr>
				    	   <td><%=dd.getId() %></td>
				    	   <td><%=dd.getFullname() %></td>
				    	   <td><%=dd.getFather() %></td>
				    	   <td><%=dd.getMother() %></td>
				    	   <td><%=dd.getDob() %></td>
				    	   <td><%=dd.getGender() %></td>
				    	   <td><%=dd.getEmail() %></td>
				    	   <td><%=dd.getMobile() %></td>
				    	   <td><%=dd.getAddress() %></td>
				    	   <td><%=dd.getPost() %></td>
				    	   <td><%=dd.getDistrict() %></td>
				    	   <td><%=dd.getState() %></td>
				    	   <td><%=dd.getPincode() %></td>
				    	   <td><%=dd.getEducation() %></td> 
				    	   <td><%=dd.getCollege() %></td>
				    	   <td><%=dd.getStream() %></td>
				    	   <td><%=dd.getTotalmarks() %></td>
				    	   <td><%=dd.getPercentage() %></td> 
			    	  </tr>
    	 
                      
                    </table>
                   
               <%}
               else{
            	   %>
            	   <script type="text/javascript">
            	   alert("No Records Founds");
            	   </script>
              <% }
               manager.close();
               factory.close();   
           }
           else
           {
        	   System.out.print("Succuss fully  not send");
           }
           %>
   
   
   
   
   <script type="text/javascript">
   
       function getSerach()
       {
    	   var idValue = document.getElementById("searchValue").value;
    	   response.sendRedirect("RegistrationFormList.jsp?Search=" +URLEncoder.encode(idValue, "UTF-8"));// Retrieve data from the query parameters
    	   
       }
   </script>
   
   
   
   
   
   
   
   
</body>
</html>