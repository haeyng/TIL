package days15;

import java.io.IOException;

public class Ex05 {

	public static void main(String[] args) {
		//단일 상속
		//다중 상속 : 자바는 지원 안함 대신 인터페이스 구현
		
		/* class Tv{  int power; }
		 * class VCR{ int power; }
		 * 
		 *                    다중상속 X -> [ 인터페이스 구현]
		 * class TVCR extends Tv , VCR{     // Tv + VCR
		 *    int power;
		 *    int power;
		 * }
		 * */
		
		//[오버라이딩 주의사항] -----암기!
		// 1. 정의 : 부모 클래스로부터 상속받은 메서드를 재정의하는 것.
		// 2. override 사전적 의미 == overwrite == 위에 덮어쓰다.
		// 3. 오버라이딩의 조건
		//		1) 메서드명을 수정하면 안됨 부모꺼 그대로
		//		2) 부모의 매개변수와 동일하게 해야됨 (갯수)
		//		3) 리턴타입이 동일해야한다 
		//		4) 접근지정자는 부모의 접근지정자 범위보다 같거나 넓어야된다.
		//		5) 부모의 메서드보다 많은 수의 예외를 선언할 수 없다.
		//		6) 인스턴스 메서드 <-> static 메서드로 변경 못한다.
		//		
		
	}//class

}//main

class Parent{
	 int print(String n, int a) throws IOException{
		return 100;
	}
}

class Child extends Parent{
	
	//The method print(String) of type Child must override or implement a supertype method
	//Cannot reduce the visibility of the inherited method from Parent : 부모의 접근지정자보다 접근지정자를 줄일 수 없다
	//@Override
	protected int print(String name) throws IOException, NullPointerException{
		return 200;
	}
}
