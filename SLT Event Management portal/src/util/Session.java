package util;

public class Session {
	
	public static String user;
	public static String eid;
	public static String nicc;

	public static String getNicc() {
		return nicc;
	}

	public static void setNic(String nicc) {
		Session.nicc = nicc;
	}

	public static String getUser() {
		return user;
	}

	public static void setUser(String user) {
		//Session.user = "admin";
		Session.user = user;
	}

	public static String getEid() {
		return eid;
	}

	public static void setEid(String eid) {
		Session.eid = eid;
	}
	
	

}
