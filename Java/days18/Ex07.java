package days18;
/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 12:27:09
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {

		//[ 객체로 부터 Class(클래스 정보를 가지고 있는 타입) 객체를 얻어오는 3가지 방법 ]
		
		// 1) 첫 번째 방법 : getClass() 메서드
		/*
		Card card1 = new Card("HEART", 3);
		Class cls = card1.getClass();
		System.out.println(cls.getName());
		System.out.println(cls.getSimpleName());
		*/
		
		// 2) 두 번째 방법 : 모든 클래스에 클래스명.class 하면 클래스변수가 제공된다.
		/*
		Class cls = Card.class;  //static 필드를 통해서 
		System.out.println(cls); //class days18.Card

		// => Class cls 를 얻어와서 객체 생성할 수 있음
		try {
			Card card2 = (Card) cls.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		*/	
		
		// 3) 세 번째 방법 : Class클래스의 static 메서드 - forName()
		String className = "days19.Card";
		try {
			Class cls = Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		
		
	}//main

}//class


final class Card{
	String kind; // 카드 종류
	int num; //카드 번호
	
	Card(){
		this("SPADE",1);
	}
	
	Card(String kind,int num){
		this.kind = kind;
		this.num = num;
	}

	@Override
	public String toString() {
		return "Card [kind=" + kind + ", num=" + num + "]";
	}
	
	
}