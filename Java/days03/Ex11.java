package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 4:40:59
 * @subject (시험) 인덱스(index) 연산자 설명  ***
 * @content           []
 * 				     String[] args
 * 				     String args == String name []가 없으면 문자열의 매개변수가 필요하다는 뜻
 * 
 */
public class Ex11 {

	public static void main(String[] args) {

		//1. 국어 점수를 저장할 변수를 선언.
		// int kor;
		
		//2. 국어 점수를 5만명 저장할 변수를 선언.
		// int 홍길동kor;
		// int 김길동kor;
		//... 5만개 를 해도 되는데 변수명을 어떻게 할지? 동명이인나오면 xx
		
		/*
		int kor00001; // 00001~50000 순서 번호값
		int kor00002; 
		int kor00003;
		..
		int kor50000;
		*/
		
		//
		//인덱스 [] 연산자를 사용해서 배열 선언
		/*
		 * 참조형 : 배열, 클래스, 인터페이스
		 * 
		 * 1. 배열 정의? 동일한 자료형을 메모리 상에 연속적으로 놓이게 한 것
		 * 2. 배열 선언 형식
		 *     자료형 [] 배열명 = new 자료형[배열크기];
		 *     자료형 배열명[] = new 자료형[배열크기];
		 * */
		// int kors[] =new int[5]; //int 앞에 공백은 넣어도 되고 안넣어도 되고 int[] 자체가 자료형임
		int [] kors = new int[5]; //new 연산자에 의해서 동점영역에 메모리가 할당됨 //
		
//		System.out.println(배열명.length);
		System.out.println(kors.length); //배열크기
		System.out.println(kors.length-1); //배열크기-1 하면 윗첨자값과 같다 //아랫첨자값은 무조건 0
		
		
		kors[0] = 90; 
		kors[1] = 100; 
		kors[2] = 80; 
		
		System.out.println(kors[0]);  //90
		System.out.println(kors[1]);  //100
		System.out.println(kors[2]);  //80
		
		
		
		
	}//main

}//class
