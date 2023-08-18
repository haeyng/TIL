package days05;

public class Ex03 {

	public static void main(String[] args) {
		// ASCII 256가지
		// i=0
		
//		for (int i = 0; i < 256; i++) {
//			System.out.printf("%d-%c\n",i,i); // i값을 char로 형변환
//		} //for
		
		
//		for (int i = 0; i < 256; i++) {
//			System.out.printf("[%c]",i);
//		} //for
		
		
		//-----------------------------------------------------------
		// [문제1] 한 라인에 10개씩 출력.
		
		//  0 1 2 3 4 5 6 7 8  9 개행      10개씩
		// 10[][][][]][][][] 19 개행
		// 20[][][][]][][][] 29 개행
		//  [][][][][] 5
		
//		for (int i = 0; i < 256; i++) {
//			//if (i%10==0) System.out.println(); 
//			// 첫번째 i가 0일때 10으로 나눠도 나머지가 0이라 첫줄을 개행해버려서 문제
//			if (i%10==0) System.out.println(); //이 줄을 출력하는 printf 밑으로 보내면 i가 0일때 한번 찍고 개행해버려서 문제 
//			System.out.printf("[%c]",i);
//		} //for
		
		
		/*-------------------------------------------------------------------------
		for (int i = 0; i < 256; i++) {
			System.out.printf("[%c]",i);
			if (i%10==9) System.out.println();
		} //for
		
		// ASCII 10 개행  '\n'  LineFeed( LF )   새줄로 이동함 (커서가 밑으로 떨어짐)
		// ASCII 13 개행  '\r'  CarrageReturn( CR ) 커서를 맨 앞으로 땡김
		//엔터 == 개행 == '\r\n'   새로 줄바꿈하고 커서 맨앞으로 땡기기를 합쳐서 엔터
		--------------------------------------------------------------------------*/
		
		
		// [문제2] 라인번호를 붙이려고 함
		// 1: 0 1 2 3 4 5 6 7 8  9 개행
		// 2: 10[][][][]][][][] 19 개행
		// 3: 20[][][][]][][][] 29 개행
		//      [][][][][] 5
		
//		for (int i = 0; i < 256; i++) {
//			if (i%10==0) { //맨앞에 번호 붙이는 것
//				System.out.printf("%d : ",i/10+1); //개행작업X
//			} //if
//			System.out.printf("[%c]",i);
//			if (i%10==9) System.out.println(); // 10개씩마다 개행 작업
//		} //for
//		-----------------------------------------------------------------
		
		//lineNumber 변수를 지정해서 해보기 (가독성 좋고 계산할 필요 없이)
		
//		for (int i =0 , lineNumber = 1 ; i < 256; i++) {
//			if (i%10==0) System.out.printf("%d : ",lineNumber++); //출력하고 난 다음에 증가
//			//lineNumber가 1말고 0부터 시작으로 초기값을 해두면 if문 ++lineNumeber으로 바꾼다
//			System.out.printf("[%c]",i);
//			if (i%10==9) System.out.println(); // 10개씩마다 개행 작업
//		} //for
//		-----------------------------------------------------------------
		
		//대문자만 찍으려면? A~Z 65~90
		//소문자만 찍을때 10개씩 개행하고 앞에 라인넘버 붙이려면? a~z 97~120
		//숫자를 찍고 싶을때 0~9 하면 48 49 ..
		//중간에 다른거 찍지 않고 대문자와 소문자만 찍으려면? 중간에 건너뛰도록 해야됨
		for (int i = 0 , lineNumber = 1 ; i <'z'; i++) {
			if (i%10==0) System.out.printf("%d : ",lineNumber++); 
			//System.out.printf("[%c]",i);
			
			//System.out.printf("%d-%c\n", i, (char)i); 			
			System.out.printf("[%c]", (char)i);
			
			if (i%10==9) System.out.println(); 

			//i가 65부터 시작하기 때문에 65~70 70일때 개행 앞에 라인넘버
		} //for
		
		//[문제] 
		//라인을 10개만 출력하고 멈추기, 엔터치면 다음꺼 10개 출력, 엔터치면 다음꺼 10개 출력하는 법?
		
		
		
		
		
	}//main
}//class
