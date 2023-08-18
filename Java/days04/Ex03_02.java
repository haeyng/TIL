package days04;

import java.util.Scanner;

public class Ex03_02 {

	public static void main(String[] args) {
		
		int n;

		try(Scanner scanner = new Scanner (System.in)) {

			System.out.print("정수를 입력하세요 >");
			n = scanner.nextInt();
			
			
			/*[1번코딩]
			if (n%2==0) {
				System.out.printf("n=%d 짝수(even number)",n);
			} else { // else 에는 조건식이 없음! if 옆에 있는 조건식 한번만 체크함
				        // if문을 두번 체크하지 않아서 if문 두번 쓴것보다 성능이 나음 
				System.out.printf("n=%d 홀수(odd number)",n);
			} //if
			------------------------------------------------------------------*/

			/*[2번코딩]
			    String result = "짝수(even number)";
			    if (n%2==0) { 
				//System.out.printf("n=%d 짝수(even number)",n);
				result = "짝수";
			} else { // else 에는 조건식이 없음! if 옆에 있는 조건식 한번만 체크함
				        // if문을 두번 체크하지 않아서 if문 두번 쓴것보다 성능이 나음 
				//System.out.printf("n=%d 홀수(odd number)",n);
				result = "홀수";
			} //if
			System.out.printf("n=%d %s",n,result);
			-------------------------------------------------------------------*/
			
			//[3번코딩]이 1,2번 보다 나은 코딩!
			String result = "짝수(even number)"; //짝수인지 홀수인지를 나타내는 변수 선언, 초기값 짝수 문자열로 넣어줌
			if (n%2!=0) {
				result = "홀수";
			} //if
			System.out.printf("n=%d %s",n,result);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
	}//main
}//class
