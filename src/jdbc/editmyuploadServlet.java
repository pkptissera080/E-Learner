package jdbc;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import common.DB_Connection;

/**
 * Servlet implementation class editmyuploadServlet
 */
@WebServlet("/editmyuploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
maxFileSize = 1024 * 1024 * 1000, // 1GB
maxRequestSize = 1024 * 1024 * 1000) // 1GB
public class editmyuploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editmyuploadServlet() {
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

			String folderName = "resources";
			String uploadPath = request.getServletContext().getRealPath("") + folderName;
			out.print("uploadPath :");
			out.println(uploadPath);

			File dir = new File(uploadPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			Part filePart = request.getPart("inputfile");
			String fileName = filePart.getSubmittedFileName();
			String filetype = "";
			String path = "";
			
			
			if(!fileName.equals("")) {
				filetype = filePart.getContentType();
				path = folderName + File.separator + fileName;
				out.print("fileName :");
				out.println(fileName);
				out.print("filetype :");
				out.println(filetype);
				out.print("path :");
				out.println(path);
				
				try {
					InputStream is = filePart.getInputStream();
					Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
					out.println("copied");
	  			}
				catch(Exception ex){
					out.println(ex);
				}
			}

			String data_id = request.getParameter("data_id");
			String sub_grade_val = request.getParameter("sub_grade_val");
			String sub_name_val = request.getParameter("sub_name_val");
			String data_title = request.getParameter("data_title");
			String data_description = request.getParameter("data_description");

			try {

				DB_Connection obj_DB_Connection = new DB_Connection();
				Connection connection = obj_DB_Connection.get_connection();
				PreparedStatement ps = null;
				
				String sql1 = "UPDATE datatable SET data_title ='"+data_title+"' , data_description ='"+data_description+"',data_name='"+fileName+"',data_path='"+path+"',data_type='"+filetype+"' WHERE data_id  = '"+data_id +"' ";
				String sql2 = "UPDATE datatable SET data_title ='"+data_title+"' , data_description ='"+data_description+"' WHERE data_id  = '"+data_id +"' ";
				Class.forName("com.mysql.jdbc.Driver");

				
				if(!fileName.equals("")) {
					ps = connection.prepareStatement(sql1);
				}
				else {
					ps = connection.prepareStatement(sql2);
				}

				ps.executeUpdate();
				out.println("<script type=\"text/javascript\">");
                out.println("location='teacher/myclass.jsp?sub_grade_val="+sub_grade_val+"&sub_name_val="+sub_name_val+"';");
                out.println("</script>");
				
			} catch (ClassNotFoundException ex) {
				out.println(ex);
			}

		} catch (SQLException ex) {
			out.println(ex);
		}
	}

}
