package days04;

import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {

		/*
		String sKor = " 90  ";
		int kor = Integer.parseInt(sKor.trim());
		//String.trim 매서드를 사용해 공백을 없애고 int로 변환시킨다는 뜻
		//1.앞뒤 공백 제거 2. 매개변수 필요없다 3. 리턴값은 공백 제거한 string을 반환한다.
		System.out.printf("kor=%d\n",kor);
		*/
		
		//[공백도 구분자로 쓰고 싶을때?]
		String sKor = " 90  ";
		int kor = Integer.parseInt(sKor.trim());
		System.out.printf("kor=%d\n",kor);
		
		//대문자를 소문자로 변환하는 코딩
		char cu = 'A';
		char cl = (char)(cu + 32);
		
		
		//-----------------------------------------------------
		//두 정수 x,y를 scanner로 입력 받아서
		//큰 값을 max라는 변수에 저장해서 출력(삼항연산자 사용)
		
		//int x,y;
		//Scanner scanner = new Scanner(System.in);
		//x = scanner.nextInt();
		//y = scanner.nextInt();
		//int max = (x>y? x : y );
		//System.out.printf("max=%d\n", max);
		//-----------------------------------------------------
		
		//임의의 실수를 입력받아서 x 변수에 저장 후
		//소수점 2자리 까지 반올림해서 다시 x 변수에 저장 후
		//출력하는 코딩을 하세요
		//[입력형식]
		//> 실수 입력 ? 123.2312312
		//[출력형식]
		//> 결과 : 123.23	
		
		Scanner scanner = new Scanner (System.in);
		double x;
		System.out.print("임의의 실수를 입력하세요 >");
		x = scanner.nextDouble();
		x = (int)(x*100+0.5)/100d; //연산자 우선순위 : cast 연산자 > 산술연산자
		System.out.printf("> 결과 : %f", x );
	
	}

}
