package days06;

import java.io.IOException;

public class Ex02 {

	public static void main(String[] args) throws IOException {
//		5일차 복습문제 3번 답
		
//		int code;		
//		System.out.print(">한 문자 입력 ?");
//		code = System.in.read();
//		System.out.printf("code = %c\n",(char)code);
//		//키보드로부터 읽어들일 수 있는 입력스트림이 System.in이다. ['a']['\r']['\n']
//		//a 엔터 ('/r' '/n')       두개의 제어 문자가 스트림에 들어가 세 문자가 있게 됨
//		//next 1byte를 읽어 0~255까지 int값 돌려주는 함수가 read()이다.    
//		System.in.skip(System.in.available()); //정수값을 리턴
//
//		System.out.print(">한 문자 입력 ?");
//		code = System.in.read();		
//		System.out.printf("code = %c\n",(char)code);		
//		------------------------------------------------
		
		//문자를 입력하라고 계속 뜨게 해서 대답 y,Y로 계속 할건지
		//아니면 그 외에 문자를 넣어서 종료시킬건지에 대한 코딩
		
		int code;
		char con = 'y'; 
		//Syntax error on token "continue", invalid VariableDeclarator Id
		//뜻 :continue에 문법 오류 : 변수 선언자 id가 잘못되었다
		//continue는 예약어라 변수어로 사용할 수 없다 continue를 con 으로 변경
		
		do {
			System.out.print(">한 문자 입력 ?");
			code = System.in.read();		
			System.out.printf("code = %c\n",(char)code);
			
			System.in.skip( System.in.available()  ); //  /r/n깨끗이 지우는 작업, 엔터를 읽어서 종료되지 않게
			
			System.out.print("\n\n계속 할거냐?");
			//입력을 받아야함 br, scanner, system.in.read() 셋중하나
			code = System.in.read();	 // 'y' 'n'
			con = (char)code; //입력받은 값을 con으로 바꿔줌
			
			System.in.skip(System.in.available()); // 여기도 넣어야 됨 엔터를 읽어서 종료되지 않게
			
		} while (con == 'y' || con == 'Y'); //y,Y이면 계속 반복하겠다
		System.out.println("end");
	}//main
}//class
