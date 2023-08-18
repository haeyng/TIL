package days22;

import java.util.ArrayList;
import java.util.Iterator;

public class Ex03_03 {

	public static void main(String[] args) {
		
		ArrayList team1 = new ArrayList();
		team1.add("이경서");
		team1.add("신종혁");
		team1.add("이재영");
		team1.add("송해영");
		team1.add("신기범");
		team1.add("이준희");
		team1.add("김성준");
		
		//팀에서 이 씨만 삭제
		
		//                    n변수는 아무거나
		team1.removeIf(n->((String)n).charAt(0)=='이');
		System.out.println(team1);
		
	}//main

}//class
