package days21;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오후 12:44:37
 * @subject DateTimeFormatter 형식화 클래스 
 * @content
 */
public class Ex11 {

	public static void main(String[] args) {

		//java.time 패키지 핵심 클래스
		//문자열 -> 파싱-> 핵심클래스
		//         <-포맷<-
		//		     DataTimeFormatter형식화 클래스
		
		LocalDateTime dt = LocalDateTime.now();
		//2023-08-10T14:05:00.525340
		System.out.println(dt);
		
		//2023/08/10 요일 시간:분:초.밀리세컨드
		String pattern ="yyyy/MM/dd E요일 hh:mm:ss.SSS";	
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(pattern);
		String output = dtf.format(dt);
		System.out.println(output);
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
