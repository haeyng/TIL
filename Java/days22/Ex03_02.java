package days22;

import java.util.ArrayList;
import java.util.Iterator;

public class Ex03_02 {

	public static void main(String[] args) {
		
		ArrayList team1 = new ArrayList();
		team1.add("이경서");
		team1.add("신종혁");
		team1.add("이재영");
		team1.add("송해영");
		team1.add("신기범");
		team1.add("이준희");
		team1.add("김성준");
		
		dispList(team1);
		
		System.out.println(team1.size()); //요소의 갯수 7
		team1.trimToSize(); //기본초기용량이 10개인데 7개만 채워짐 3개 남음 -> 남는 요소 공간을 제거함 별로 중요X
		
		String name= (String) team1.get(1);//다운캐스팅 Object->String 다운캐스팅
		
		/*
		team1.remove(1);
		team1.add(1, "홍길동");
		*/
		team1.set(1, "홍길동");
		
		int index = team1.indexOf("홍길동");
		team1.remove(index); // 삭제된 요소(홍길동)를 반환해줌
		
		System.out.println(team1);
		
		
		//[김씨 찾는 코딩 3가지]
		//String regex = "김.+";
		//name.charAt(0) == '김';
		//name.startsWith("김");
		
		
	}//main

	private static void dispList(ArrayList team1) {
		//반복자 사용
		Iterator ir = team1.iterator();
		while (ir.hasNext()) {
			String name = (String) ir.next();
			System.out.println(name);
		}//while
		
	}

}//class
