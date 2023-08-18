package days20;

import java.time.LocalDate;
import java.time.temporal.ChronoField;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 4:48:46
 * @subject
 * @content
 */
public class Ex13 {

	public static void main(String[] args) {

		LocalDate d = LocalDate.now();
		System.out.println(d);//2023-08-09
		
		
		d=d.with(ChronoField.YEAR, 2010);
		System.out.println(d);
		
		/*
		//withXXX()
		//연도를 바꾸고 싶음
		d.withYear(2020); //불변
		d= d.withYear(2020);
		d= d.withMonth(5);
		d= d.withDayOfMonth(11);
		System.out.println(d);//2023-08-09
		*/
		
		
		//String은 불변 //a는 불변
		String a = "xyz";
		String b = a.replace('x', 't');
		System.out.println(b);
		
		
	}//main

}//class
