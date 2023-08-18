package days01;

public class Ex04_02 {
	
	    //본인의 이름을 name이라는 변수를 선언하고
		//본인의 나이를 age라는 변수를 선언하고
		//이름, 나이를 출력하는 코딩을 하세요.
	
	public static void main(String[] args) {
		String name;
		name = "송해영";
		
		//나이를 저장할 변수 선언해야함
		
		//String age;
		//age = 20;
		//위에 처럼 입력하면 아래 에러가 뜬다
		//Type mismatch: cannot convert from int to String
		//int 자료형을 String 자료형으로 사용할 수 없다는 뜻
		//자료형이 잘못 매치되었다, 형변환을 하지 않아서 발생하는 오류
		
		//자료형 변수명=초기값; (형식)
		//정수자료형 age = 20;
		
		int age = 20;
		
		System.out.println(name);
		System.out.println(age);
		
	}//main
}//class
