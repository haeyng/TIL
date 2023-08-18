package days24;

import java.util.Arrays;
import java.util.Comparator;

//import days22.StringDescendingComparator;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 2:29:25
 * @subject days22.Ex13 비교해서 보기
 * @content
 */
public class Ex06_02 {

	public static void main(String[] args) {
		
		String [] names = {"이지현","김호영","임경재","유희진"};
		
		System.out.println(Arrays.toString(names));
		
		/*
		부모타입  객체명  = new Compar(매개변수...){
						//필드 쓸수있음
						//메서드 쓸수있음
		
			//			@Override 재정의 함수 구현.
			//};
		*/

		/*
		Comparator c = new Comparator<String>() { //익명객체 생성과 동시에 선언

			@Override
			public int compare(String o1, String o2) {
				return o2.compareTo(o1);
			}
		};
		Arrays.sort(names, c);
		*/
		
		//Arrays.sort(names, Comparator 객체만!); 2. new 연산자로 Comparator 객체 생성.. 해야되지만 익명객체 생성
		//Arrays.sort(names, c);
		
		
		/*
		//       sort() 메서드 호출 부분
		//							매개변수로 익명 클래스를 사용한 예
		Arrays.sort(names, new Comparator<String>() { 
			@Override
			public int compare(String o1, String o2) {
				return o2.compareTo(o1);
			}
		});
		*/
		
		
		
		//위에 코딩 이것저것 생략
		Arrays.sort(names, //클래스객체 생략
				( o1,  o2)-> //names 때문에 자료형 string을 안줘도 됨 
				 o2.compareTo(o1) //리턴문 생략가능
		);
		
		
		
		
		
		
		
		//Arrays.sort(names, String.CASE_INSENSITIVE_ORDER);
	
		//Collections.reverseOrder();
		
		System.out.println(Arrays.toString(names));
	
		
	}//main

}//class


//1. Comparator 인터페이스를 구현한 클래스를 선언해야 되지만 이름 부여하지 않는 클래스를 선언해서 쓸것임
/*                    자식												부모

class StringDescendingComparator implements Comparator<String>{

	@Override // 비교잣대는 함수가 1개
	public int compare(String o1, String o2) {
		return o2.compareTo(o1);
	}

}
*/