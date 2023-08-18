package days01; //p19, p132 참조

public class Hello {
	public static void main(String[] args) {
		System.out.println("송해영");
	}//main
}//class

// 자바의 주석처리
/*
 p 132
 package days01; - 패키지 선언문
 
  패키지란?
  1)디렉토리(폴더)개념과 동일한 개념
  2)서로 연관된 클래스들의 효율적인 관리
  3)패키지 선언 형식?
     package 패키지명(경로);
  4)반드시 클래스 파일의 첫번째 줄에 선언해야함(주석제외)
     패키지가 여러개의 디렉터리로 구성되는 경우, 
     경로를 .점을 이용하되 관례상 소문자로만 구성함
 */
/*
 p 19
 
 자바 프로그램의 기본 구조
  1)package 선언문
  2)자바는 객체 지향 프로그램 언어이기 때문에 반드시 
     시작객체(개체)로 사용할 하나의 클래스가 선언되어 있어야 함
  객체==개체==Object==클래스==물건(동일한 의미)
  3)자바에서 클래스를 선언하는 형식?
     [] 대괄호가 있는 구문은 생략이 가능
         public        x 생략
     [접근지정자][기타제어자] class 클래스명{
     }
  4)클래스명은 자바파일명과 반드시 동일해야 함 (클래스명이 Hello면 Hello.java) 
  5)클래스명의 첫번째 문자는 반드시 대문자로 시작해야 함, 
     새로운 단어가 결합하면 첫 글자는 대문자로 처리함 (SampleEx01-카멜표기법) - 숫자는 상관없다
  6)시작개체에는 프로그램을 시작/종료하는 기능을 가진 main함수(매서드)가 필요함
     public static void main(String[] args) 매서드가 있는 클래스만 실행할 수 있음
     실행 할 코드는 매서드 {} 안에 있어야 함
  7)자바에서 함수(매서드)를 선언하는 방식
  [접근지정자][기타제어자] 리턴자료형 함수명([매개변수...]){
  /명령코딩
  [return 리턴값;]
  }
 */ 
/* 
Hello.java 소스파일(source file)
javac.exe      Hello java       Hello.class 생성
java.exe       Hello 실행할때    Hello.main()
*/


