package days23;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/**
 * @author 송해영
 * @date 2023. 8. 14. - 오후 12:23:10
 * @subject
 * @content
 */
public class Ex04 {

	public static void main(String[] args) {

		ArrayList<Integer> a = new ArrayList<Integer>();
		a.add(1);
		a.add(2);
		a.add(3);
		a.add(4);
		a.add(5);
		
		ArrayList<Integer> b = new ArrayList<Integer>();
		b.add(4);
		b.add(5);
		b.add(6);
		b.add(7);
		b.add(8);
		
		// 1) a U b 합집합 1,2,3,4,5,6,7,8
		/*
		ArrayList<Integer> hab = new ArrayList<Integer>();
		hab.addAll(a);
		Iterator<Integer> ir =  b.iterator();
		while (ir.hasNext()) {
			Integer i = ir.next();
			if (!a.contains(i)) {
				hab.add(i);
			} // if
		}//while
		System.out.println(hab);
		*/
		
		HashSet<Integer> hab = new HashSet<Integer>();
		hab.addAll(a);
		hab.addAll(b);
		System.out.println(hab);
		
		
		// 2) a - b 차집합 1,2,3
		//cha
		/*
		HashSet<Integer> cha = new HashSet<Integer>();
		cha.addAll(a);
		cha.removeAll(b);
		System.out.println(cha);
		*/
		
		
		/*
		HashSet<Integer> cha = new HashSet<Integer>(a); //생성자에 a 집어넣음
		//cha.addAll(a);
		Iterator<Integer> ir = cha.iterator();//Iterator는 중간에 수정,제거,추가 작업 할 수 없음, 예외 발생함 //java.util.ConcurrentModificationException
		while (ir.hasNext()) {
			Integer i = ir.next();
			if (b.contains(i)) cha.remove(i);  //i가 b컬렉션에 있으면 제거 //Iterator는 중간에 수정,제거,추가 작업 할 수 없음, 예외 발생함
		}//while
		//java.util.ConcurrentModificationException
		*/
		
		
		HashSet<Integer> cha = new HashSet<Integer>();
		HashSet<Integer> kyo= new HashSet<Integer>();
		
		Iterator<Integer> ir = a.iterator();
		while (ir.hasNext()) {
			Integer i = ir.next();
			if (!b.contains(i)) cha.add(i);
			else kyo.add(i);
		}//while
		System.out.println(cha);
		System.out.println(kyo);
		
		
		
		
		
		// 3) a ㅁ b 교집합 4,5
	
		kyo.addAll(a);
		kyo.remove(cha);
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
