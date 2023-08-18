package days02;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 9:20:04
 *@subject
 *@content 기본형 int를 String으로 변환하는 방법, 2진수, 8진수, 16진수로 변환하는것
 */
public class Ex15_02 {

	public static void main(String[] args) {

		int i = 10;

		// 10  -> "10" 형변환하려고 한다 (int -> String)
		// [첫번째 방법] i + ""
		String si = i + ""; // ""는 빈문자열이고 +는 문자연결연산자이다. 제일 쉽게 문자열로 바꾸는 방법
		
		// [두번째 방법]
		si = String.valueOf(i);  //String이라는 클래스에 valueOf라고 하는 함수에 i는 매개변수를 줌 -> 문자열 si가 된다
		
		// [세번째 방법]
		si = Integer.toString(i); //Integer라고 하는 래퍼클래스 함수는 toString 매개변수는 i 
		 
		// "1010"
		System.out.println( Integer.toBinaryString(i) ); //2진문자열 정수10을 알아서 2진형태의 문자열로 바꿔주는 함수 Integer.toBinaryString
		System.out.println( Integer.toString(i, 2) ); //두번째 인자값에 2를 실행해도 값이 같음 "1010"
		
		// "12"
		System.out.println( Integer.toOctalString(i) ); //8진수 형태 문자열로 만들어주는 함수
		System.out.println( Integer.toString(i, 8) );
		
		// "a"
		System.out.println( Integer.toHexString(i) ); //16진수 형태 문자열로 바꾸어주는 함수
		System.out.println( Integer.toString(i, 16) );

	}

}
