package days16;

import days15.Employee;
import days15.Regular; //ctrl + shift + o
import days15.SalesMan;
import days15.Temp;

public class Ex02 {

	public static void main(String[] args) {

		//Regular e1 = new Regular();
		//dispGetPay(e1);
		
		SalesMan e2 = new SalesMan(); //자식객체를 생성하면 부모객체들이 먼저 생성되고, 부모 생성자들이 먼저 호출된다.
		dispGetPay(e2);
		
		//Temp e3 = new Temp();
		//dispGetPay(e3);
		
	}//main
	
	//인스턴스 메서드 -> 클래스 메서드로 만들기(static 붙이기)
	public static void dispGetPay(Employee emp) { // 매개변수 다형성	Employee emp가 Regular SalesMan Temp 다 받음
		//emp 가 Regular,SalesMan,Temp중에 어떤 객체를 받았는지 모름..
		//어떤 인스턴스의 객체인지 (뭘 받았는지) 확인하는 연산자가 있음 - instanceof 연산자 
		
			//1)상속관계 클래스들은 자식 먼저 물어보고 뒤에는 안물어보게 순서를 바꾸고 
			//2)else if구문으로 확인해야한다. 
		if (emp instanceof SalesMan) { 
			System.out.println(">emp 객체는 SalesMan 타입이다.");
				SalesMan s1 =(SalesMan)emp;
		} // if
			else if (emp instanceof Regular) {
			System.out.println(">emp 객체는 Regular 타입이다.");
				Regular r1 = (Regular)emp;
			} // if
			else if (emp instanceof Temp) {
			System.out.println(">emp 객체는 Temp 타입이다.");
			} // if
		//확인작업 거치고 다시 그 객체로 다운캐스팅해서 다른일~
		emp.getPay();
	}
		

}//class
