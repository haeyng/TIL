package days01;

// Alt + Shift + J
/**
 *@author 송해영
 *@date 2023. 7. 14.-오후 8:38:57
 *@subject 자바의 변수와 상수
 *@content 1. 변수,상수 개념 설명
 *				  2. 변수 선언형식
 *				  3. 예제
 */

public class Ex03 {
	public static void main(String[] args) {

		/*1. 변수(Variable)
		 *  1)변하는 수(수학적 의미)
		 *  2)메모리 상의 값을 저장하는 공간(프로그램 언어)
		 * 
		 *2. 상수(const)
		 *  1)변하지 않는 수(==고정된 수)
		 *  2)메모리 상의 값을 저장하는 공간(프로그램 언어)
		 *  
		 *  [선언형식]에는 1.클래스, 2.함수(매서드) 선언형식이 있고
		 *  3.변수 선언 형식(도 외우기)
		 *  	자료형 변수명[==초기값];
		 *  	자료형==데이터 타입(data type)
		 *  
		 *  4.실습
		 *  ; 세미콜론 명령라인 종결 연산자
		 *  자바에서 문자열==문자의 나열 ->"문자열"
		 *  자바에서 한 문자                     '이'
		 *  송해영 변수로 인식을 했는데 변수를 지정하지 않아 오류가 생김
		 *  송해영 cannot be resolved to a variable(변수를 지정하지 않아 생기는 오류메세지)
		     System.out.println(송해영);
		 */
		
		/*이름을 선언하는 문자열 변수 선언
		 * 
		 *  p 26
		 *  변수 이름을 명명하는 규칙
		 *  ["송해영"]
		 *  name
		 */
		String name = "송해영"; // 여기서 =는 대입(할당)연산자
		System.out.println(name);
		
		//String name="이창익";
		//을 입력해버리면 Duplicate local variable name 에러가 뜬다
		//이 에러의 의미는 로컬(지역)변수가 중복 선언되었다는 뜻
		
		name = "이창익"; // 으로 변경한다 여기서 =도 대입(할당)연산자
		
	}//main

}//class
