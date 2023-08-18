package days05;
/**
 *@author 송해영
 *@date 2023. 7. 23.-오전 8:21:11
 *@subject while 조건 반복문
 *@content
 */
public class Ex06 {

	public static void main(String[] args) {
		
		// [1]
		// 10+9+8+7+6+5+4+3+2+1+=55
		int i = 10, sum = 0;
		while (i>=1) {
			sum += i;
			System.out.printf("%d+", i);
			i--;
		}//while
		System.out.printf("=%d\n", sum);
		
	}//main
}//class
