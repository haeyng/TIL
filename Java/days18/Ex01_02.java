package days18;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

public class Ex01_02 {

	public static void main(String[] args) {

		String [] names = {
			"김호영", "박정호","주강민","김정주","고경림"
		};
		
		//									String[] -> Object[] String을 Object에 담을수 있음 매개변수 다형성
		System.out.println(Arrays.toString(names));
		//							Arrays.toStirng(String[]a)가 없는데도 출력이 되는 이유
		//이름을 오름차순 정렬 출력 ㄱ~ㅎ 순
		Arrays.sort(names); //매개변수 다형성 , 오버로딩
		System.out.println(Arrays.toString(names));
		
		
		//이름을 내림차순 정렬 출력
		/* 첫번째 방법
		String [] temp = new String [names.length];
		for (int i = names.length-1; i >=0; i--) {
			temp[4-i] = names[i];
		} // forr
		System.out.println(Arrays.toString(temp));
		//names = temp;
		*/
		
		//[두번째 방법] 배열을 다루기 쉽도록 기능이 구현된 클래스 : Arrays 클래스
		//					컬렉션 - > 다루기 쉽도록 기능이 구현된 클래스 : Collections 클래스
		/*
		Arrays.sort(names, Collections.reverseOrder());
		System.out.println(Arrays.toString(names));
		*/
		
		
		
		//[두번째 방법]익명,무명 클래스
		/*
		Arrays.sort(names, new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {
				//return o1.equals(o2);
				return o2.compareTo(o1); //양수, 0, 음수를 돌려줌
			}
		});
		System.out.println(Arrays.toString(names));
		*/
		
		
		//[세번째 방법] 익명 클래스를 람다식으로 표현 ... 암기
		Arrays.sort(names , ( o1,o2 ) -> o2.compareTo(o1));
		System.out.println(Arrays.toString(names));
		
		
	}//main

}//class
