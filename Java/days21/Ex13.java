package days21;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오후 2:41:52
 * @subject
 * @content
 */
public class Ex13 {

	public static void main(String[] args) {

		//1. 컬렉션 클래스 - ArrayList
		//		ㄴ 가장 많이 사용되는 컬렉션클래스이다.
		//		ㄴ List 인터페이스를 구현한 클래스
		//			(순서가 있고, 순서 유지 O, 중복 허용 O)
		//		ㄴ 배열 요소(Element)
		//		ㄴ 배열 단점(days10.Ex03.java)   -----(보완)----->   ArrayList
		//		ㄴ
		
		String [] names = new String[3];
		names[0]="주강민";
		names[1]="정하영";
		names[2]="임경재";
		System.out.println(names.length);
		//java.lang.ArrayIndexOutOfBoundsException
		//names[3] = "이지현";
		//검색 후에 출력
		for (int i = 0; i < names.length; i++) {
			if (names[i].equals("정하영")) System.out.println(names[i]);
		} // for
		
		
		
		
		//ArrayList list = new ArrayList(); 입력안하면 초기용량10개
		ArrayList list = new ArrayList(3);
		list.add("주강민"); //0
		list.add("정하영"); //1
		list.add("임경재"); //2
		System.out.println(list.size());
		list.add("이지현"); //3
		
		
		/*
		//검색 후에 출력
		System.out.println(list.contains("정하영")); //true/false
		//몇번째에 있는지?
		int index = list.indexOf("정하영");
		if (index!=-1) {
			System.out.println(list.get(index));
		} else {
			System.out.println("정하영씨는 없다.");
		}
		*/
		
		
		/*
		//삭제
		//검색 후에 출력
		System.out.println(list.contains("정하영")); //true/false
		//몇번째에 있는지?
		int index = list.indexOf("정하영");
		if (index!=-1) {
			System.out.println(list.get(index));
			list.remove(index); //삭제
		} else {
			System.out.println("정하영씨는 없다.");
		}
		System.out.println(list.toString()); //[주강민, 임경재, 이지현]
		*/
		
				//삭제 후에 홍길동 삽입 
				//검색 후에 출력
				System.out.println(list.contains("정하영")); //true/false
				//몇번째에 있는지?
				int index = list.indexOf("정하영");
				if (index!=-1) {
					System.out.println(list.get(index));
					list.remove(index); //삭제
					list.add(index, "홍길동");//삽입
				} else {
					System.out.println("정하영씨는 없다.");
				}
				System.out.println(list.toString()); //[주강민, 임경재, 이지현] .toString() 생략가능
		
				//index = list.lastIndexOf("정하영");
		
				//list.clear();//모든 요소 삭제 // []
				
				System.out.println(list.isEmpty());//true 요소가 비워져있는지?
				
				System.out.println(list);
				
				//*** .iterator()***중요한 함수
				//요소를 순차적으로 처리할 수 있는 반복자(Iterator)를 반환하는 메서드 ***
				Iterator ir = list.iterator();
				
				//hasNext() ---- 처리할 다음 요소가 있으면 true 없으면 false 
				while (ir.hasNext()) {
					//   다음 요소를 얻어오는 메서드next()
					String name = (String) ir.next();
					System.out.println(name);
				}//while
				
				
				
				
	}//main

}//class
