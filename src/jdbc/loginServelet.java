package jdbc;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DB_Connection;

/**
 * Servlet implementation class loginServelet
 */
@WebServlet("/loginServelet")
public class loginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String lg_username = request.getParameter("lg_username");
            String lg_password = request.getParameter("lg_password");
            String dbUsername = null;
            String dbPassword = null;
            String dbtype = null;
            String dbemail = null;

            DB_Connection obj_DB_Connection = new DB_Connection();
            Connection connection = obj_DB_Connection.get_connection();
            PreparedStatement ps = null;
            ResultSet rs = null;

            String sql = "select user_username,user_pwd,user_type,user_email from users where user_username=? and user_pwd=?";
            Class.forName("com.mysql.jdbc.Driver");
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, lg_username);
            ps.setString(2, lg_password);
            rs = ps.executeQuery();
            while (rs.next()) {
                dbUsername = rs.getString(1);
                dbPassword = rs.getString(2);
                dbtype = rs.getString(3);
                dbemail = rs.getString(4);
            }
            if (lg_username.equals(dbUsername) && lg_password.equals(dbPassword)) {
            	
            	HttpSession session = request.getSession();
            	session.setAttribute("user_username", lg_username);
            	session.setAttribute("user_email", dbemail);
            	session.setAttribute("user_type", dbtype);
            	
            	if(dbtype.equals("student")) {
            		
            		out.println("<script type=\"text/javascript\">");
                    out.println("location='student/index.jsp';");
                    out.println("</script>");
            	}
            	else if(dbtype.equals("teacher")) {
          		
            		out.println("<script type=\"text/javascript\">");
                    out.println("location='teacher/index.jsp';");
                    out.println("</script>");
            	}
            	else if(dbtype.equals("admin")) {
            		
            		out.println("<script type=\"text/javascript\">");
                    out.println("location='admin/index.jsp';");
                    out.println("</script>");
            	}
                
                
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username Or Password is wrong !!');");
                out.println("location='access/login.jsp';");
                out.println("</script>");
            }

        } catch (SQLException ex) {
            out.println(ex);
        } catch (ClassNotFoundException ex) {
            out.println(ex);
        }
	}

}
