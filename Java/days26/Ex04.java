package days26;

import java.io.InputStream;
import java.io.PrintStream;

/**
 * @author 송해영
 * @date 2023. 8. 18. - 오전 10:29:28
 * @subject PrintStream 클래스
 * @content 	- 데이터를 기반으로 하는 출력용 바이트 스트림
 * 					- 다양한 형태로 출력할 수 있는 메서드가 오버로딩되어져있는 스트림 클래스이다.
 */

public class Ex04 {

	public static void main(String[] args) {

		InputStream is = System.in; 
		PrintStream ps = System.out; //표준 출력하는 스트림 (모니터에 출력)
		
		//System.out.println();
		//System.out.print();
		//System.out.printf();
		
		//ps.printXXX();
		
		System.out.println("A");
		System.out.println("B");
		System.out.println("C");
		System.out.println("D");
		System.out.println("E");
		
		System.err.println("F"); //에러메세지 출력할때 사용, 독립적으로 스레드가 사용된다.
		
	}//main

}//class
