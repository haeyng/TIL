package days07;

import java.util.Scanner;

/**
 * @author 송해영
 * @date 2023. 7. 21.-오전 11:45:30
 * @sbject
 * @content
 */
public class Ex05_02 {

	public static void main(String[] args) {
		
		//정규표현식 사용해서
		//국어점수(kor)을 입력받아서 
		//0<= <=100
		//올바른 국어점수, 잘못된 국어점수 출력
		
		//int [] kors = {90,1,100,101,-90,0};
		String kor = "00";
		//String regex = "\\d{3}"; //\\d{3} 는 100~999
		//String regex = "\\d{1,2}|100"; //\\d{1,2}만 적으면 00이나 09 도 됨
		
//		String regex = "100 | [1-9][0-9] | [0-9]"; //10~99
//		String regex = "100 | [1-9]\\d | \\d"; //위와 같음
		
		String regex = "100 | [1-9] ? \\d"; //
			System.out.println(kor.matches(regex));
		
		
	}//main
}//class
