package days24;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 12:38:07
 * @subject 중첩 인터페이스 사용 예
 * @content
 */
public class Ex05 {

	public static void main(String[] args) {

		
		Button btnTouch = new Button();
		
		btnTouch.setOnClickListener(new CallListener());
		btnTouch.touch();
		
		btnTouch.setOnClickListener(new MessageListener());
		btnTouch.touch();
		
		
	}//main

}//class

class Button{
	
	//필드
	OnClickListener listener;
	//생성자, setter 를 통해서 주입 가능  ---- 의존성 주입(DI) : new 연산자 써서 하는것보다 결합력이 낮음
	
	void setOnClickListener(OnClickListener listener) {
		this.listener = listener;
	}
	
	void touch() {
		this.listener.onClick();
	}
	
	 //중첩 인터페이스 //On~ 이벤트 나타낼때 
	interface OnClickListener{
		void onClick(); //추상메서드
	}
}

class CallListener implements Button.OnClickListener{ //버튼 클래스 안에 있는 onclicklistener 인터페이스

	@Override
	public void onClick() {
		System.out.println("전화를 건다.");
	}
	
	
	
}

class MessageListener implements Button.OnClickListener{

	@Override
	public void onClick() {
		System.out.println("메세지를 보낸다.");
	}
	
	
}
/*//위와 같은 구조 코딩
class Car{

	Engine Engine;
	
	void setOnClickListener(OnClickListener listener) { 
	this.listener = listener;
	}
	
		void speedUp(int fuel) {
		this.engine.moreFuel(fuel);
	}
	
	interface Engine{ // 굳이 내부에 선언한 이유 : 다른 클래스에는 사용되지 않음 car클래스와만 관계, 쉽게 접근 가능... 쓸일별로없음 이해만하기
		
	}
	
}
*/




