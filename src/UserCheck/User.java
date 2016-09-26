package UserCheck;
public class User {
	
	String name;	
	
	String password;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String string) {
		password = string;
	}
	public boolean isvaliduser()
	{boolean res = false;
	if (name.equals("harish") && password.equals("blue"))
		res = true;
	return res ;
	}
	
	
	
}