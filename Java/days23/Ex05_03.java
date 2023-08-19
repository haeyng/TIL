package days23;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.NavigableSet;
import java.util.TreeSet;
import java.util.stream.Collectors;

/**
 * @author 송해영
 * @date 2023. 8. 14. - 오후 2:25:07
 * @subject
 * @content
 */
public class Ex05_03 {

	public static void main(String[] args) {

		int [] score = {80, 95, 50, 85, 45, 65, 10, 100};
		//1) 75 보다 큰 점수를 얻어와서 출력.
		
		/*[첫번째 방법]
		TreeSet<Integer> ts = new TreeSet<Integer>();
		for (int i = 0; i < score.length; i++) {
			ts.add(score[i]);
		} // for
		*/
		
		//[두번째 방법]
		// int [] -> TreeSet 변환 (for문 돌리지 말고)
		
		// int [] -> ArrayList ->TreeSet 변환
		//Arrays.asList(배열) .. 문제점? (T배열) 클래스여야됨 
		//ArrayList<Integer> list = ;
		
		//IntStream -> int X Integer Stream 변환
		//Arrays.stream(score).boxed()       //Stream<Integer> 객체가 만들어짐
		ArrayList<Integer> list =(ArrayList<Integer>) Arrays.stream(score).boxed().collect(Collectors.toList());
		
		//TreeSet<Integer> ts = new TreeSet<Integer>(ArrayList);
		TreeSet<Integer> ts = new TreeSet<Integer>(list);
		
		
		
		
		
		//1) 75보다 큰 점수를 얻어와서 출력.
		//tailSet(값) 지정한 값보다 큰 값의 객체들을 반환
		//ts.tailSet(75, true)
		NavigableSet<Integer> ss = ts.tailSet(75,false);
		System.out.println(ss);//[80, 85, 95, 100]
		
		//System.out.println(ts.subSet(75, false, ts.last(), true));
		
		
		//2) 50보다 작은 점수를 얻어와서 출력
		//headSet 지정한 값보다 작은 값의 객체들을 반환
		NavigableSet<Integer> ss2 = ts.headSet(50, false);
		System.out.println(ss2); //[10, 45]
		
		
		//3) 50~75 사이의 점수를 얻어와서 출력
		/*
		NavigableSet<Integer> ss3 = ss.headSet(50,false); //java.lang.IllegalArgumentException
		System.out.println(ss3);
		*/
		NavigableSet<Integer> ss3 = ts.subSet(50, false, 75, false);
		System.out.println(ss3);//[65]		
		
	}//main

}//class
