package days18;

import java.util.Arrays;

/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 4:27:16
 * @subject
 * @content
 */
public class Ex08_06 {

	public static void main(String[] args) {

		String s =  "TODO Auto-generated method stub";

		//[1번] String -> char [] 변환
		char [] sArr = s.toCharArray();
		
		/*
		for (char c : sArr) {
			System.out.println(c);
		}
		*/
		
		//[2번] char[] -> String
		//s = String.valueOf(sArr);
		s = new String(sArr);
		

		//[3] String ->byte[]
		//byte 는 -128~127 정수
		byte [] bArr = s.getBytes();
		
		
		//[4] byte[] -> String
		s = new String(bArr);
		
		
		//----------------------------------------
		System.out.println("-".repeat(40));
		
		
		String name ="     홍길동     ".trim(); //앞 뒤 공백제거
		System.out.printf("[%s]",name); //[홍길동]
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
