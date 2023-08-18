package days06;

import java.util.Arrays;
import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
		//본인의 영어이름을 입력받아서 char [] 로 변환후 foreach문을 사용해서 출력하는 코딩을 하세요.
		
		String name;
		
		try (Scanner scanner = new Scanner(System.in)) {
			
			System.out.print("이름을 영어로 입력하세요 >");
			
			name = scanner.nextLine(); // next()는 공백을 못읽고 구분자로 잘라 앞에만 출력함
			//nextLine 이나 next 둘 중 하나는 공백을 제거하고 하나는 남겨둠 - 확인
			//System.out.println(name);// 공백 잘리는지 확인작업
			
			/* 방법1--------------------------------------------			
			char [] nameArr = new char[name.length()]; 
			//name.length 배열을 문자열 길이만큼 char 배열 선언
			
			for (int i = 0; i < nameArr.length; i++) {
				nameArr[i] = name.charAt(i);
			} //for
			System.out.println(Arrays.toString(nameArr));
			-----------------------------------------------------*/
			
			/*방법2
			char [] String.toCharArray()
			1)String을 char [] 로 변환하는 코딩
			char [] nameArr = name.toCharArray();
			
			2)char[] -> String 변환
			name = String.valueOf(nameArr);
			------------------------------------------------------*/
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
	}//main
}//class
