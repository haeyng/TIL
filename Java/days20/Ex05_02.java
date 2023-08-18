package days20;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 12:09:13
 * @subject 날짜, 시간 정보를 사용자가 원하는 형식으로 출력하는 방법.
 * @content
 */
public class Ex05_02 {

	public static void main(String[] args) {

		//SimpleDateFormat 형식화 클래스	
		
		String pattern = "yyyy. MM. dd. a hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		/*Date 클래스
		Date today = new Date();
		String strToday = sdf.format(today);
		System.out.println(strToday);
		//2023. 08. 09. 오후 12:18:18
		*/
		
		Calendar c = Calendar.getInstance();
		// Calendar -> Date 형 변환 해야지 적용가능
		//long t = c.getTimeInMillis();
		//Date today = new Date(c.getTimeInMillis()); - 첫번째 방법
		
		
		Date today = c.getTime();// 두번째 방법
		String strToday = sdf.format(today);
		System.out.println(strToday);
		
		
		
	}//main

}//class



