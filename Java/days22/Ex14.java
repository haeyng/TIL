package days22;

import java.util.HashSet;

public class Ex14 {

	public static void main(String[] args) {

		// 		Collection 인터페이스
		//         ㄴSet 인터페이스 구현한 컬렉션 클래스
		// - 특징 : 순서 유지 X, 중복 허용 X
		// - HashSet : 컬렉션 클래스
		//(참고) Set + 순서 유지 O ==> LinkedHashSet 
		
		HashSet hs = new HashSet(); 
		hs.add(9);
		hs.add(1);
		hs.add(15);
		hs.add(10);
		
		System.out.println(hs);//[1, 9, 10, 15] (특징1)저장순서가 유지 안됨 , 정렬된건 중요X
		
		hs.add(1);
		System.out.println(hs);//[1, 9, 10, 15] (특징2)중복 허용X
		
		System.out.println(hs.size());
		
		
		
		
		
		
		
	}//main

}//clas
