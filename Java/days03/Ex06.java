package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 3:11:43
 * @subject
 * @content
 */
public class Ex06 {

	public static void main(String[] args) {

		//산술연산자, 비교연산자, 논리연산자, 단항연산자
		//삼항연산자 : 피연산자가 3개   ?: 하나밖에 없음
		// [항1]?항2:항3          -  항1은 참/거짓으로 판단되는 수식이 된다
		// 항1이 참이면 결과값은 항2이 된다 
		// 항1이 거짓이면 결과값은 항3이 된다
		
		int x = 10;
		//            1항     2항    3항
		int y = (x>20 ? 100 : 200);  // 항1은 거짓 항3 //삼항연산자는 대입보다 우선순위
		//int y = (200); 200이 할당되서 출력 //3항연산자 속에 삼항연산자가 들어갈 수 있다.
		System.out.printf("> x=%d, y=%d\n", x, y);
		
	}//main

}//class
