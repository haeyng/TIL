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
		String pattern = "yyyy/MM/dd E요일   hh:mm:ss.SSS";
		DateTimeFormatter df = DateTimeFormatter.ofPattern(pattern);
		String o = dt.format(df);//2023/08/11 금요일   10:53:33.495
		String o1 = df.format(dt);
		System.out.println(o);
		System.out.println(o1);
		
	}//main

}//class
