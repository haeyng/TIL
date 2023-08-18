package days14;

/**
 * @author 송해영
 * @date 2023. 8. 1. - 오후 2:11:27
 * @subject [ static 키워드 ]
 * @content  필드 앞에
 * 					메서드 앞에
 * 					클래스 앞에
 */
public class Ex07 {

	public static void main(String[] args) {
		//[우리반] -> 기업은행 -> 보통 예금
		//Save 클래스 선언 : 저축
		//인스턴스 변수가 메서드일 때 객체명.필드, 객체명.메서드
		//클래스 변수 - 클래스명.static필드
		
		//1.rate 이자율을 왜 static 필드로 선언했는지? (=static필드는 언제 사용하는지?)
		//객체가 생성될때마다 메모리가 잡히는게 아니라 클래스당 하나 잡혀서 모든 인스턴스가 공유해서 사용해야 될 필드가 필요하다면 static 필드로 선언
		//클래스당 하나만 할지? 생성된 인스턴스 마다 멤버변수 필드가 되야될지? 내가 정해야됨
		
		//2.정적(static) 메서드 언제 사용하나요
		//    1)객체 생성 전에 private  접근하려면 static으로 선언된 메서드가 필요 - static 필드를 사용하기 위해서 static 메서드 필요.
		//    2)
		
		//The field Save.rate 'is not visible' : 메모리랑은 상관없이 접근지정자때문에 접근 못하는 오류
		//System.out.println(Save.rate);
		
		System.out.println(Save.getRate());
		
		
		
		System.out.println();
		
		
		Save s1 = new Save("주강민", 1000, 0.04); 
		Save s2 = new Save("정하영", 1500, 0.04); 
		Save s3 = new Save("임경재", 34500, 0.04); 
		Save s4 = new Save("이지현", 5000, 0.04); 
		Save s5 = new Save("이준희", 21000, 0.04); 
		
		//Save.setRate(0.08);
		
		s1.setRate(0.06); //static 메서드를 객체명으로도 접근가능. 공유되기 때문에
		
		
		s1.dispSave();
		s2.dispSave();
		s3.dispSave();
		s4.dispSave();
		s5.dispSave();
		
		
		//클래스 배열 선언
		/*
		Save [] ss = new Save [5];
		ss[0] = new Save("주강민", 1000, 0.04); 
		ss[1] = new Save("정하영", 1500, 0.04); 
		ss[2] = new Save("임경재", 34500, 0.04); 
		ss[3] = new Save("이지현", 5000, 0.04); 
		ss[4] = new Save("이준희", 21000, 0.04); 
		*/
		
		/*
		//클래스 배열 초기화
		Save [] ss = {
				new Save("주강민", 1000, 0.04),
				new Save("정하영", 1500, 0.04),
				new Save("임경재", 34500, 0.04),
				new Save("이지현", 5000, 0.04),
				new Save("이준희", 21000, 0.04)
		};
		

		for (int i = 0; i < ss.length; i++) {
			ss[i].dispSave();
		} // for
		*/
		
		//파악해야 될 점? 모든 사람의 이자율(rate)은 동일하다.
		//Save 객체가 생성 될 때 마다 rate (8byte) 필드는 필요없다.
		//Save 클래스 당 한개만 rate 필드를 생성해서 모든 인스턴스(객체)가 공유해서 사용할 필드를 선언하면 될것같음
		
		
		
		
		
		
	}//main

}//class
