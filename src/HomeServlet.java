

import java.io.IOException;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import customTools.DbUtil;
import customTools.DbUtilities;
import model.Bhpost;
import model.Bhuser;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
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
		
		Date postdate = new Date();
//		EntityManager em = DbUtil.getEmFactory().createEntityManager();
//		String query = "select u from Bhuser u where u.useremail=:name";
//		TypedQuery<Bhuser> q = em.createQuery(query, Bhuser.class);
//		q.setParameter("name","user1@domain.com");
//		Bhuser bhUser = null;	
//		try{
//			bhUser =q.getSingleResult();
//			System.out.println("the user id is  : bHuserid");
//			
//		}catch(NoResultException e)
//		{
//			System.out.println(e);
//			
//		}catch (NonUniqueResultException e){
//			System.out.println(e);
//		}
//		System.out.println("inserting into tpost table");
		
		HttpSession session = request.getSession();
		model.Bhuser u = (model.Bhuser) session.getAttribute("user");

		Bhpost bhPost = new Bhpost();
		bhPost.setBhuser(u);
		bhPost.setPostdate(postdate);
		bhPost.setPosttext("Post inserted by user");
//		System.out.println("calling DbUtilities.insert");
		DbUtilities.insert(bhPost);
		String nextURL = "/Home.jsp";
		response.sendRedirect(request.getContextPath() + nextURL);
		

	}

}
