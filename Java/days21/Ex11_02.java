package days21;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오후 2:11:30
 * @subject
 * @content
 */
public class Ex11_02 {

	public static void main(String[] args) {

		//DateTimeFormatte.format()
		//DateTimeFormatte.parse()
		
//		String source = "2023-08-10";
//		LocalDate d = LocalDate.parse(source);
//		System.out.println(d);//문자열이 날짜 클래스객체로 파싱되서 출력
		
		//java.time.format.DateTimeParseException:
//		String source = "2023년 08월 10일 (목)";
//		LocalDate d = LocalDate.parse(source);
//		System.out.println(d);
		
		String source = "2023년 08월 10일 (목)";
		String pattern = "yyyy년 MM월 dd일 (E)";
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(pattern);
		LocalDate d = LocalDate.parse(source, dtf);
		System.out.println(d);
		
		
		LocalTime t = LocalTime.parse("12:23:43");
		System.out.println(t);
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
