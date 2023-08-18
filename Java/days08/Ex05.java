package days08;

import java.util.Calendar;
/**
 * @author 송해영
 * @date 2023. 7. 24.-오전 11:34:21
 * @subject
 * @content
 */
public class Ex05 {

	public static void main(String[] args) {
		//연도를 입력받아서 윤년/평년을 체크하는 코딩.
		//연도를 매개변수로 받아서 윤년/평년 boolean형으로 반환하는 함수 선언
		
		/*
		int year = 2100;
		
		if (isLeapYear(year)) { //연도가 윤년인지?
			System.out.println("윤년(LeapYear)");
		} else {
			System.out.println("평년(CommonYear)");
		}//if
		*/

		// 2000~ 올해까지 윤년/평년체크?           ( 암기 )
		Calendar c = Calendar.getInstance();                                                                   //암기!
		int thisYear = c.get(Calendar.YEAR);   //달력의 연도값을 가져온다 Calendar.YEAR		      //암기!
		//System.out.println(c.get(1));     //2023이 나옴
		//System.out.println(Calendar.YEAR);     // 정수 1하고 같은 값 . 상수
		for (int i = 2000; i <= thisYear; i++) {
			System.out.printf("%d(%s)\n",i,isLeapYear(i)? "윤년" :"평년"); 
		} // for

	}//main
	
	//윤년 true값 반환 LeapYear
	//평년 false 반환 할거라 boolean형으로 함 CommonYear
	public static boolean isLeapYear(int year) {
		
		if (year % 4 ==0 && year % 100 !=0  ||  year % 400 == 0) {
			return true;
		}else {
			return false; // 
		}
		
		//태양년 : 1년 365.24219878일
		/*그레고리력의 정확한 윤년 규칙은 다음과 같다.	
		1.서력 기원 연수가 4로 나누어 떨어지는 해는 윤년으로 한다.  4의 배수 연도 윤년
		2.서력 기원 연수가 4, 100으로 나누어 떨어지는 해는 평년으로 한다. 
		3.서력 기원 연수가 4, 100, 400으로 나누어 떨어지는 해는 윤년으로 둔다. (1600년, 2000년, 2400년...)
		즉, 400년에 97년은 윤년이 되며, 1년은 평균 365.2425일이 된다. 
		이는 춘분점을 기준으로 한 태양년보다 0.0003일(26초)이 길기 때문에, 약 3,300년마다 1일의 편차가 난다.
		
		그레고리력 : 1년 365.2425
					400년 97번 윤년 
					 
					4년 마다   윤년      100번 
					100년     x           4번     96번
					400년                  1번     97번
		 */
	}
}//class
