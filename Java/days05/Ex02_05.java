package days05;

import java.util.Scanner;

public class Ex02_05 {

	public static void main(String[] args) {
		
		//입력값에 대한 유효성 검사할때 정규표현식을 사용함! - 나중에 배움
		
		char one;

		try (Scanner scanner = new Scanner(System.in)) {
			System.out.print("한 문자를 입력하세요."); 
			String inputData = scanner.next();
			//[#@$!]
			String regex = "^[^aeiouAEIOU]";  //[]대괄호 안에 하나만 일치해도 true 
								 //알파벳중에 모음인지 물어보려면?    [aeiouAEIOU]
								 //알파벳 자음인지 물어보려면? ^[^aeiouAEIOU]    ^[^]는 []안에를 제외한 것들을 말함
			if(inputData.matches(regex)) {  //일치 한다 안한다 ture, false 값으로 나옴
				//matches 함수가 char는 없고 String에 있음
				System.out.println("특수문자");
			}
			//System.out.println(inputData.matches(regex));//일치 한다 안한다 ture, false 값으로 나옴
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
	}//main
}//class
