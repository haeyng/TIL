package days23;

import java.io.FileWriter;
import java.util.Properties;

/**
 * @author 송해영
 * @date 2023. 8. 14. - 오후 5:06:40
 * @subject
 * @content
 */
public class Ex10 {

	public static void main(String[] args) {
		/*
		//[Properties 컬렉션 클래스]
		== Hashtable 컬렉션 클래스와 동일
		- Map 계열
		- HashTable<String,String> ==Properties
		- key,value : String
		
		- 환경설정값들을 Properties 컬렉션 클래스를 사용해서 쓰기(저장)/읽기작업을 함.
		*/
		
		
		  //오라클 + java 연동 (DB연결 설정 정보)
		  String className = "oracle.jdbc.driver.OracleDriver";            
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";                  
	      String user = "scott";                                                                   
	      String password = "tiger"; 
	      
	      Properties p = new Properties();
	      //put(key,value)
	      //p.put(Object key, Object value); //나중에 다운캐스팅해야되서 번거롭다.
	      //p.setProperty(String key, String value); put말고 setProperty메서드 사용
	      p.setProperty("className", className);
	      p.setProperty("url", url);
	      p.setProperty("user", user);
	      p.setProperty("password", password);
	      
	      //p.get(Object key)
	      /*
	      String value = p.getProperty("className");
	      System.out.println(value); //oracle.jdbc.driver.OracleDriver
	      */
	      
	      //???.properties 확장자.
	      String fileName = ".\\src\\com\\util\\jdbc.properties";
	      String comments = "jdbc configuration";
	      try (FileWriter writer = new FileWriter(fileName)) {
			p.store(writer, comments);//다형성 //저장하는작업
			System.out.println(" Save End. ");
		} catch (Exception e) {
			e.printStackTrace();
		}      
	      
	}//main

}//class
