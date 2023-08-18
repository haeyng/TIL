package days24;

import java.io.BufferedReader;
import java.io.FileReader;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오전 9:11:48
 * @subject
 * @content
 */
public class Ex01 {

	public static void main(String[] args) {
//		2. days19 패키지 안에 있는 "1. Java 팀 구성.txt" 파일을 읽어와서
//		   Map 컬렉션 클래스 사용해서
//		      key : 1조, 2조, 3조
//		      value :  직위(급)과 이름을 저장하는 클래스를 선언하고 //팀장,팀원-----------MemberVO 클래스 구현함
//		      그 클래스 객체를 저장하는 컬렉션 클래스 사용 저장하고 출력하는 코딩을 하세요. --------- 순서만 ArrayList 

		String fileName = ".\\src\\days19\\1. Java 팀 구성.txt";

		//자바 IO(Input Output)
		//파일 읽을때 FileReader , BufferedReader(보조스트림)
		//		     	 FileWriter, BufferedWriter

		//HashMap<String, 컬렉션클래스(팀원직위,이름)>
		ArrayList<MemberVO> teamList = null;
		HashMap<String, ArrayList<MemberVO>> teamMap = new HashMap<>();
		
		
		StringBuilder sb = new StringBuilder();
		String content = "";
		String line = null;
		try (FileReader reader = new FileReader(fileName);
			  BufferedReader br = new BufferedReader(reader))  //라인단위로 읽어옴
		{
			while ((line=br.readLine()) != null) {
				//System.out.println(line);
				content += line;
				sb.append(line+"\r\n");
			}//while
			content = sb.toString();
			System.out.println(content);
			
			//형식화 포맷 4가지 복습
			
			/*
			String pattern = 
						"{0}\r\n{1}\r\n"
					+ "{2}\r\n{3}\r\n"
					+ "{4}\r\n{5}\r\n";
			*/
			
			String pattern = 
	                  "{0}\r\n{1}(팀장),{2}\r\n";

			MessageFormat mf = new MessageFormat(pattern);
		 	Object [] datas = mf.parse(content);
		 	
		 	/*
			System.out.println(datas[0]);//1조
			System.out.println(datas[2]);//2조
			System.out.println(datas[4]);//3조
			*/
		 	
		 	System.out.println( datas[0]); // 1조
	        System.out.println( datas[1]);  

		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		
		
		
	}//main

}//class
