package days10;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Ex02 {

	public static void main(String[] args) {
		
		getTotalDays(2023,7,1);
		
	
	}//main
	

	public static int getAmericanAge( String rrn ) {
//		19.12.30  20.1.1  20.12.30
//			1			2			2
//			0			0			1
//만나이 = 올해년도 - 생일년도      (생일지나면-1) 
//만나이 = 세는나이 (올해년도-생일년도-1)
		//1. 올해년도 2. 생일년도 3. 생일지나면 -1 순서로 구하기
		
		return 0;
	}
	
	//0(일) 1(월)~6(토)
	private static int getDayOfWeek(int year, int month, int day) {
	//날짜,시간 기능(일,함수,메서드)이 구현된 클래스	
	//java.util.Date, Calendar
	// jdk 1.8    LocalDate, LocalTime, LocalDateTime
	
	LocalDate d = LocalDate.of(year, month, day);
	DayOfWeek w = d.getDayOfWeek();
	// 1(월) 2(화) 3(수)... 6(토) 7(일)
		return w.getValue()%7;
		
	}
	
	private static int getTotalDays(int year, int month, int day) {
		LocalDate startDate = LocalDate.of(1,1,1); //시작날짜
		LocalDate endDate = LocalDate.of(year,month,day);//끝나는날짜
		
		int totalDays = (int) startDate.until(endDate,ChronoUnit.DAYS)+2; //일수
		//startDate.until(endDate,ChronoUnit.MONTHS); //개월수
		//startDate.until(endDate,ChronoUnit.YEARS); //년수
		
		return totalDays;
	}
	
	private static int getLastDay(int year, int month) {
		LocalDate d = LocalDate.of(year, month, 1); //내가 원하는 년, 월 1일날짜 객체
	
		LocalDate lastDate = d.withDayOfMonth(d.lengthOfMonth());//그 달의 마지막날짜가 있는 길이만큼 
		
		return lastDate.getDayOfMonth();//마지막날짜 객체로 일만 얻어오겠다.
		
	}      
	
}//class
