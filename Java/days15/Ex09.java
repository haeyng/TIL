package days15;
/**
 * @author 송해영
 * @date 2023. 8. 2. - 오후 4:34:46
 * @subject
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {

		//1) 상속관계 문제점
		//    E e1 =new R();
		//    E e1 =new T();
		//    E e1 =new S();
		//      e1.getPay();호출 못함 Employee에 함수가 없음
		//    왜? Employee 클래스 안에 getPay(); 함수 선언을 안했을까
		//    =>Employee에 getPay()함수 만들어보기
		
		
		// 학생 관리 : 초등, 중, 고, 대학생..
		//				추상 클래스로 학생클래스 : 공통적으로 가지고 있을 멤버 선언
		//공통적으로 가지고 있을 멤버를 만들때 추상클래스를 만든다.
		
		//[다형성] - "여러 가지 형태를 가질 수 있는 능력"
		/*
		 * E e1 = new R();
		 * E e2 = new S();
		 * E e3 = new T();
		 * 
		 * */
		
		//Cannot instantiate the type Employee : 인스턴스화 할 수 없다.
		// 불완전 클래스 == 추상클래스 는 new 연산자로 객체 생성할 수 없다
		//Employee emp1 = new Employee("이준희", "서울 강남구", "010-1234-1234", "2022.12.12");
		
		/*
		Regular emp1 = new Regular("주강민","서울 양천구","010-1234-1234","2021.03.21",4000000);
		SalesMan emp2 = new SalesMan("임경재","경기도 성남시","010-1234-1234","2021.03.12",500000,20,70000);
		Temp emp3 = new Temp("박정호","서울시 목동","010-1234-1234","2020.01.01",20,250000);
		
		emp1.getPay();
		emp2.getPay();
		emp3.getPay();
		*/
		
		/*
		Employee [] emps = new Employee[3];
		//업캐스팅(자동형변환)
		emps[0]=new Regular("주강민","서울 양천구","010-1234-1234","2021.03.21",4000000);
		emps[1]=new SalesMan("임경재","경기도 성남시","010-1234-1234","2021.03.12",500000,20,70000);
		emps[2]=new Temp("박정호","서울시 목동","010-1234-1234","2020.01.01",20,250000);
		*/
		
		//클래스 배열 초기화
		Employee [] emps = {
				new Regular("주강민","서울 양천구","010-1234-1234","2021.03.21",4000000),
				new SalesMan("임경재","경기도 성남시","010-1234-1234","2021.03.12",500000,20,70000),
				new Temp("박정호","서울시 목동","010-1234-1234","2020.01.01",20,250000)
		};
		for (int i = 0; i < emps.length; i++) {
			emps[i].getPay();
		} // for
		
		dispGetPay(emps[0]);
		dispGetPay(emps[1]);
		dispGetPay(emps[2]);
		
		dispGetPay( new Temp2());
		
	}//main

	
	
	
	
	//사원의 급여를 출력하는 메서드
	public static void dispGetPay(Employee emp) { // 매개변수 다형성
		System.out.println( emp.getPay() );
	}
	// 오버로딩(중복함수)
	/*
	public void dispGetPay(Regular emp) {
		System.out.println( emp.getPay() );
	}
	public void dispGetPay(SalesMan emp) {
		System.out.println( emp.getPay() );
	}
	public void dispGetPay(Temp emp) {
		System.out.println( emp.getPay() );
	}
	*/
	
	
}//class




