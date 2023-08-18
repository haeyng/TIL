package days04;

import java.util.Scanner;

/**
 *@author 송해영
 *@date 2023. 7. 21.-오후 10:13:16
 *@subject 제어문
 *@content
 */
public class Ex03 {
	public static void main(String[] args) {
		/*제어문 
		1. 정의 : 프로그램의 실행 순서를 제어하는 문
		            (경우에 따라서 건너띄기, 반복처리 등..)
		2. 종류
		    1)조건문 if, if else, if else if else
		    2)분기문 switch
		    3)반복문 for, foreach
		    4)조건반복문 while, do~while
		    5)기타 break, continue */
		
		//[if문 형식]
		//condition(조건식) : 참/거짓으로 판가름 할 수 있는 식
		//결과 값은 boolean형
		/*
		if (condition) {
			//조건식이 참일 때만 if문 안의 {} 블럭 영역을 수행함
		}//if
		*/
		
		//정수를 입력 받아서 n 변수에 저장을 하고 출력.
		//(입력값에 대한 유효성 검사 코딩 추가)-전공자 해보기
		//짝수인지 체크해서 짝수라고 출력할것임
		
		int n; 
		//Resource leak: 'scanner' is never closed 
		//뜻 : scanner를 다 썼으면 닫으라는뜻
		try (Scanner scanner = new Scanner(System.in);){ 
			//try 구문에서 사용되는 scanner 객체는 자동적으로 close 해준다
			
			System.out.print("정수를 입력하세요 >");
			n = scanner.nextInt();//지역변수는 반드시 초기화해야함. 초기화 하지 않으면 오류남
			
			if (n%2==0) {
				System.out.printf("n=%d 짝수(even number)",n);
			} //if
			if (n%2==1) { // 조건식에 n%2!=0도 가능
				System.out.printf("n=%d 홀수(odd number)",n);
			} //if
		      //if문은 첫번째에서 참이어도 아래까지 내려가서 두번 체크함
			
			
		} catch (Exception e) {
		}//catch
		
		
		
		
		
		
	}//main
}//class
