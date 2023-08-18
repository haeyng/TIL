package days18;

public class Ex03 {

	public static void main(String[] args) {
		// [Object 클래스] + 메서드 
		//모든 클래스의 최상위 부모클래스이다. 
		//필드는 존재하지 않음
		//메서드만 11개 존재한다.
		
		Item item1 = new Item(10);
		Item item2 = new Item(10);
	
		System.out.println(item1.equals(item2)); //false 다른 인스턴스 참조.
		
		Item item3 = item1; //클래스 복사(객체 복사) 
		System.out.println(item1.equals(item3)); //true 같은 인스턴스 참조.
		
		//boolean Object.equals() 동일한 객체 즉, 같은 인스턴스 주소값을 참조하는지 여부를 true/false로 반환하는 메서드
		
	}//main

	
	
}//class


class Item extends Object{
	int value;
	Item(int value){ //생성자 이름은 클래스명과 같게
		this.value=value;
	}
}
