package customTools;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DbUtil {
	private static final EntityManagerFactory emf =
			Persistence.createEntityManagerFactory("Bullhorn");
	public static EntityManagerFactory getEmFactory() {
		return emf ;
	}
	
	
}
