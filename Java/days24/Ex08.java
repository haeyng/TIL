package days24;
/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 2:53:37
 * @subject 제네릭 타입이 사용될 수 있는 곳
 * @content 1) 제네릭 클래스 
 * 				   2) 제네릭 메서드
 */
public class Ex08 {

	public static void main(String[] args) {
		//[제네릭 클래스]
		Box box1 = new Box();
		
		//box1.setItem(100);
		//System.out.println((int)box1.getItem());
		
		//box1.setItem("홍길동");
		//System.out.println((String)box1.getItem());
		
		//box1.setItem(3.14);
		//System.out.println((double)box1.getItem());		
		//Object 일때는 매번 형변환해서 출력해야 됨
		
		
		
		//       String을 대입된 타입이라고 함
		//Box<String> box = new Box();
		
		//제네릭 클래스를 선언했지만 자동 호환되서 타입을 주지 않은 일반클래스도 Object로 사용가능
		//Box box = new Box(); //오류나지 않음
		//box.item = "XXXX";
		
		
	}//main

}//class


//다양한 타입을 사용하기 위해서 컴파일 시에 타입을 결정하는 기능 : 제네릭
//[제네릭 클래스 선언] 
//<T> 는 아무 문자나 줘도 상관없음 A,K,V,E 등등 T는 Type의 줄임말
//용어 정리
// 1) Box - 원시타입(raw type)
//	2) T    - 타입변수 또는 타입 매개변수
//	3) Box<T> - 제네릭 클래스, 'T[의] Box'


class Box<T>{ //제네릭 클래스
	T item;

	public T getItem() {
		return item;
	}

	public void setItem(T item) {
		this.item = item;
	}
}



/*
class Box{ //Object 일때는 매번 형변환해서 출력해야 됨
	
	Object item;

	public Object getItem() {
		return item;
	}

	public void setItem(Object item) {
		this.item = item;
	}
	
}
*/



/*
class Box{
	
	int item;

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}
	
}
*/

/*
class Box{
	
	String item;

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}
	
}

*/

/*
class Box{
	
	double item;

	public double getItem() {
		return item;
	}

	public void setItem(double item) {
		this.item = item;
	}
	
}
*/
