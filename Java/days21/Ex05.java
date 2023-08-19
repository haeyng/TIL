package days21;

import java.time.LocalDate;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오전 10:49:23
 * @subject
 * @content
 */
public class Ex05 {

	public static void main(String[] args) {
			//plusXXX(), plus(), minusXXX(), minus()
			//날짜와 시간 비교 : isAfter(), isBefore(), isEqual()
		
			//오늘이 생일인지?
			//1999.8.10
			//2023.8.10
			
			LocalDate today = LocalDate.now();
			
			//LocalDate birth = LocalDate.of(1999,8,10);
			LocalDate birth = LocalDate.of(1999,8,1);
			birth = birth.withYear(today.getYear());//birth =  받는코딩 중요
			System.out.println(birth);
			
			System.out.println(today.isBefore(birth));//생일 지나지 않았는지?
			System.out.println(today.isEqual(birth)); //오늘 생일인지?
			System.out.println(today.isAfter(birth)); //생일 지났는지?
			
			System.out.println(today.compareTo(birth)); // 양수 0 음수 //0이면 같다 // today-birth = 9
			
	}//main

}//class
