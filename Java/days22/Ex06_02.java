package days22;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오전 11:27:15
 * @subject----변환 시험
 * @content
 */
public class Ex06_02 {

	public static void main(String[] args) {
		
		//ArrayList -> String [] 변환
		ArrayList list = new ArrayList();
		list.add("신종혁");
		list.add("고경림");
		list.add("이재영");

		/*
		//[1]
		String [] nameArr = new String[list.size()];
		Iterator ir = list.iterator();
		int index=0;
		while (ir.hasNext()) {
			String name = (String) ir.next();
			nameArr[index++] = name;
		}//while
		System.out.println(Arrays.toString(nameArr));
		*/
		
		
		//[2] Object 배열을 String 배열로 형변환
		/*//java.lang.ClassCastException
		String [] nameArr = (String[]) list.toArray();
		System.out.println(Arrays.toString(nameArr));
		*/
		
		/*
		String [] nameArr = (String[]) list.toArray(new String [list.size()]); //오류 해결
		System.out.println(Arrays.toString(nameArr));
		*/
		
		String [] nameArr = (String[]) list.toArray(new String [list.size()]);
		System.out.println(Arrays.toString(nameArr));
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
