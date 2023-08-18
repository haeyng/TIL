package days20;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Ex04 {

	public static void main(String[] args) {
		// jdk 1.1 Calendar 추상 클래스 - 날짜, 시간
		// 왜 추상클래스인지? 그 지역에 맞는 달력을 직접 구현해서 쓰라는 의도로 추상클래스
		//Calendar c = new Calendar(); //객체 생성 못함 추상클래스라서

		//Calendar c = new GregorianCalendar(); //업캐스팅해서 사용가능
		//                                   ㄴBuddistCalendar 태국에서 사용되는 Calendar의 자식
		
		Calendar c = Calendar.getInstance(); //= new GregorianCalendar()
		
		//c.add(int 변경할 날짜,월,시간,분,초..의 필드값 , 2); -2 음수가되면 빼는 시간
		//c.clear(시간); == d.setHours(0);
		    //claer 하나로 시간,분,초를 필드로 주면 됨
		
		
		//Calendar
		//년
		System.out.println(c.get(1)); //2023 
		System.out.println(c.get(Calendar.YEAR)); //2023 
		
		//월
		System.out.println(c.get(Calendar.MONTH)+1); //8 
		
		//일
		System.out.println(c.get(Calendar.DATE)); //9
		System.out.println(c.get(Calendar.DAY_OF_MONTH));//9 
		
		//시간
		System.out.println(c.get(Calendar.HOUR)); //12(0~11시)
		System.out.println(c.get(Calendar.HOUR_OF_DAY)); //24(0~23)시 기준
		
		//분
		System.out.println(c.get(Calendar.MINUTE));
		
		//초
		System.out.println(c.get(Calendar.SECOND));
		
		//밀리세컨드
		System.out.println(c.get(Calendar.MILLISECOND));
		
		//요일
		System.out.println(c.get(Calendar.DAY_OF_WEEK));
			// Date 0이 일요일이었음
			// Calendar 1이 일요일~7이 토요일

		//오전,오후
		System.out.println(c.get(Calendar.AM));
		System.out.println(c.get(Calendar.AM_PM));
		
		System.out.println(c.get(Calendar.DAY_OF_YEAR)); //올해 221일째
		
		System.out.println(c.get(Calendar.WEEK_OF_MONTH)); //해당 월의 몇 번째 주
		
		System.out.println(c.get(Calendar.WEEK_OF_YEAR)); //해당 년도의 몇 번째 주
		
		
		
	}

}
