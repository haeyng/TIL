package days09;

import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
	
		/*int year, month;
		
		try (Scanner scanner = new Scanner (System.in)) {
		
			System.out.print("> 년도 월 입력 ? ");
			year = scanner.nextInt();
			month = scanner.nextInt();
			
			printCalendar(year, month);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		*/
		
		for (int y = 2020; y <=2023; y++) {
			for (int i = 1; i <=12; i++) {
				printCalendar(y,i);
			} // for
		} // for
	
		
	}//main

	private static void printCalendar(int year, int month) {

		//1) 년, 월, 1일     요일?
		//일요일(0), 월 (1) 화(2) 수(3) 목(4) 금(5) 토(6)
		int dayOfWeek = getDayOfWeek(year, month,1);
		//2) 년, 월   마지막 날짜?
		int lastDay = getLastDay(year, month);


		System.out.printf("\t\t\t[%d년 %d월]\n", year, month);
		System.out.println("-".repeat(60));
		String week = "일월화수목금토";  
		//날짜출력
		//1일 날짜 앞에 공백 찍는 for문
		for (int i = 0; i < dayOfWeek; i++) {
			System.out.print("\t");
		} // for
		for (int i = 1; i <=lastDay; i++) {
			System.out.printf("\t%d",i);
			if( (i+dayOfWeek)%7==0) System.out.println(); 
		} // for
		System.out.println();
		System.out.println("-".repeat(60));
	
	}
	 private static int getDayOfWeek(int year, int month, int day) {
	      
	      // 1.1.1~year.month.day 총날짜수
	      int totalDays = getTotalDays(year, month, day);
	      int dayOfWeek = totalDays%7;
	      //System.out.println("일월화수목금토".charAt(dayOfWeek));
	      return dayOfWeek;
	   }

	   // 홍길동
	   private static int getTotalDays(int year, int month, int day) {
	      // int year=2023, int month=7, int day=1
	      int totalDays = 0;
	 
	      totalDays = (year-1)*365 +(year-1)/4 - (year-1)/100 + (year-1)/400;
	    		   
	      for (int i = 1; i < month; i++) {
			totalDays+=getLastDay(year,i);
			
		} // for
	      totalDays++;
	      
	      return totalDays;
	   }

	// [2]
	private static int getLastDay(int year, int month) {
		int lastDay = 0;
		//						0(1월)									11(12월)
		int [] months = {31,28,31,30,31,30,31,31,30,31,30,31};
		lastDay = months[month-1];
		if (month==2 && days08.Ex05.isLeapYear(year))  lastDay++;		
		return lastDay;
	}
	 
}








