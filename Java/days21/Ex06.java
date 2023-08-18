package days21;

import java.time.LocalTime;
import java.time.temporal.ChronoField;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오전 11:11:02
 * @subject
 * @content
 */
public class Ex06 {

	public static void main(String[] args) {

		LocalTime t = LocalTime.now();
		
		//getXXX()
		//get(ChronoField.xxx)
		System.out.println(t.getHour());
		System.out.println(t.getMinute());
		System.out.println(t.getSecond());
		System.out.println(t.getNano());
		
		//밀리세컨드 값
		System.out.println(t.get(ChronoField.MILLI_OF_SECOND));
		
		//30분 후에 점심
		//t  = t.plusMinutes(30);
		
		//10분 전에
		//t = t.minusMinutes(10);
		
		//1시간 30분 후에 점심
		//t = t.plusMinutes(90);
		t = t.plusHours(1);
		t = t.plusMinutes(30);
		
		System.out.println(t);
		
		
		
		
		
	}//main

}//class
