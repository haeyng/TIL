package days05;

import java.io.IOException;

public class Ex07 {

	public static void main(String[] args) throws IOException {
		
		//System.in.read();
		//키보드로부터 읽어들이는 함수 
		//매개변수 안줘도 됨 
		//리턴타입은 int
		// : 입력스트림으로부터 한바이트를 읽어들여서 0~255까지의 int 값으로 돌려주는 함수
		
		int code;
		char one;
		
		//[1]
		System.out.print("한 문자를 입력하세요 >");
		code = System.in.read();		
		System.out.printf("code = %d\n",code); // a를 입력하면 97 A 는 65 // ASCII코드값 반환하는것 같음	
		//one = (char) code;
		//System.out.printf("one = %c\n",one); //a를 입력하면 a, A는 A로 출력		
		
		//System.in.read(); // 13 //값을 입력하고 엔터 쳤을때 13번 엔터값이 들어가서 입력스트림에 남아있어서 출력됨
		//System.in.read(); // 10 //값을 입력하고 엔터 쳤을때 10번 줄바꿈값
		
		System.in.skip(2); //입력스트림에 남아있는 값을 읽지않고 건너뛰겠다는 뜻 //13번 10번값 두개 건너뛰겠다
		//System.in.skip(System.in.available()); //입력스트림에 있는 모든 바이트를 제거 하고 싶을때
		
		//결과 출력 후 계속 입력 작업을 반복하게 하려면?
		
	
		// [2]
		//System.out.print("> 한 문자 입력 ? ");
		//code = System.in.read();
		//System.out.printf("code = %d\n", code);
		//one = (char) code;
		//System.out.printf("one = %c\n", one);
			
		
	}//main
}//class
