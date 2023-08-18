package days24;
/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 4:54:28
 * @subject
 * @content
 */
public class Ex14 {

	public static void main(String[] args) {

		//[열거형(enums)]
		//1. jdk 1.5 추가
		//2. 서로 관련된 상수를 편리하게 사용하기 위한 것.
		//	  예) 팀 프로젝트 
		//			남자/여자 체크해서 코딩.
		//			A 팀원 1/0 체크해서 코딩
		//			B 팀원 true/false 체크해서 코딩
		//			C 팀원 'm'/'f' 체크해서 코딩
		//		표준화 X->유지,보수 힘듦
		
		//3. 열거형 선언형식
		//	enum 열거형이름 { 상수명, 상수명, ...};
		//4. 열거형이 컴파일 될 때 클래스로 컴파일 되어진다. ==> 일종의 클래스다.
		//	  열거형의 부모클래스는 java.lang.Enum 클래스이다.
		//5. 열거형을 사용하는 방법 : 열거형이름.상수명 
		
		//6. Enum 클래스 
		//		1) name() : 열거형 상수의 *이름*을 문자열로 반환
		//		2) ordinal() : 열거형 상수가 정의된 *순서*를 반환
		//		3) valueOf() : 열거형의 이름과 일치하는 *열거형 상수*를 반환
		//		4) getDeclaringClass() : 열거형의 *class 객체*를 반환하는 메서드
		
		Card [] cards = Card.values();
		for (Card card : cards) {
			System.out.printf("%s\t%d\n",card.name(), card.ordinal());
		}
		
//		System.out.println(Card.valueOf("HEART"));//HEART
		
		switch (Card.valueOf("HEART")) {
		case CLOVER:
			break;
		case DIAMOND:
			break;
		case HEART:
			System.out.println("하트");
			break;
		case SPADE:
			break;
		}//switch
		
		
		
		
		
		
		
	}//main

//class InnerAP{} //중첩클래스	
//interface InnerIA{}
//enum InnerCard{} 

}//class

class A{
}

interface IA{
}

//enum Card{}













