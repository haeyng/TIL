package days25;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * @author 송해영
 * @date 2023. 8. 17. - 오후 5:10:45
 * @subject
 * @content
 */
public class Ex09 {

	public static void main(String[] args) throws IOException {
		//본인의 이름을 입력받아서 출력.
		
		//1. 키보드 (표준입력장치)로 부터 입력 -> 표준 입력 스트림이 필요함 		
		
		//바이트 스트림
		InputStream is = System.in;
		System.out.print("한글 한 문자 입력");
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);
		int code = isr.read();
		System.out.println((char)code);
	
		/*
		int code;
		System.out.println("> 이름 입력하세요.");
		code = is.read(); //1바이트(0~255 정수 int) 반환하는 메서드 //한글처리를 못함
		System.out.println((char)code); //"홍"
		*/
		
		/*
		byte [] cbuf = new byte[3]; //한문자가 3바이트 처리
		System.out.print("> 이름 입력하세요."); 
		is.read(cbuf);
		//byte [] cbuf를 char 한문자로 변환해야함
		*/
		
		//InputStream[Reader] 보조 문자스트림 : byte ->char 변환해주는 보조스트림
		
		//Buffered[Reader] br 에다가 보조스트림InputStream[Reader]을 매개로 줌
		
		
		
		
		
		
	}//main

}//class
