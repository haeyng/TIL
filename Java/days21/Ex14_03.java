package days21;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오후 3:30:30
 * @subject
 * @content
 */
public class Ex14_03 {

	public static void main(String[] args) {

		ArrayList team1 = new ArrayList(10);
		
		String t1 = "이경서(팀장), 신종혁, 이재영, 송해영 , 신기범, 이준희, 김성준";
		t1=t1.replaceAll("\\(팀장\\)", "");//()를 정규표현식 기호로 인식
		String [] t1Arr= t1.split("\\s*,\\s*");
		for (int i = 0; i < t1Arr.length; i++) {
			team1.add(t1Arr[i]);
		} // for
		
		ArrayList team2 = new ArrayList(10);
		team2.add("박민석");
		team2.add("유희진");
		team2.add("고경림");
		
		ArrayList team3 = new ArrayList(10);
		team3.add("박정호");
		team3.add("이상문");
		team3.add("이주영");
		
		ArrayList class5 = new ArrayList(team1);
		class5.addAll(team2);
		class5.addAll(team3);
		System.out.println(class5);
		
		Iterator ir = class5.iterator();
		while (ir.hasNext()) {
			String name = (String) ir.next();
		}//while
		
		System.out.println(class5.containsAll(team1));//true // 팀1이 포함되어 있는지 체크
		
		ArrayList class5Clone =  (ArrayList) class5.clone(); //다운캐스팅
		class5Clone.removeAll(team1); //팀1 제거
		
		System.out.println(class5Clone);
		
		//class5Clone.sort();		
		
		//Collections.sort(class5Clone);// Collection's' 클래스
		
		//class5Clone.sort(Comparator.naturalOrder());
		
		class5Clone.sort(String.CASE_INSENSITIVE_ORDER);
		
		System.out.println(class5Clone);
		

		
	}//main

}//class




