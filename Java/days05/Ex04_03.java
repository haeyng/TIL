package days05;

import java.util.Iterator;
import java.util.Scanner;

public class Ex04_03 {

	public static void main(String[] args) {
		//1~10 합 for
		//[문제] 두 정수 n, m 을 입력 받아서
		// 두 정수 사이의  홀수의 합을 출력.

		
		int n, m, sum=0;
		try (Scanner scanner = new Scanner(System.in)) {
			
			System.out.print("두 정수 n, m를 입력하라 >");
			
			n = scanner.nextInt();
			m = scanner.nextInt();
	
			int min = Math.min(n, m); 
			int max = Math.max(n, m);

			/*for (int i = min; i <= max; i++) {
				if (i%2==1) {
					System.out.printf("%d+", i);
				} else {
				}//if
				sum += i;
			} // for
			System.out.printf("=%d\n",sum);
			for문도 계속 돌고 if문도 계속 계산해서 돌아서 좋은코딩아님*/
			
			
			/*----------------------------------------------------------
			for (int i = min; i <= max; i+=2) {
				System.out.printf("%d+", i);
				sum += i;
			} // for
			System.out.printf("=%d\n",sum);
			---------작은값이 짝수라면 2씩 증가해서 짝수값의 합이 나와버림*/
			
			
			
			//for (int i = min%2==0?min+1:min ; i <= max ; i+=2) { //맞지만 보기 복잡함..
				if (min%2==0) min++;
				for (int i = min; i < max; i++) {
				sum += i;
				System.out.printf("%d+", i);
			} //for
			System.out.printf("=%d\n", sum);
			//--------------------------------------성능 좋은 코딩
			
			
		} catch (Exception e) {
		e.printStackTrace();
		
		}//catch
	}//main
}//class
