import static org.junit.Assert.*;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.TypedQuery;

import org.junit.Test;

import customTools.DbUtil;
import customTools.DbUtilities;
import model.Bhpost;
import model.Bhuser;


public class InsertPostTest {

	@Test
	public void test() {
		Date postdate = new Date();
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		String query = "select u from Bhuser u where u.useremail=:email";
		TypedQuery<Bhuser> q = em.createQuery(query, Bhuser.class);
		q.setParameter("email","user1@domain.com");
		Bhuser bhUser = null;	
		try{
			bhUser =q.getSingleResult();
			System.out.println("the user id is  : bHuserid");
			
		}catch(NoResultException e)
		{
			System.out.println(e);
			
		}catch (NonUniqueResultException e){
			System.out.println(e);
		}
		System.out.println("inserting into tpost table");
		Bhpost bhPost = new Bhpost();
		bhPost.setBhuser(bhUser);
		bhPost.setPostdate(postdate);
		bhPost.setPosttext("This is a unit test post");
		System.out.println("calling DbUtilities.insert");
		DbUtilities.insert(bhPost);
		
	}

}
