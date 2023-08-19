package days21;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오전 11:18:45
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {

		//LocalDate
		//LocalTime

		//LocalDateTime 날짜 + 시간

		//LocalDateTime dt = LocalDateTime.now();
		//System.out.println(dt);

		//truncate : 절삭(내림)
		//dt =dt.truncatedTo(ChronoUnit.HOURS);//시간 밑에서부터 절삭
		//dt =dt.truncatedTo(ChronoUnit.DAYS);

		//System.out.println(dt);

		/*
			LocalDate d = LocalDate.now();
			LocalTime t = LocalTime.now();

			LocalDateTime dt = LocalDateTime.of(d, t);

			LocalDateTime dt2 =  d.atTime(t);
			LocalDateTime dt3 =  t.atDate(d);
		 */

		LocalDateTime dt = LocalDateTime.now();
		//LocalDateTime -> LocalDate 변환
		LocalDate d = dt.toLocalDate();

		//LocalDateTime -> LocalTime 변환
		LocalTime t = dt.toLocalTime();


	}//main

}//class
