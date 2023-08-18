package days16;

public class Ex03 {

	public static void main(String[] args) {
		//1. 지역변수 -> 상수 (final 키워드)
		final double pi = 3.141592;
		
		//3.141592 pi 
		//3.141592 pi
		//3.141592 pi
		//3.141592 pi
		
		//FinalTest.PI - static
		
		FinalTest obj = new FinalTest();
		System.out.println(obj.PI);
		
		//int value = 100; //final int value로 하고 값을 100으로 지정하면 변경 불가능 상수.
		//obj.finalTest(value);
		
		//The final field FinalTest.PI cannot be assigned 상수화 되어져있기 때문에 다른값으로 할당할수없음
		//obj.PI=3.14;
		
		//Math.PI
		
		//변수 초기화 3가지
		
		
	}//main

}//class



/*
//The type Parent is already defined : 앞에서 선언된 클래스
class Parent{
	//재정의 할 수 없는 최종(마지막) 메서드
	final void dispA() {
		//구현
	}
}
class Child extends Parent{
	
//	@Override
//	void dispA() { //Cannot override the final method from Parent
//		//구현
//	}
}
*/



final class FinalTest{
	//상수 필드
	//public static final double PI = 3.141592; //명시적 초기화
	//접         기타제어자  
	
	//The blank final field PI may not have been initialized : PI초기화 안되어있음
	final double PI;

	
	
	/*
	{
		PI=3.14; //인스턴스 초기화 블럭
	}
	*/
	
	
	
	public FinalTest() {
		PI = 3.14; //생성자 초기화
	}
	
	public void finalTest(final int value) { //int value는 지역변수라고 해도 되고 호출할때 사용하는 매개변수라고 해도 됨
		//
		//
		//value++; 불가능
		//value = 1000; 불가능 final을 붙이면 value를 상수로 쓰겠다는 뜻
	}
	
	
}





