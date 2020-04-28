package jdbc;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class downloadFileServlet
 */
@WebServlet("/downloadFileServlet")
public class downloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static int BUFFER_SIZE = 1024 * 100;
	public static final String UPLOAD_DIR = "resources";
	public static String fileName = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public downloadFileServlet() {
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

		String fileName = request.getParameter("data_name");
		if(fileName == null || fileName.equals("")) {
			response.setContentType("text/html");
			response.getWriter().println("<h3>File "+ fileName +" is not Present .....!</h3>");
		}
		else {
			String applicationPath = getServletContext().getRealPath("");
			String downloadPath = applicationPath + File.separator + UPLOAD_DIR;
			String filePath = downloadPath + File.separator + fileName;
			System.out.println("fileName : " + fileName);
			System.out.println("filePath : " + filePath);
			
			File file = new File(filePath);
			OutputStream outStream = null;
			FileInputStream inputStream = null;
			
			if(file.exists()) {
				
				String mimeType ="application/octet-stream";
				response.setContentType(mimeType);
				
				String headerkey = "Content-disposition";
				String headerValue = String.format("attachment; fileName=\"%s\"",file.getName());
				response.setHeader(headerkey, headerValue);
				
				try {
					outStream = response.getOutputStream();
					inputStream = new FileInputStream(file);
					byte[] buffer = new byte[BUFFER_SIZE];
					int bytesRead = -1;
					
					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outStream.write(buffer,0,bytesRead);
					}
				}catch(IOException ioExObj) {
					System.out.println("Exception while performing the I/o operation?="+ioExObj.getMessage());
				}finally {
					if(inputStream != null) {
						inputStream.close();
					}
					outStream.flush();
					if(outStream != null) {
						outStream.close();
					}
				}
			}else {
				response.setContentType("text/html");
				response.getWriter().println("<h3>File "+fileName+" is not exists</h3>");
			}
			
		}
	}

}
