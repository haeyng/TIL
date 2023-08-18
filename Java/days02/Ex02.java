package days02;

/**
 *@author 송해영
 *@date 2023. 7. 15.-오전 12:18:52
 *@subject 식별자와 키워드 구분
 *@content 변수, 상수, 리터럴 구분
 *               상수 문법 - 대문자로 사용, final, _ 등등 다른값으로 재할당X
 */
public class Ex02 {

	public static void main(String[] args) {
		/*키워드(keyword):의미가 부여된 예약어
		 *식별자(identifier):개발자가 부여한 이름들
		 *                       변수명, 클래스명, 함수명 등등..                  
		 * */
		
		String name; // name 변수
		name = "홍길동";
		//출력됨
		name = "김길동";
		//출력됨
		
		//변수와 상수 설명
		//-값을 저장하는 메모리 상의 저장공간
		//-변하는 수, 고정된 수
		
		//원주율 PI 3.141592..
		//변수 (숫자:정수,실수)
		//변수 선언 형식 p30
		//자료형 상수 [=초기값];
		
		//String firstName 변수
		//String FIRST_NAME 상수, MAX_VALUE, MIN_VALUE
		final double PI = 3.141592;
		
		//PI = 3.24;
		//The final local variable PI cannot be assigned.
		//상수는 재할당할 수 없다
		
		//리터럴 1 ture 'A' 3.14
		
	}//main

}//class
