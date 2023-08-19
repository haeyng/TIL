package days21;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오전 10:15:55
 * @subject
 * @content
 */
public class Ex02 {

	public static void main(String[] args) {
		
//		5. 개강일(2023.7.13)로부터 100일 되는 날짜를 출력하세요. 
//		 1) Date 클래스 사용
		
		Date sday = new Date(2023-1900,7-1,13);
		sday.setDate(sday.getDate() + 100);
		System.out.println(sday.toLocaleString());
		
//		 2) Calendar 클래스 사용
		Calendar c = new GregorianCalendar(2023,7-1,13);
		c.add(Calendar.DATE, 100);
		
//		 3) LocalDate 클래스 사용 - 불변.
		LocalDate ld = LocalDate.of(2023, 7, 13);
		System.out.println( ld );
		
		// ld.with()  
		//ld = ld.plusDays(100); //중요
		ld = ld.plus(100, ChronoUnit.DAYS);
		System.out.println(ld);
		
//		4. java.time 패키지의 핵심 클래스
//		1) 객체 생성하는 방법 : now(), of()
//		2) 특정 필드를 얻어오는 방법 : getXXX(), get()
//		3) 특정 필드를 수정하는 방법 : with(), plus(), minus()
		
		
	}//main

}//class
