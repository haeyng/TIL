package days18;
/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 12:06:57
 * @subject
 * @content
 */
public class Ex06 {

	public static void main(String[] args) {
		//Object.clone() 복제하는 메서드가 존재
		
		Person p1 = new Person("111", "홍길동");
		//p1.clone();  왜 clone을 사용을 못하는지
		
		Person p1Clone;
		p1Clone = p1.clone(); //다운캐스팅 안해도 됨 공변반환타입
		System.out.println(p1Clone);
		
		/*
		try {
			//clone()을 오버라이딩 하니 불편한점?
			//(Person) 다운 캐스팅을 해야되는 불편한점이 있음
			//
			p1Clone = (Person) p1.clone(); //checked 예외처리 해야함
			System.out.println(p1Clone);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		} //다운캐스팅 해야함
		*/
		
		
		
		
		/*
		p1.notify(); 스레드 수업할 때 사용하는 메서드.. 
		p1.notifyAll();스레드 수업을 할때 사용하는 메서드
		p1.wait();  스레드 수업을 할때 사용하는 메서드
		p1.wait();스레드 수업을 할때 사용하는 메서드
		p1.wait();스레드 수업을 할때 사용하는 메서드
		*/
		
		//p1.finalize()  생성자의 반대 소멸자. 객체가 소멸될때 해야되는 일이 있으면 소멸자를 통해서 함
		
		
	}//main

}//class
