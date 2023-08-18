package days22;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오전 11:27:15
 * @subject----변환 시험
 * @content
 */
public class Ex06 {

	public static void main(String[] args) {

		//List - ArrayList 컬렉션 클래스
		
		
		
		//String [] -> ArrayList 변환
		String [] nameArr = {"송해영","유희진","임경재","정하영"};
		
		/*
		//[첫번째방법]
		ArrayList list = new ArrayList();
		for (int i = 0; i < nameArr.length; i++) {
			list.add( nameArr[i]);
		} // for
		System.out.println(list);
		*/
		
		//[두번째방법] Type == 클래스
		//List<T> list =  Arrays.asList(T..a); 타입 T에 int 안됨 클래스 INTEGER로 써야됨
		List list = Arrays.asList(nameArr); //String[] 매개변수로 가능
		System.out.println(list);
		
		//굳이.. List 부모 말고 ArrayList 타입 안에 담고 싶을때
		// Collection <- List <- ArrayList
		ArrayList list2 = new ArrayList(list); //생성자의 매개변수 타입이 Collection c ... 매개변수 다형성
		System.out.println(list2);
		
		
		
		
		
		//ArrayList -> String [] 변환
		
		
	}//main

}//class
