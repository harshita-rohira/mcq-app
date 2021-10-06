package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entities.Questions;
import com.helper.ConnectionProvider;


@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public QuestionServlet() {
        super();
        
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		
			ConnectionProvider conn = new ConnectionProvider();
			String q = "SELECT * from questions";
		
			Statement stmt;
	
			stmt = conn.con.createStatement();
			ResultSet rs = stmt.executeQuery(q);
			
			RequestDispatcher rd = request.getRequestDispatcher("/question.jsp");
			rd.forward(request, response);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}
