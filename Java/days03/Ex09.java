package days03;

import java.util.Scanner;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 3:44:18
 * @subject(시험) 두 문자열 비교
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {
		
		//The value of the local variable name1 is not used 변수 선언을 했는데 사용을 안하고 있다
		String name1 = "홍길동"; //,name2;
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print(">비교할 이름을 입력 ?");
		String name2;
		
		name2 = scanner.next(); //name2를 입력받음 처리결과는 true false로 나옴
		
		//System.out.println(name1 == name2); // name2를 name1값인 홍길동으로(같은값) 입력해도 false로 나옴 System.out.printf("[%s]\n", name2);로 입력해봄
		//System.out.printf("[%s]\n", name2); //입력해도 [홍길동] 개행 false로 나옴
		//ctrl+shift+b 눌러줌(브레이크) 왼쪽에 파란점 생김 : 디버깅하겠다는 뜻
		System.out.printf("[%s]\n", name2);
		
		//(암기) 두 문자열을 비교할 때는 equals()를 사용한다. - 외우기
		System.out.println(name1.equals(name2));
		
		System.out.println("keNik".equalsIgnoreCase("KENIK")); // IgnoreCase 대소문자를 구분하지 않고 같은지 비교 - 기억해두기
		
	}//main

}//class
