package days14;

public class Ex04 {

	public static void main(String[] args) {
		
			//[private 필드 선언] ------------------------[시험2]
			// 1. 왜 private 접근지정자를 사용해서 필드 선언했는지?
			// 2. 이유 
			//      1) private 필드 + '유효한 값'만을 필드가 사용될수 있도록
			//		 2) 필드를 읽기전용, 쓰기전용
			//Person p1 = new Person(); //생성자 오류 나지 않는 이유는 컴파일러가 디폴트 생성자 추가되서.
			Person p1 = new Person(true);
			System.out.println(p1.isGender()); // gender에 값을 할당할수없음 - 생성자를 통해서 값을 할당 Person p1 = new Person(true);
			//The constructor Person(boolean) is undefined 생성자 오버로딩 안되어있음 생성자 생성하면됨			
			
			//p1.age = -20; //잘못된 값 필드에 할당 하는 작업을 막으려고 접근 지정자를 private로 막아둠
			// 3. 방법 getter, setter 겟셋(게터, 세터) 추가해서 private 멤버에 접근할수있음
			
			/*
			if (n을 0~130) {
				
			} // if
			*/
			
			p1.setAge(20); //클래스 외부에서 set을 통해 20값 
			System.out.println(p1.getAge()); //getAge()나이값을 가져올수있음
			
			//접근지정자를 사용해서 필드를 (은닉화)
			//The field Person.name 'is not visible '
			/*
			p1.name = "홍길동";
			syso(p1.name); 쓰기 읽기 작업 불가능
			p1.age = 20;
			p1.gender = true;
			*/
			
	}//main

}//class

//The public type Person must be defined in its own file //여러개 클래스 선언 가능하지만 자바 파일 이름하고 똑같은 클래스만 public으로 선언 가능
/*
class Person{ //클래스 파일이 자동으로 생성
//다른 패키지에서는 사용할 클래스 X 동일한 패키지에서만 사용할 의도로 생성
	
}
*/