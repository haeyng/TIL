package days13;
/**
 * @author 송해영
 * @date 2023. 7. 31. - 오후 12:07:08
 * @subject
 * @content
 */
public class Ex04 {

	public static void main(String[] args) {
		
		//[패키지 내부]
		//Tv 클래스와 Ex04 클래스는 같은 패키지 안에 있다. (days13)
		Tv tv1 = new Tv();
		System.out.println(tv1.channel); //0
		
		//[패키지 외부] 상속 + 참조 가능 테스트(확인)
		
		
		//[접근지정자]
		//1. 클래스 앞에 접근지정자 
		// public     : 패키지 내부, 외부 어디서든 상속과 참조 가능.
		// default(==package)(아무것도 안붙임) : 패키지 내부에서만 상속과 참조 가능.
		
		//독립적인 클래스로 선언할때는 사용할 수 없는 접근지정자이다.
		//(중첩 클래스로 선언 할 때 사용할 수 있다.)
		//(내부클래스 4가지 종류)
		// private    비활성 - 같은 파일 내에서만 상속, 참조가 가능하다.
		// protected 비활성 - default +  패키지 외부에서는 상속만 가능.  
		
		//1-2.클래스 앞에 기타제어자
		// abstract - 추상클래스를 만들때 사용하는것.
		// final - 최종클래스를 만들때 사용
		// static   비활성 - 중첩클래스를 선언할때만 사용가능함

		//2. 멤버(필드,메서드) 앞에 접근지정자
		// public
		// default
		// private
		// protected
		
		
	}//main

}//class
