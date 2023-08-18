package days25;

import java.io.BufferedInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author 송해영
 * @date 2023. 8. 17. - 오전 11:43:20
 * @subject
 * @content
 */
public class Ex05 {

	public static void main(String[] args) throws IOException {

		/*
		 * 1. IO = Input + Output
		 * 				입력       출력    ==  입출력
		 * 
		 * 어디에서 어떤 대상으로 입출력 되는지?
		 * 2. [컴퓨터(프로그램)]            ---->              [외부 장치(프로그램)]       : 송신
		 *     [컴퓨터(프로그램)]            <----              [외부 장치(프로그램)]       : 수신
		 * 
		 * 		프로그램 간에 데이터를 주고 받는 것을 "입출력"이라고 한다.
		 * 3. 두 장치를 연결해주는 객체가 필요하다.  : 스트림(Stream)
		 * 
		 * 음료 --- 빨대 ---> 입		 입력용 
		 * 음료 <--- 빨대 --- 입		출력용이 따로 있다
		 * 			 스트림
		 * 
		 * 4. 스트림 : 데이터를 운반하는 통로
		 * 		1) 흐르는 물
		 * 		2) 단방향 (2가지 스트림)
		 * 			ㄱ. 읽기(입력용) 스트림
		 * 			ㄴ. 쓰기(출력용) 스트림
		 * 5. 연속적인 데이터의 흐름
		 * 6. 자바에서 모든 입출력은 스트림(Stream)이라는 개념으로 이루어진다.
		 * 7. 키보드 장치	->데이터수신->		[프로그램처리과정]		->	데이터송신->   모니터
		 *    (표준입력장치)									기준								    (표준출력장치)
		 * 			System.in(스트림)											 System.out(스트림)	
		 * 
		 * 8. 자바의 스트림 2가지 종류 구분
		 *		1) 문자(텍스트)스트림
		 *				최상위 부모 클래스 : Reader (입력용 스트림) 
		 *				최상위 부모 클래스 : Writer  (출력용 스트림)
		 *
		 *				1문자 == 유니코드 2바이트 == char
		 *				한문자, 문자열, 문자 배열 단위를 처리할 수 있다.
		 *
		 *			FileReader 문자 단위로 처리하는 입력용 스트림
		 *			FileWriter  문자 단위로 처리하는 출력용 스트림
		 *
		 *			BufferedReader 문자 단위로 처리하는 입력용 스트림(라인 단위 처리)
		 *			BufferedWriter  문자 단위로 처리하는 출력용 스트림(라인 단위 처리)
		 *			
		 *			XXXXReader
		 *			XXXXWriter
		 *		
		 *		2) 바이트(이진)스트림
		 *		 		최상위 부모 클래스 : InputStream    (입력용 스트림) 
		 *				최상위 부모 클래스 : OutputStream  (출력용 스트림)
		 *
		 *			1바이트(8비트) 단위로 처리를 한다
		 *			바이트, 바이트 배열, 정수(int) 단위를 처리할 수 있다.
		 *
		 *			InputStream is = System.in; //바이트 스트림
					int nextByte = System.in.read();//바이트 스트림 0~255 //btye는 -128~127이라서 int로 
		 *
		 *			XXXXInputStream 
		 *			XXXXOutputStream 
		 *
		 *9. 보조스트림 - 어떤 스트림의 IO을 더 쉽도록 보조 역할을 하는 스트림
		 *
		 * */
		
		/*
		FileReader 파일 읽기(입력용) 문자 스트림
		FileWriter 파일 쓰기(출력용 ) 문자 스트림
		FileInputStream 파일 읽기 (읽기용) 바이트 스트림
		FileOutputStream 파일 쓰기 (출력용) 바이트 스트림
		*/
		
		/*
		BufferedReader 
		BufferedWriter  
		BufferedInputStream;
		bufferedOutputStream;
		*/
		
		
	}//main

}//class
