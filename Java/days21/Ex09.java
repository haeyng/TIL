package days21;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;

import static java.time.temporal.TemporalAdjusters.*;

import static java.time.DayOfWeek.*;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오전 11:52:21
 * @subject
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {

		//[TemporalAdjusters 클래스]
		//- 날짜, 시간을 수정,변경 할 때 : withXXX(), with(), plusXXX(), plus(), minusXXX(), minus()
		//- 자주 사용되는 날짜, 시간 변경하는 메서드들을 미리 구현해 놓은 클래스가 TemporalAdjusters 클래스이다.
		
		//예) 다음 년도의 첫 날은 언제?
		//		다음 달의 첫 날은 언제?
		//		올 해의 첫 날은 언제?
		//		이번 달의 첫 날은 언제?
		//		올 해의 마지막 날은 언제?
		//		***이번 달의 마지막 날짜*** : lastDayOfMonth()
		//		다음주 ?요일이 언제인지?
		//		지난 ?요일
		//		이번 달 n번째 요일?
		
		LocalDate d = LocalDate.now();
		System.out.println(d);
		
		//다음 달의 첫번째 날
		System.out.println(d.with(firstDayOfNextMonth()));
		
		//이번 달의 첫번째 날
		System.out.println(d.with(firstDayOfMonth()));
		
		//이번 달의 첫번째 월요일
		System.out.println(d.with(TemporalAdjusters.firstInMonth(MONDAY)));
		
		//지난 주의 화요일
		System.out.println(d.with(previous(TUESDAY)));
		//OrSame 오늘 포함
		System.out.println(d.with(previousOrSame(TUESDAY)));
		
		//다음주금요일 휴강
		System.out.println(d.with(next(FRIDAY)));
		//OrSame 오늘 포함
		System.out.println(d.with(nextOrSame(FRIDAY)));
		
		//이번 달의 네번째 화요일
		System.out.println(d.with(dayOfWeekInMonth(4, TUESDAY)));
		
		//3일 뒤에 만나자(약속)
		//d =d.plusDays(3);
		d = d.with(new DayAfter3일());
		System.out.println(d);
		
		
	}//main

}//class

class DayAfter3일 implements TemporalAdjuster{

	@Override
	public Temporal adjustInto(Temporal temporal) {
		
		return temporal.plus(3, ChronoUnit.DAYS);
	}
	
}
