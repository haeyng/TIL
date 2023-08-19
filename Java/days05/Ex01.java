package days05;

/**
 *@author 송해영
 *@date 2023. 7. 19.-오후 8:56:45
 *@subject 4일 복습문제 풀이
 *@content
 */
public class Ex01 {

	public static void main(String[] args) {

		//		for문은 초기식으로 맨처음에 초기화가 일어난다
		//		함수(매서드)를 빠져나올때 사용하는 문은 return문이다 리턴값을 가지고 빠져나온다.
		//		제어문을 빠져나올때는 break문 사용


		/*
		System.out.println("a");
		System.out.println("b");
		if (조건식) return; //조건식이 참이면 main 함수를 빠져나가라는 뜻. a,b는 실행, c는 실행 안함
		System.out.println("c");
		 */


		//		10+9+8+...2+1=55를 표현
		//		int sum = 0;
		//		for (int i = 10; i >= 1; i--) {
		//			System.out.printf("%d+",i);
		//			sum+=i;
		//		} // for
		//		System.out.printf("\b=%d\n",sum);


		/*for문을 사용해서  
		   [실행결과]
		   01 - 헬로우 월드  
		   02 - 헬로우 월드  
		   03 - 헬로우 월드  
		   04 - 헬로우 월드  
		   05 - 헬로우 월드  
		   06 - 헬로우 월드  
		   07 - 헬로우 월드  
		   08 - 헬로우 월드  
		   09 - 헬로우 월드  
		   10 - 헬로우 월드*/

		for (int i = 1; i <= 10; i++) {
			System.out.printf("%02d - 헬로우 월드\n", i);
			//%[argument_index$][flags][width][.precision]conversion 기본형식
			//%[flags][width]conversion
			//%    0       2        d
		} //for


		// [가위바위보 순서도 작성]
		// int com, user; // 가위(1).2.3
		// com  = 1~3 난수(임의의수)     0.0 <= double Math.random() < 1.0
		// user =  scanner.nextInt();
		// 판단  user-com       0(무승부)  2,-1(사용자 승리 ) ..
		// switch
		// 사용자 승리, 무승부 출력.	

	}//main
}//class
