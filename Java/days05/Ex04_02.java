package days05;

import java.util.Iterator;
import java.util.Scanner;

public class Ex04_02 {

	public static void main(String[] args) {
		//1~10 합 for
		//[문제] 두 정수 n, m 을 입력 받아서
		//두 정수 사이의 합을 구해 출력.
		//예) 2,5
		//2+3+4+5=14
		// 5 2 = 0??

		int n, m, sum=0;
		try (Scanner scanner = new Scanner(System.in)) {

			System.out.print("두 정수 n, m를 입력하라 >");

			n = scanner.nextInt();
			m = scanner.nextInt();

			/*---------------------------------
				for (int i = n; i <= m; i++) {
					System.out.printf("%d+",i);
					sum+=i;
				} //for
				System.out.printf("=%d\n",sum);
				//2와 5 입려학면 2+3+4+5=14
				//5와 2 입력하면 5 2 = 0
			-----------------------------------결과값이 달라져서 코딩을 바꿔야함*/

			/*[첫번째]------------------------------------
			if (n > m) {
				for (int i = m; i <= n; i++) {
					sum += i;
					System.out.printf("%d+", i);
				} // for
			} else { 
				for (int i = n; i <= m; i++) {
					sum += i;
					System.out.printf("%d+", i);
				} // for
			} // if
				System.out.printf("=%d\n",sum);
			--------------------------------------같은 작업을 두번 반복해서 좋은 코딩은 아님*/

			/* [두번째]
			if( n > m ) {
			  int temp = n;
			  n = m ;
			  m = temp;
			} // if

			for (int i = n; i <= m; i++) {
				sum += i;
				System.out.printf("%d+", i);
			} // for
			-------------------------------------위에 두번 반복하는것보다는 좋은 코딩*/

			/*[세번째]-----------------------------
			int min = n>m ? m : n;
			int max = n>m ? n : m;
			for (int i = min; i <= max; i++) {
				sum += i;
				System.out.printf("%d+", i);
			} // for
			System.out.printf("=%d\n",sum);
			--------------------------------------좋은 방법*/

			//[네번째] -----------------------------가장 좋은 방법 외우기!
			//Math 클래스 - 수학과 관련된 매서드(기능)
			//Math.random()
			//Math.min()
			//Math.max()
			int min = Math.min(n, m); //n,m 중에 알아서 작은값 가져옴
			int max = Math.max(n, m);//n,m 중에 알아서 큰값을 가져옴
			for (int i = min; i <= max; i++) {
				sum += i;
				System.out.printf("%d+", i);
			} // for
			System.out.printf("=%d\n",sum);

		} catch (Exception e) {
			e.printStackTrace();
		}//catch
	}//main
}//class
