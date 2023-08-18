package days25;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.Properties;

public class Ex06 {

	public static void main(String[] args) {
		//[Properties 컬렉션 클래스]
		//hashtable<String,String> + load()/store() 파일로 읽기쓰기가 바로 됨
		//환경설정값들을 저장해 읽기쓰기 작업할때 자주 사용됨
		
		//[days23.Ex10.java]
		//DB연결 문자열
		String className = "oracle.jdbc.driver.OracleDriver";            
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";                  
	    String user = "scott";                                                                   
	    String password = "tiger"; 
	      
	    Properties p = new Properties();
	    p.setProperty("className", className);
	    p.setProperty("url", url);
	    p.setProperty("user", user);
	    p.setProperty("password", password);
	    
	    //XML 파일형식으로 저장하려고 함
	    String fileName = ".\\src\\com\\util\\jdbcproperties.xml";
	    String comments = "jdbc configuration";
	    try ( FileOutputStream os = new FileOutputStream(fileName)) { //바이트 단위로 데이터가 출력
			//p.store(writer, comments);
			p.storeToXML(os, comments);
	    	System.out.println(" Save End. ");
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
	    
	    
	    
	    
	}//main

}//class
