package days19;

import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 8. - 오후 4:03:40
 * @subject
 * @content
 */
public class Ex12 {

	public static void main(String[] args) {

		//[달력]
		//년, 월, 1일   무슨 요일?
		
		int year = 2010;
		int month = 5;
		int date = 1;
		
		/*
		Date d = new Date();
		//d.getXXX(); XXX값을 얻어오는 함수
		d.setYear(year-1900);  //설정하는 함수
		d.setMonth(month - 1);
		d.setDate(date);
		
		d.setHours(0);
		d.setMinutes(0);
		d.setSeconds(0);
		*/
		
		Date d = new Date(year-1900, month-1, date);
		
		System.out.println(d.toLocaleString());
		
		System.out.println(d.getDay());
		System.out.println("일월화수목금토".charAt(d.getDay()));
		
		
		//2010년 5월의 마지막 날짜? 28,29,30,31
		d.setMonth(month);
		System.out.println(d.toLocaleString());
		//2010. 6. 1. 오전 12:00:00 - 하루
		
		date = d.getDate() - 1;
		d.setDate(date);
		System.out.println(d.toLocaleString());
		System.out.println(d.getDate()); //마지막 날짜
		
		
	}//main

}//class
