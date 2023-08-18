package days21;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;
import java.util.Calendar;
import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오전 11:31:13
 * @subject
 * @content
 */
public class Ex08 {

	public static void main(String[] args) {

		//이번 달이 마지막 날짜가 몇 일까지 있는지?
		//1. Date
		Date d = new Date();
		d.setMonth(d.getMonth()+1);
		//d.setDate()+1;
		d.setDate(d.getDate()-1);
		//2. Calendar
		Calendar c = Calendar.getInstance();
		c.getActualMaximum(Calendar.DATE);
		
		/*[LocalDate.parse()]
		//3. LocalDate
		//String s = "2019년 12월 30일";
		//String s = "2019. 12. 30.";
		//String s = "2019/12/30";
		String s = "2019-12-30";
		LocalDate ld = LocalDate.parse(s);
		System.out.println(ld);
		*/
		
		/*
		LocalDate today = LocalDate.now();
		LocalDate firstday = today.withDayOfMonth(1);
		System.out.println(firstday);
	
		System.out.println(today.lengthOfMonth());//31마지막 날짜만
		
		//마지막 날짜를 객체로 생성함
		LocalDate lastDay = today.withDayOfMonth(today.lengthOfMonth());
		System.out.println(lastDay);
		*/
		
		//[2]
		LocalDate today = LocalDate.now();
		LocalDate lastDay =  today.with(TemporalAdjusters.lastDayOfMonth());
		System.out.println(lastDay);
		
		
		//TemporalAdjuster ?
		
		
		
		
		
		
		
		
	}//main

}//class
