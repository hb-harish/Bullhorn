

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import UserCheck.User;
import customTools.DbUser;
import customTools.DbUtilities;
import model.Bhuser;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String useremail = request.getParameter("userid");
		String userpassword = request.getParameter("password");
	
//		User u = new User();
//		u.setName(message1);
//		u.setPassword(message2);
		Bhuser user = null;
		List <model.Bhpost> posts = null;
		String nextURL ="";
		HttpSession session = request.getSession();
		if (DbUser.isValidUser(useremail, userpassword))
		{
			posts = DbUtilities.bhPost();
			user = DbUser.getUserByEmail(useremail);
			session.setAttribute("user", user);
			session.setAttribute("posts", posts);
			nextURL = "/Home.jsp";
		}
		else
		{
			session.setAttribute("message","Wrong details please re-enter log on details");
    	  	nextURL = "/Login.jsp";
		}
      
    response.sendRedirect(request.getContextPath() + nextURL);
	}

}
