package days02;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 8:53:00
 *@subject 형변환
 *@content
 */
public class Ex15 {

	public static void main(String[] args) {

		// String <-> byte 형변환 
		// "20"   <-> 20 으로 형변환
		// byte age = "20";
		
		
		// 기본형(int) -> 물건(객체,Object, 클래스 )  래퍼클래스( WrapperClass )
		// 래퍼 클래스: 기본형을 사용하기 쉽도록 물건을 만들어놨다=객체를 만들어놨다=object를 만들어놨다
		// 기본형을 8가지를 가공해서 각각 만든 클래스라고 해서 래퍼클래스라고 함
		
		
		//기본형 Integer 를 사용하기 쉽도록(가장 큰값을 계산하지 않고 쉽게 불러옴) 클래스로 만들어놓은 래퍼클래스가 MAX_VALUE
		int i = Integer.MAX_VALUE; //    2147483647; // int 자료형의 가장 큰 값을 대입시킴.
		
		
		
		// 기본형 Integer 를 사용하기 쉽도록(문자열을 int값으로 쉽게 변환 시켜주는 함수) 클래스로 만들어놓은 래퍼클래스가 Integer.parseInt
	    int j =	Integer.parseInt("20");	    
	    // String -> byte 형변환
	    byte age = Byte.parseByte("20"); //첫번째 글자가 대문자는 class 
	    //(소문자byte는 기본형, 대문자Byte는 기능하기 쉽도록 만든 클래스==물건)
	    
	    // Long.parseLong(null)
	    // Short.parseShort(null)
		// 대문자들은 기본형을 사용하기 쉽도록 만들어놓은 기능이 구현된 클래스 : 래퍼클래스
	    
	}//main

}//class
