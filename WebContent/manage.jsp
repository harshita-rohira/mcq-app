<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="javax.servlet.RequestDispatcher" %> 
  <%@page import =" java.io.IOException"%>
  <%@page import ="java.sql.ResultSet"%>
  <%@page import=" java.sql.SQLException"%>
  <%@page import ="java.sql.Statement"%>
  <%@page import ="javax.servlet.RequestDispatcher"%>
  <%@page import =" javax.servlet.ServletException"%>
  <%@page import  ="javax.servlet.annotation.WebServlet"%>
  <%@page import  =" javax.servlet.http.HttpServlet"%>
  <%@page import  ="javax.servlet.http.HttpServletRequest"%>
  <%@page import   ="javax.servlet.http.HttpServletResponse"%>
  <%@page import  =" com.entities.Questions"%>
  <%@page import  =" com.helper.ConnectionProvider"%>
  <%@page import = "java.io.PrintWriter" %>
  <%@page import = "javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Test</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/manage.css">
    </head>
    <body>
       
      <%  try {
   	   
   	   String id = request.getParameter("test_id");
   	   String name = request.getParameter("test_name");
   
		String q = "insert into test(test_id,test_name) values(?,?)";
			
			//preparedStatement
			PreparedStatement pstmt = ConnectionProvider.getConnection().prepareStatement(q);
			
			//set value of parameter
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			
			//execute
			 pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
      
       
       %>
        <main>
            <div class="boxcenter">
            
                <div class="login">
                    <h2>Enter Test Details</h2>
                    <form action="add_questions.jsp" method="POST">
                        <label>No. of Questions</label>
                        <input type="No" name="no_of_questions" placeholder="Total number of Questions" required autofocus><br>
                        <label>Test Duration</label>
                        <input type="No" name="test_duration" placeholder="Set test timing" required><br>
                        <input type="submit" name="Submit" value="Create Test"><br>
                        
                         
      

                    </form>
                </div>
            </div>
        </main>
    </body>
</html>