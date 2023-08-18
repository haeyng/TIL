package days05;

import java.util.Scanner;

public class Ex06_02 {

	public static void main(String[] args) {

		//[문제] 두 정수 n, m 을 입력 받아서
		//두 정수 사이의 홀수의 합을 구해 출력.

		int n,m, sum=0;
		Scanner scanner = new Scanner(System.in);

		System.out.print("두 정수를 입력하세요.");
		n = scanner.nextInt();
		m = scanner.nextInt();

		int min = Math.min(n, m);
		int max =Math.max(n, m);
		
		if(min%2==0) min++;
		
		// for -> while 문 변경
		
		/*int i = min;        
		while (i<=max) {
			System.out.printf("%d+",i);
			sum+=i;
			i+=2;
		}
		System.out.printf("=%d",sum);*/
		
		
		// i변수 따로 안빼고 그냥 적을때는
		while (min<=max) {
			System.out.printf("%d+",min);
			sum+=min;
			min+=2;
		}
		System.out.printf("=%d\n",sum);
		
		
		
	}//main
}//class
