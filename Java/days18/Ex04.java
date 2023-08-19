package days18;

public class Ex04 {

	public static void main(String[] args) {
		//[Object.hashCode() 메서드]
		//해시 -> 해시함수(해싱(해시)기법)
		//  ㄴ 데이터를 관리하는 기법 중에 하나.
		//	 ㄴ 데이터를 관리하는 것은 데이터를 저장, 검색 등등 을 뜻한다. 
		//  ㄴ 객체 저장 -> 객체가 저장된 위치값(주소값)을 해시코드로 변환-> 변환시킨 값을 반환하는 메서드가 hashCode() 메서드
		//[참고] 동일한 객체인지 체크할때? equals() 오버라이딩 + hashCode() 오버라이딩
		
		/*
		String s1 = "홍길동";//54150062 해시값이 같음
		String s2 = "홍길동";//54150062 //String 클래스  "홍길동"는 주소값 //s1,s2는 같은 인스턴스를 참조하고 있음
		*/
		
		
		//왜 String 클래스타입인데 new 연산자로 객체 생성 안했을까?
		String s1 = new String("홍길동");//54150062
		String s2 = new String("홍길동");//54150062
		
		System.out.println(s1.hashCode()); 
		System.out.println(s2.hashCode()); 
		
		
	}//main

}//class
