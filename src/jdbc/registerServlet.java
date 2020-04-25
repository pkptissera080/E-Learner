package jdbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DB_Connection;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		try {
			String u_reg_nic = request.getParameter("u_reg_nic");
			String u_reg_uname = request.getParameter("u_reg_uname");
			String u_reg_email = request.getParameter("u_reg_email");
			String u_reg_pass = request.getParameter("u_reg_pass");
			String u_reg_type = request.getParameter("u_reg_type");
			

				Statement statement = null;
				ResultSet nicresultSet = null;
				ResultSet unameresultSet = null;
				ResultSet emailresultSet = null;
				String nicCountrow="";
				String unameCountrow="";
				String emailCountrow="";
				
				DB_Connection obj_DB_Connection1 = new DB_Connection();
				Connection connection1 = obj_DB_Connection1.get_connection();
				statement = connection1.createStatement();
				String sqlnic = "SELECT COUNT(user_nic) FROM users WHERE user_nic='"+u_reg_nic+"'";
				String sqluname = "SELECT COUNT(user_username) FROM users WHERE user_username='"+u_reg_uname+"'";
				String sqlemail = "SELECT COUNT(user_email) FROM users WHERE user_email='"+u_reg_email+"'";
				
				nicresultSet = statement.executeQuery(sqlnic);
				while (nicresultSet.next()) {
					nicCountrow = nicresultSet.getString(1);
				}
				unameresultSet = statement.executeQuery(sqluname);
				while (unameresultSet.next()) {
					unameCountrow = unameresultSet.getString(1);
				}
				emailresultSet = statement.executeQuery(sqlemail);
				while (emailresultSet.next()) {
					emailCountrow = emailresultSet.getString(1);
				}
				
				if(nicCountrow.equals("1")) {
					out.print("NIC not avalaible");
				}else if(unameCountrow.equals("1")) {
					out.print("Username not avalaible");
				}
				else if(emailCountrow.equals("1")) {
					out.print("Email not avalaible");
				}
				else if(nicCountrow.equals("0") && unameCountrow.equals("0") && emailCountrow.equals("0") ){
					DB_Connection obj_DB_Connection = new DB_Connection();
					Connection connection = obj_DB_Connection.get_connection();
					PreparedStatement ps = null;

					String sql = "insert into users (user_nic,user_username,user_email,user_pwd,user_type) values(?,?,?,?,?)";
					Class.forName("com.mysql.jdbc.Driver");
				
					ps = connection.prepareStatement(sql);
					ps.setString(1, u_reg_nic);
					ps.setString(2, u_reg_uname);
					ps.setString(3, u_reg_email);
					ps.setString(4, u_reg_pass);
					ps.setString(5, u_reg_type);

					ps.executeUpdate();
					out.println("Success");

				}
				else {
					out.print("something went wrong");
				}


		} catch (SQLException ex) {
			out.println(ex);
		}catch (ClassNotFoundException ex) {
	            out.println(ex);
	    }
	}



}
