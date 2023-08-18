package days21;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오후 12:24:14
 * @subject
 * @content
 */
public class Ex10 {

	public static void main(String[] args) {

		//개강일에서 100일
		//수료일부터 오늘날짜 차이
		
		//날짜 - 날짜 사이의 간격 Period
		//시간 - 시간 사이의 간격 Duration
		
		//between() == until()
		//차이점?
		//between() 은 static 메서드 : 객체생성없이 바로 사용 가능
		//until() 은 인스턴스 메서드 : 객체 생성 후 사용
		
		//of(), with() 변경할때
		//plus(), minus() 등등
		
		
		//개강일
		LocalDate s = LocalDate.of(2023,7,13);
		
		//오늘날짜
		LocalDate t = LocalDate.now();
		t.plusDays(1);		
		
		//날짜 간격?                      s<=     <t // 오늘까지 포함하려면 t에 하루 더해야됨
		Period p = Period.between(s, t); 
		int year = p.getYears();
		System.out.println(year); //0
		
		long month = p.get(ChronoUnit.MONTHS);
		System.out.println(month);
		
		long day = p.getDays();
		System.out.println(day);
		
		//시간 차 Duration
		LocalTime st = LocalTime.of(9, 0, 0);
		LocalTime tt = LocalTime.now();
		
		Duration d = Duration.between(st, tt);
		//시간차
		long ss = d.getSeconds();
//		System.out.println(ss);//13230초
//		System.out.println(ss/60);//221분
//		System.out.println(ss/(60*60));//3시간
		
		//UnsupportedTemporalTypeException 지원하지 않는다
		//long h = d.get(ChronoUnit.HOURS);		
		//System.out.println(h);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
