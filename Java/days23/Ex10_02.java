package days23;

import java.io.FileReader;
import java.io.FileWriter;
import java.util.Properties;

/**
 * @author 송해영
 * @date 2023. 8. 14. - 오후 5:06:40
 * @subject
 * @content
 */
public class Ex10_02 {

	public static void main(String[] args) {
		
		  String fileName = ".\\src\\com\\util\\jdbc.properties";	      
	      Properties p = new Properties();	    
	     
	      
	      try (FileReader reader = new FileReader(fileName)) {
	    	  
	    	  p.load(reader);
			
			  String className = p.getProperty("className");            
		      String url = p.getProperty("url");                 
		      String user = p.getProperty("user");                                                                
		      String password = p.getProperty("password");
		      
		      System.out.println(className);
		      System.out.println(url);
		      System.out.println(user);
		      System.out.println(password);
			
			
			System.out.println(" Load End. ");
		} catch (Exception e) {
			e.printStackTrace();
		}     
	      
	}//main

}//class
