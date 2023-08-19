package days20;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 2:32:47
 * @subject 형식화 클래스
 * @content 
 * 					Decimalformat
 * 					format()  숫자 -> 원하는 형식의 문자열로 변환 
 * 					parse()   문자열-> 숫자
			
					SimpleDateFormat
					format() 날짜 -> 원하는 형식의 문자열
					parse()   문자열-> 날짜
 */
public class Ex08 {

	public static void main(String[] args) {

		// 23년 8월 9일 "수요일"  문자열을 날짜(Date, Calendar)로 변환?
		
		String strDate = "23년 8월 9일 (수요일)";
		
		//요일 패턴 기호? E 
		String pattern = "yy년 MM월 dd일 (E)";
		
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		try {
			Date d = sdf.parse(strDate);
			System.out.println(d.toLocaleString());
			
			//Date -> Calendar 형변환			
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			 // S 밀리세컨드
			System.out.println(Ex05.getPatternDate(c, pattern));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}//main

}//class
