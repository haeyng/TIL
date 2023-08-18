package days06;

import java.util.Scanner;

/**
 *@author 송해영
 *@date 2023. 7. 23.-오후 4:44:16
 *@subject   제어문 활용
 *@content
 */
public class Ex05_02 {
	public static void main(String[] args) {
		
		
		int n;
		
		try (Scanner scanner = new Scanner(System.in)) {
			System.out.print("정수 n을 입력하세요 > ");

			String inputData = scanner.nextLine();
			char [] idArr = inputData.toCharArray();
			
			// 비밀번호   8~15 , 숫자 1, 알대1, 알소1, 특수문자 1
			
			//정규 표현식 (regular expression)
			//0~9 숫자로만 이루어진 문자열인지 체크하는 정규표현식을 찾기
			//String regex= "^[0-9]+$"; //+ 시작^부터 끝$까지 숫자가 한개 이상으로 이루어져야함
			
			
			//String regex= "^\d+$"; 일때 오류 남
			//Invalid escape sequence (valid ones are  \b  \t  \n  \f  \r  \"  \'  \\ ) 역슬러쉬 하나 더 붙이라는뜻
			
			String regex= "^\\d+$"; //[0-9]와 \d는 같은 코딩
			boolean flag = inputData.matches(regex);

			if (flag) { 
				n = Integer.parseInt(inputData);
				System.out.println(n);
			} else {
				System.out.println("입력 잘못했습니다");
			}//if							

		} catch (Exception e) {
			e.printStackTrace();
		}//catch		
	}//main
}//class

