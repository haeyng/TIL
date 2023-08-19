package days22;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오전 10:01:41
 * @subject
 * @content
 */
public class Ex01 {

	public static void main(String[] args) {

		//[2]
		LocalDateTime dt = LocalDateTime.now();
		System.out.println( dt ); // 2023-08-11T10:05:18.953979700
		
		// 2023/08/11 금요일   07:02:32.259로 출력하려고 한다.
		// 형식화 클래스  Date, Calendar  SimpleDateFormat
		//                                parse(), format()
		String pattern = "yyyy/MM/dd E요일   hh:mm:ss.SSS";
		DateTimeFormatter df = DateTimeFormatter.ofPattern(pattern);
		
		String output1 = dt.format(df); //2023/08/11 금요일   10:53:33.495
		String output2 = df.format(dt); // 매개변수 다형성		
		// 여기서 df와 dt의 위치를 바꿔서 출력했는데도 같은 값이 나온다 이유가
	
		System.out.println(output1);
		System.out.println(output2);
		
	}//main

}//class
