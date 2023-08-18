package days19;

import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 8. - 오후 3:26:27
 * @subject 날짜, 시간을 다루는 클래스 + 형식화(formmatting) 클래스
 * @content [일정관리] 
 
 *					
 *
 */
public class Ex11 {

	public static void main(String[] args) {

		//jdk 1.0   java.util.Date
		//jdk 1.1   java.util.Calendar
		//								ㄴGregorianCalendar
		//jdk 1.8   java.time 패키지 안에 여러 하위 패키지와 다양한 클래스 추가
		
		Date d = new Date(); 
		
		//System.out.println(d.toString());
		System.out.println(d);//Tue Aug 08 15:38:17 KST 2023
		
		//그리니치 표준시, 세계 표준 시간
		System.out.println(d.toGMTString());//8 Aug 2023 06:38:17 GMT
		
		//2023. 8. 8. 오후 3:40:03
		System.out.println(d.toLocaleString());
		
		//년
		System.out.println(d.getYear()+1900);
		//1월 0 12월 11       
		System.out.println(d.getMonth() + 1 );
		//일
		System.out.println(d.getDate());
		//시간
		System.out.println(d.getHours());
		//분
		System.out.println(d.getMinutes());
		//초
		System.out.println(d.getSeconds());
		//밀리세컨드  1000ms = 1초 
		//없음!
		
		//요일
		System.out.println(d.getDay());
		System.out.println("일월화수목금토".charAt(d.getDay()));
		
		//1970.1.1 0:0:0 ~ 밀리세컨드값 long형으로 반환
		System.out.println(d.getTime()); //자주 사용 됨!
		
		
	}//main

}//class
