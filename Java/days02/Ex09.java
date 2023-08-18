package days02;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 6:57:03
 *@subject 표준 입력 장치 (키보드)로 부터 이름을 입력 받아서
 *				  name 변수에 저장하고 나서 출력. 
 *@content
 * 단축키 Ctrl + space를 눌러 import 구문이 뜨게 작성한다
 */
public class Ex09 {

	public static void main(String[] args) throws IOException {

		String name = "초코";
		
		//바이트스트림->문자스트림 변환->라인단위 처리 스트림 변환
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("이름을 입력하세요 >");
		
		// Unhandled exception type IOException  예외처리 
		//- 아래 br.readLine();밑에 빨간 밑줄 생기면서 오류메세지 뜬다. 밑줄 눌러서 예외처리하기
		name = br.readLine();
		
		System.out.printf("이름은 : %s", name);
		
	}//main

}//class
