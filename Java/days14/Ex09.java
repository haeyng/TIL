package days14;

public class Ex09 {


	
	//  static main() 메서드 : 프로그램 시작과 동시에 객체생성 안하고도 실행하기 위해서
	public static void main(String[] args) {

		//static 붙이면 객체를 생성할 필요 없음
		//Ex09 obj = new Ex09();
		//obj.sum(1, 2);
		
		//클래스명.static 메서드명()
		//Ex09.sum(1,2); //같은 클래스 
		sum(1,2);
		
	}//main

	public static int sum(int a, int b) {
		return a+b;
	}
	
}//class
