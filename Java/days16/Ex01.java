package days16;

public class Ex01 {

	public static void main(String[] args) {

		//new Parent(); //객체 생성시 오류
		
		//추상클래스인 parent도 업캐스팅 가능 
		//Parent p1 = new Child();
		
		//Child c1 = new Descendant(); 가능
		
		Parent p1 = new Descendant();//가능
		
	}//main

}//class

//상속계층도에 의해서 자식클래스가 나온다는것
//공통적인 멤버를 가진 부모클래스, abstract 키워드 - 추상클래스
//추상클래스도 일종의 클래스.
//추상메서드가 없어도 abstract로 추상클래스 선언 가능
abstract class Parent{
	 //필드
	//메서드
	//추상메서드
	abstract void dispA();
	abstract void dispB();
}

abstract class Child extends Parent{

	@Override
	void dispA() {} //부모 추상메서드가 2개인데 일부분 1개만 재정의하면 child클래스는 아직 추상 메서드를 가지고 있기 때문에 추상클래스가 되어야한다.

	//필드
	//메서드
}


class Descendant extends Child{

	@Override
	void dispB() {}
		
}




/*
class Child extends Parent{

	@Override
	void dispA() {}

	@Override
	void dispB() {}
	//필드
	//메서드
}
*/


/*
abstract class Child extends Parent{
	//필드
	//메서드
}
*/