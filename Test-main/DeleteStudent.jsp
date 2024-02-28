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
      
           <h3>Delete Form</h3>
           
           <form action="DeleteStudent.jsp" method="post">
           
           <p>Delete Student Details</p>
           
           <div class="containerBox"> 
                <label>Registration id</label><br>
                <input type="number" name="rid" required="required" placeholder="Registration id" />
             </div>
           
              <div class="containerBox">
                  
                       <input type="submit" value="Submit" /><br>
             </div>
       
           </form>
           
           <a href="RegistrationFormList.jsp">Click here for View List of Student</a>
           
           <%
           
           String rid = request.getParameter("rid");
         
           
           if(rid != null)
           {
        	   System.out.println("Succuss fully send");
        	   
        	   System.out.println("rid: "+rid);
        	  
               
               RegistrationDetails rd = new RegistrationDetails();
               rd.setId(Integer.parseInt(rid));
         
               
               EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
               EntityManager manager = factory.createEntityManager();
               EntityTransaction transaction = manager.getTransaction();;
               transaction.begin();
               transaction.commit();
               
               RegistrationDetails details = manager.find(RegistrationDetails.class, Integer.parseInt(rid));
              
               if(details != null)
               {  
            	   transaction.begin();
            	   manager.remove(details);
            	   transaction.commit();
               %>
                    <script type="text/javascript">alert("Successfully Deleted Student Records");</script>
               
               <%}
               else{
            	   %>
            	   <script type="text/javascript">alert("Your records is not Deleted! Please entered correct userid");</script>
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