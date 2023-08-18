package days05;

import java.util.Scanner;

public class Ex02_04 {

	public static void main(String[] args) {

			try (Scanner scanner = new Scanner(System.in)) {
				
				char one;
				
				System.out.print("한 문자를 입력하세요 >");
				String inputData = scanner.next();
				one = inputData.charAt(0); 
				
				//Character.isDigit() 함수 : 숫자 인지 아닌지 물어보는 함수 true,false값으로 돌려줌
				//char를 다루는 래퍼클래스 Character 
				//true,false값을 돌리는 is
				//리턴값은 int 값을 달라고 함
				
				if (Character.isDigit(one)) {                      // [0-9] == \d    정규표현식
					System.out.println("숫자 입니다.");
				} else if (Character.isAlphabetic(one)) {    // [a-zA-Z]    정규표현식
					System.out.println("알파벳 입니다.");
				} else if ('가'<= one && one <='힣'){
					System.out.println("한글 입니다.");
				} else if (one=='#'||one=='$'||one=='!'||one=='@') {
					// 정규표현식을 사용하면  [#$!@] 
					System.out.println("특수문자입니다.");
				} else {
					System.out.println("잘못 입력했습니다.");
				} 
				
			} catch (Exception e) {
				e.printStackTrace();
			}//catch
	}//main
}//class