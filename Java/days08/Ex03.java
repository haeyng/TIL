package days08;

/**
 * @author 송해영
 * @date 2023. 7. 24.-오전 11:06:15
 * @subject 복습문제 풀이 4)
 * @content
 */

public class Ex03 {

	public static void main(String[] args) {
		
//		4. 피보나치 수열의 10개 항의 합을 출력 - for문 사용
//		1+1+2+3+5+8+13+21+34+55 =143
//		[        항10개       ]   

		int firstTerm = 1; // 첫번째 항
		int secondTerm = 1; // 두번째 항
		int nextTerm; // 
		int sum = firstTerm + secondTerm;
		System.out.printf("%d+%d+",firstTerm,secondTerm);

		for (int i = 0; i < 8; i++) {
			nextTerm= firstTerm + secondTerm;
			System.out.printf("%d+",nextTerm);
			sum += nextTerm;
			firstTerm = secondTerm;
			secondTerm = nextTerm;

		} // for

		System.out.printf("=%d\n",sum);

	}//main

}//class
