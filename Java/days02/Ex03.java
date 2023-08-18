package days02;

/**
 *@author 송해영
 *@date 2023. 7. 15.-오전 12:29:17
 *@subject 지역변수(Local Variable)----- 시험1)
 *@content
 */
public class Ex03 {
	
	//char grade = 'A';
	
	public static void main(String[] args) {
			//String %s, int %d, double
			//한 문자를 저장하는 자료형 : char
			//자바에서 문자를 나타낼 때는 '한문자'를 사용한다
			
			char grade = 'A'; //Local Variable(지역변수)
			//System.out.printf("출력형식", grade);
			//System.out.printf("등급 : '%'c", grade); // \' 붙여도 되고 안붙여도 되고
			
			//코드영역(블럭)
			// {}영역(범위)을 나타내는 연산자
			
			//char grade = 'A'; // main 함수 안에서 사용하는 지역변수
			
			{
				// char grade = 'A'; //{}영역 안에서 사용하는 Local Variable 지역변수
				System.out.printf("등급 : '%c'", grade);
			}
			// grade cannot be resolved to a variable
			// grade 변수를 선언 X, 인식할 수 없다
			// -> 변수를 main 매서드 {} 영역 안에 선언해야 함
			// 맨 윗줄 변수 선언문을 살리고 main 매서드 영역안의 변수 선언문을 주석처리하면 뜨는 오류 메세지
			System.out.printf("등급 : '%c'", grade);

	} // main

} // class