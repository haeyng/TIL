package days14;

public class Ex01 {
	
	//필드
	String message = null;
	
	//생성자 선언    //매개변수가 없는 default 생성자
	public Ex01 () {
		System.out.println(">Ex01 디폴트 생성자. ");
		message = "안녕"; //생성자로 필드값 초기화 
	}

	public Ex01(String msg) { 
		System.out.println(">Ex01 1 생성자. ");
		message = msg;
	}

	//메서드
	public static void main(String[] args) {

		//객체명.필드명
		//[객체 생성 + 디폴트 생성자 호출]
		//The constructor Ex01() is undefined : 디폴트 생성자가 선언되지 않았다. 생성자가 하나라도 선언되어 있지 않아야 자동으로 생성!
		Ex01 obj = new Ex01(); 
		//obj.message = "어떤 메세지";
		
		//The constructor Ex01(String) is undefined : 생성자가 선언되어 있지 않다.
		
		
		//[객체 생성 + 매개변수 1개 생성자 호출]
		//Ex01 obj = new Ex01("원하는 메세지");
		
		System.out.println(obj.message);
		
		/*
		 *[시험1] - 생성자(Constructor)
		 *1. 일종의 메서드이다. (생성자 메서드(함수)라고도 부름)
		 *2. 메서드명 == 클래스명
		 *3. 리턴자료형을 사용하지 않는다. - return문도 사용하지 않음
		 *4. 매개변수가 없는 생성자를 디폴트 생성자(default Constructor)라고 한다.
		 *5. 접근지정자 public, p, d, p 사용할 수 있다.  , 기타제어자는 사용하지 않는다.
		 *6. 생성자는 임의로 호출할 수 없다.
		 *    객체명.생성자메서드() 호출 안됨!
		 *    언제 호출되는지(중요) : 객체 생성할 때 자동으로 호출된다. (인위적 호출 불가능) 
		 *    예) new Ex01(); -> 생성자 호출 (생성자가 내부적으로 호출되기 때문에 ()괄호가 붙음)
		 *7. 생성자 역할 : 객체를 생성할 때 자동으로 생성자가 호출되고 '필드를 초기화 하기 위한 용도'로 생성자를 사용
		 *8. 생성자는 오버로딩이 가능하다(중복선언(중복함수)이 가능) 
		 *9. 클래스 선언 시 '생성자를 한개라도 선언하지 않으면' 컴파일러가 자동으로 디폴트 생성자를 추가 후 컴파일 한다. 
		 *10. 디폴트 생성자를 선언하지 않고 생성자를 오버로딩할 때 주의사항
		 *11. 생성자는 상속되지 않는다 (단순 암기!)
		 * */
		
	}//main
}//class
