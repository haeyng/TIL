package days20;
/**
 * @author 송해영
 * @date 2023. 8. 9. - 오후 3:32:05
 * @subject        시험
 * @content
 */
public class Ex11 {

	public static void main(String[] args) {

		/*Date(jdk1.0)
		 *Calendar(jdk1.1)
		 *
		 * [jdk1.8 새로 추가된 날짜, 시간 클래스 (java.time 패키지)]
		 * 1. java.time : 날짜, 시간을 다루는 핵심 클래스를 제공 
		 * 		패키지는 4개의 하위 패키지를 가지고 있다.
		 *   ㄴ j.t.chrono : 표준(ISO)이 아닌 달력 시스템을 위한 클래스들을 제공한다. 
		 *   ㄴ j.t.format : 형식화(파싱) 클래스들을 제공한다.
		 *   ㄴ j.t.temporal(시간의) : 날짜, 시간의 필드(field)와 단위(unit)과 관련된 클래스를 제공한다.
		 *   ㄴ j.t.zone : 시간대(time-zone) 클래스를 제공한다
		 * 
		 * 2. java.time : 날짜, 시간을 다루는 핵심 클래스
		 *  1) 날짜 : LocalDate 클래스
		 *  2) 시간 : LocalTime 클래스
		 *  3) 날짜+시간 : LocalDateTime 클래스
		 *  4) 날짜+시간+시간대 : ZonedDateTime 클래스
	 
		 *   ->Temporal, TemporalAdjuster 인터페이스를 구현
		 * 
		 * 3. new 연산자로 객체 생성을 하지 않음 -> now(), of() 메서드를 사용해 객체생성함.
		 *
		 * 4. 날짜와 날짜 사이의 간격 : Period 
		 *     시간과 시간 사이의 간격 : Duration
		 *     ->TemporalAmount 인터페이스 구현
		 *     
		 * 5. 날짜와 시간의 단위를 정의해 놓은 것이 
		 * 		ㄴ Temporal[Unit] 인터페이스 
		 * 		ㄴ ChronoUnit 클래스
		 * 		
		 * 6. 년,월,일 등의 날짜와 시간의 [필드(field)]를 정의해 놓은 것이
		 * 		ㄴ Temporal[Field] 인터페이스
		 * 		ㄴ Chrono[Field] 인터페이스
		 * 
		 * 	예)Ex12.java
		 * 
		 * 7. 특정 필드(년,월,일,시간,분...등)를 가져오기
		 * 		ㄴgetXXX() : int getYear()
		 * 		ㄴget(필드)
		 * 
		 * 8. 특정 필드를 수정할때 : with(), plus(), minus()
		 * 		1)Date d.setYear(????);
		 * 		2)Calendar c;
		 * 		c.set(Calendar.YEAR,???);	        roll()		add()
		 * */
		
		
		
		
		
	}//main

}//class
