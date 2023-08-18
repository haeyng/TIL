package days20;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 3:46:20
 * @subject
 * @content
 */
public class Ex11_02 {

	public static void main(String[] args) {
		
		//[j.t 핵심 클래스]
		
		/*
		LocalDate ld = LocalDate.now();
		System.out.println(ld.toString());
		
		LocalTime lt = LocalTime.now();//15:49:26.667405700
		System.out.println(lt.toString());
		
		LocalDateTime ldt = LocalDateTime.now();
		System.out.println(ldt.toString());
		*/
		
		//[of() 메서드로 j.t.핵심클래스 객체 생성]
		LocalDate ld = LocalDate.of(2015, 11, 23);
		System.out.println(ld);
		LocalTime lt = LocalTime.of(3,20,11);
		System.out.println(lt.toString());
		
		LocalDateTime ldt = LocalDateTime.of(ld, lt);
		System.out.println(ldt);
	}//main

}//class
