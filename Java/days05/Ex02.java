package days05;

import java.util.Scanner;
/**
 *@author 송해영
 *@date 2023. 7. 22.-오후 8:05:07
 *@subject 4일차 복습문제 6번 풀이
 *@content
 */
public class Ex02 {
	public static void main(String[] args) {
//		   한 문자를 입력받아서
//		   숫자, 알파벳(대,소문자), 한글, 특수문자(#$!%@)
//		   입니다라고 출력하세요.

			try (Scanner scanner = new Scanner(System.in)) {
				
				char one;
				
				System.out.print("한 문자를 입력하세요 >");
				//scanner를 통해서 char를 읽어올 수 없는 이유
				//공백,콤마와 같은 구분자랑 한문자랑 구분하는 판단이 안되는 것 같아서 없는 것 같다
				
				// scanner.next();            String				
				// scanner.nextByte();      byte
				// scanner.nextShort();     short
				// scanner.nextInt();        int
				// scanner.nextLong();     long
				// scanner.nextBoolean(); boolean
				// scanner.nextFloat();     float
				// scanner.nextDouble();  double
				// scanner를 통해서 char를 읽어올 수 없음... 
				
				//"a"를 입력 받아서 'a'로 바꾸려고 함.
				//"\0" -> 'a' 변환 X
				//변환은 할 수 없어 변환이 아니라 첫번째에 있는 a를 얻어오겠다는 식으로 생각해야함
				
				String inputData = scanner.next();
				one = inputData.charAt(0); // 0은 첫번째 문자를 읽어오겠다는 뜻
				
				if ('0'<=one && one<='9') {
					System.out.println("숫자 입니다.");
				} else if ('a'<=one&&one<='z' || 'A'<=one && one<='Z') {
					System.out.println("알파벳 입니다.");
				} else if ('가'<= one && one <='힣'){
					System.out.println("한글 입니다.");
				} else if (one=='#'||one=='$'||one=='!'||one=='@') {
					System.out.println("특수문자입니다.");
				} else {
					System.out.println("잘못 입력했습니다.");
				} 
				
			} catch (Exception e) {
				e.printStackTrace();
			}//catch
	}//main
}//class
