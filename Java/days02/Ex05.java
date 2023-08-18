package days02;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 6:00:49
 *@subject 표준 입력, 표준 출력 => System 클래스
 *@content 객체==개체==Object==클래스==물건
 *          System 클래스 안에 [표준 출력 함수]
 *          1. println()
 *          void	println​(이름, 나이)
 *          2. printf()
 *          PrintStream	printf​(String format, Object... args)
 *          3. print()
 *          void	print​(이름, 나이)
 *          세가지 차이점을 알아야 함
 */
public class Ex05 {
	public static void main(String[] args) {
		// java.lang 패키지 안에 있는 System 클래스 //java.lang은 패키지.
		//java.lang.System.out.함수호출(출력할 값);
		// java.lang.System.out.println("이창익");
		
		// 함수(메서드) 3가지 파악 => 정확히 사용할 수 있다.
		//  1. 함수의 기능(일) 파악
		//  2. 함수가 일처리를 할 때 필요한 값 파악 ( 매개변수, 파라미터, 인자, 인수 )
		//  3. 함수가 일처리를 한 후에 반환(리턴)하는 값 파악 ( 리턴값, 리턴자료형 ) 
		//      - 리턴값에 따라 리턴 자료형타입이 정해짐
		
		// 예) A사람한테 담배 심부름(일)... 
		//    1. 담배심부름
		//    2. 담배값, 담배명
		//    3. 담배, 거스름돈 반환
		
		// main함수를 포함한 클래스를 시작개체라고함
		// 예) main() 함수 
		//    1. 기능 ? 프로그램 시작/종료하는 일
		//    2. 매개변수 ? String args // 문자열 배열 args(x나 등 바꿔도 상관없음) == arguments ==인자들
		//    3. 리턴값이 없음 ,  리턴자료형 void(리턴자료형-돌려주는값이 없을때 쓰는것) 선언
		
		//System.out.printf("홍길동").printf("20"); // 홍길동20으로 출력된다//PrintStream이 리턴자료형
	    System.out.println("홍길동");
	    System.out.println("김길동");
	    System.out.println("박길동");
	    
	    //개행(줄바꿈)방법 두가지 (제어문자 추가나 매개변수 추가)
	    System.out.print("홍길동"+'\n'); // "\n"도 가능 // +는 문자연결연산자
	    System.out.print("홍길동\n");
	    System.out.print("김길동");
	    System.out.println(); // -> 개행
	    System.out.print("박길동");
	}
}