package days20;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 12:42:27
 * @subject add() set() roll() 차이점
 * @content
 */
public class Ex06_02 {

	public static void main(String[] args) {

		//2023. 8
		Calendar c = new GregorianCalendar(2023, 8-1, 1);
		//하루 전
		
		//날짜 세팅할때 많이 사용
		//c.set(Calendar.DATE,-1);//2023-07-30 // 원하는 날짜를 세팅하는 함수이지 날짜 증감으로 사용하지는 않음
		//c.set(Calendar.DATE,0);//2023-07-31
		//c.set(Calendar.DATE,10);
		//c.set(Calendar.DATE,32);
		
		//날짜 증감에 사용하는 함수 - 많이 사용됨
		//c.add(Calendar.DATE, -1); // c 날짜 : 날짜 -1 감소
		//c.add(Calendar.DATE, 1); //c 날짜 : 날짜 1 증가
		//달력 그릴때 사용 요일,날짜 FOR문
		
		
		//c.roll(Calendar.DATE,-1); //연,월 영향X 날짜만 영향 - 잘 쓰이지 않음
		System.out.println(Ex05.getPatternDate(c, "yyyy-MM-dd"));
		
		
		
	}//main

}//class
