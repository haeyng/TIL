package days04;

import java.util.Iterator;

/**
 *@author 송해영
 *@date 2023. 7. 22.-오전 8:38:35
 *@subject
 *@content
 */
public class Ex07 {
	public static void main(String[] args) {
		
		/*[문제] 1부터 10까지 합을 출력하세요
		int sum = 0;
		for (int i = 1; i <=10; i++) {
			System.out.printf("%d+",i);
			//The local variable sum may not have been initialized
			//지역변수 sum을 0으로 초기화해야 한다.
			sum += i ; // sum=sum+i;
		} //for
		System.out.printf("\b=%d",sum);
		-----------------------------------------------------------*/
		/*
		int sum = 0; // i = 1;
		//초기식 i = 1;을 for문 밖으로 꺼내고 초기식은 공백으로 비워도 잘 돌아감
		//for문 안에 초기식을 i = 1;을 선언하는것이랑 밖에 선언하면 차이점?
		//밖에는 main함수에서 사용, 안에는 for에만 사용하는 지역변수.
		//i를 for문 안에 선언하고 for문 바깥에 print로 i를 출력하려고 하면 오류남
		//이유? i가 for문 내에서만 쓰이는 지역변수가 되어 for문 밖에는 선언되지 않았기 때문에.
		//sum은 for문 밖에 선언 되어 있으니까 마지막에 출력할때 sum으로 출력가능
		for ( int i = 1 ; i <=10; i++) {
			System.out.printf("%d+", i);	
			sum += i ; 
		} //for
		System.out.printf("\b=%d",sum);	 
		-----------------------------------------------------------------------------*/
		/*
		int sum = 0, i = 1;
		for (  ;  ; ) { //무한 루프
			//i++; //for ()괄호 안에서 여기로 위치를 옮기면 값이 65가 되는데 이유?
					//i가 1일때 10보다 작은 조건식을 만족해서 {}안으로 들어오면
					//여기있는 i++가 i 값을 1 증가시켜버리고 printf로 출력함
					//그래서 10보다 작아서 10이 {}안으로 들어왔지만 또 1이 증가해 11까지 출력되고
					//합도 65가 됨.
			if(i>10) break; //i가 10보다 크다면 for문을 빠져나가라는 코딩, break도 없으면 무한루프됨
			System.out.printf("%d+", i);	
			sum += i ; 
			++i; //증감식을 for()괄호 밖으로 빼도 문제가 되지 않음
		} //for
		System.out.printf("\b=%d",sum);	 		
		//Unreachable code 조건식을 지워버리면 뜨는 에러
		//for문은 조건식이 거짓이어야 for문을 빠져나오는데
		//조건식이 없어서 거짓이 안되기 때문에 참이라 빠져나오지 못해 도달하지 못하고 무한루프됨
		-------------------------------------------------------------------------------*/
		/*
		int sum = 0;
		for (int i = 1, j = 1, k = 1; i <=10 && k<=10 || j>-100 ; i++, j--, k+=5) { 
			//초기식은 필요한만큼 여러개 변수를 선언해도 됨
			//조건식은 참과 거짓으로 판정되는 식이면 더 붙어도 상관없음
			//증감식도 여러개 가능하다
			System.out.printf("%d+",i);
			sum += i ; 
		} //for
		System.out.printf("\b=%d",sum);
		------------------------------------------------------------------*/
		//[1~10 합을 출력하세요.]
		int sum = 0;
		for (int i = 10; i >=1 ; i--); { 
		//for (int i = 10; i >=1 ; i--); { 
			//for문 뒤에 ; 세미콜론 찍어도 오류 안남. 
			//{}영역을 인식을 못하고 ()안에만 계속 돌게됨. 결과는 0이 됨  이유는?
			//System.out.printf("%d+",i);
			System.out.println("test");
			//sum += i ; 
		} //for
		System.out.printf("\b=%d\n",sum);
		//System.out.println(i);

			 
	}//main
}//class
