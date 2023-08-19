package days14;

import java.util.Date;
import java.util.Random;
import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		
		Random rnd = new Random(10000L); //long 형으로 seed값이 들어가 필드 초기화.
		//생성자를 사용해서 객체의 필드를 10000L 초기화
		//Random(10000L) : 생성자
		//new : 생성자를 호출하기 위한 예약어
		
		Scanner scanner = new Scanner(System.in);
		
		int year = 2023;
		int month = 10;
		int day = 25;
		
		Date d = new Date(year-1900, month-1, day);//2023. 10. 25. 오전 12:00:00
		System.out.println(d.toLocaleString());//2023. 8. 1. 오전 10:48:24 //현재 시스템의 날짜 + 시간 정보 //local이 들어가면 해당 지역
		System.out.println(d.toString());
		
		System.out.println(d.getDay()); // 3 수요일
		
	}//main

}//class
