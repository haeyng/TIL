package days15;

public class Ex08 {

	public static void main(String[] args) {
		/*[1번]
		Employee emp1 = new Employee("이준희", "서울 강남구", "010-1234-1234", "2022.12.12");
		
		emp1.dispEmpInfo();
		//Object.toString() -> Overriding 		
		
		System.out.println(emp1.toString());//toString() 함수는 object꺼    Object 상속 생략되어있음
		System.out.println(emp1); //객체만 쓰면 toStirng()이 생략되어 있는것과 같음
		*/
		
		
		//[is-a 관계(상속)]
		//정규직사원은 사원이다. O
		
		
		/*
		//[2번]
		Regular emp2 = new Regular("주강민","서울 양천구","010-1234-1234","2021.03.21",4000000);
		//문제점 : 기본급 출력안됨
		emp2.dispEmpInfo();
		System.out.println(emp2); //@toString()
		*/
		
		/*
		//[3번]
		//[상속 조건]
		//Employee =  Regular클래스들간의 자동형변환
		//부모클래스 emp2 = new 자식클래스  
		//클래스들간의 자동형변환이 일어나려면 상속관계가 있어야 한다. 조건
		//[업캐스팅(upcasting)] //자식객체를 new 연산자로 생성해서 부모객체 타입에 참조시킨다.
		//이상한 점... 기본급:4000000 출력
		//Employee 클래스의 dispEmpInfo()가 아니라 실제 생성된 Regular 객체의 dispEmpInfo()의 메서드가 호출됨. -> 기본급이 출력되니까
		Employee emp2 = new Regular("주강민","서울 양천구","010-1234-1234","2021.03.21",4000000);
		emp2.dispEmpInfo();		
		//[업캐스팅-문제점]
		//emp2.getPay(); //Regular에 함수를 만들어 줬는데도 호출,사용 못함
		*/
		
		//Type mismatch: cannot convert from Employee to Regular
		//부모클래스 객체를 자식 클래스 객체에 참조 시키는것 : 다운 캐스팅(downcasting)은 캐스트 연산자로 반드시 강제로 형변환 해줘야한다.
		//(조건) 업캐스팅한 객체만 다시 다운캐스팅 할 수 있다.
		//Regular emp =(Regular) emp2; 
		
		
		
		/*
		 
		//Type mismatch: cannot convert from Employee to Regular : 캐스트 연산자가 클래스들간의 형변환할때도 사용됨 (컴파일오류) 
		// java.lang.ClassCastException : 실행할때 발생하는 오류(런타임오류)
		Regular emp = (Regular) new Employee("이준희", "서울 강남구", "010-1234-1234", "2022.12.12");
		*/
		
		/*
		//[4번] SalesMan , Regular, Employee(오류,getpay함수 없음) 에 참조 시켜봄
		Employee emp3 = new SalesMan("임경재","경기도 성남시","010-1234-1234","2021.03.12",500000,20,70000);
		emp3.dispEmpInfo();
		System.out.println(emp3.getPay());   x
		*/
		
		/*
		//[5번]
		Employee emp4 = new Temp("박정호","서울시 목동","010-1234-1234","2020.01.01",20,250000);
		emp4.dispEmpInfo();
		System.out.println(emp4.getPay());
		*/
	
		
		
	}//main

}//class
