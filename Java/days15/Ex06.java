package days15;


//import java.io.*;
//import
//import java.lang.*; //컴파일러가 자동으로 추가

import static java.lang.Math.random; 

public class Ex06 {

	public static void main(String[] args) {

		/*
		 * 1.패키지(package)
		 *    1)서로 관련있는 클래스들, 인터페이스들의 묶음
		 *    2)클래스를 효율적으로 관리할수있다.
		 *       예)java.io 패키지 - 서로 관련된 클래스
		 *                  input/output 입출력
		 *    3)클래스의 이름이 충돌하는 것을 막아준다.
		 *    	  다른 개발자가 구현한 클래스 라이브러리(묶음)의 클래스와 이름이 충돌되는 것을 피할 수 있다.
		 *    4)자신만이 사용할 패키지 체계가 있어야 한다.
		 *    	  도메인명
		 *    5)하나의 클래스->물리적으로 ???.class(클래스파일) 생성되어지는것처럼
		 *       하나의 패키지->물리적으로 디렉토리가 생성되어짐	 
		 *       예) java.lang.System 클래스
		 *       
		 *          java 폴더
		 *           ㄴ lang 폴더
		 *               ㄴ System.class 파일
		 *    6)선언형식
		 *     	  소스파일의 첫 번째 라인(문장)에 단 한번 선언함.
		 *        package 패키지명.패키지명;
		 *    7)패키지명은 소문자로 작명.
		 *    
		 * 2.import문
		 *    1)소스파일에서 다른 패키지의 클래스를 사용하려면 패키지명이 포함된 클래스이름을 사용해야된다.
		 *    2)패키지 이름 + 클래스 이름 = 클래스의 풀네임
		 *       java.io.클래스명
		 *    3)풀네임
		 *    	  java.lang.System.out.println();
		 *    4)import문을 사용해서 미리 풀네임을 명시하면
		 *    	import java.lang.System; 
		 *    
		 *      System.out.println();
		 *    5)import문 X
		 *       Ctrl+Shift+0 
		 * 
		 * 	   6)import java.io.*;
		 * 		import java.io.BufferedReader;
				import java.io.InputStreamReader;
		
				BufferedReader br;
				InputStreamReader is;
	
		 * 		7) static import문
		 * 
		 * */
		
		//static random(), PI
//		System.out.println(Math.random());
//		System.out.println(Math.PI);
		
		System.out.println(random()); //import static java.lang.Math.random; 가 추가되서 Math 생략해도 출력됨
		
	}

}
