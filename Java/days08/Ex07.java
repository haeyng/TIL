package days08;

import java.util.Iterator;
/**
 * @author 송해영
 * @date 2023. 7. 24.-오후 1:57:08
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {

		//재귀 함수 
		//1)1~n 합 재귀함수
		//2)팩토리얼 (factorial) == 계승
		//      정의) 1에서 양의 정수의 곱
		// n! = n*(n-1)*(n-2)...*1
		// 예) 5! = 5*4*3*2*1
		//	   -5!는 없음 음수는 안됨
		// 0! == 1 (약속)
		
		//일반함수
		//int result = factorial(-5); // 음수값 넣으면 음수값 반환
		//System.out.println(result);
		//재귀함수
		int result = recursiveFactorial(5); // 음수값 넣으면 음수값 반환
		System.out.println(result);	
		
	}//main

	private static int recursiveFactorial(int n) { //재귀함수
		if (n>1) return n * recursiveFactorial(n-1);
		else if (n==1 || n==0) return 1;
		else return -1; //음수일때
	}
	private static int factorial(int n) {
		if(n<0) return -1; //n이 음수이면
		
		// 5*4*3*2*1
		int result = 1;    //초기값 0 아니고 1
		for (int i = n; i >=1; i--) {   //54321
			result = result*i;
		} // for
		return result;
	}
}//class





