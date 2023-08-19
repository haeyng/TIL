package days21;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;

/**
 * @author 송해영
 * @date 2023. 8. 10. - 오후 3:30:30
 * @subject
 * @content
 */
public class Ex14 {

	public static void main(String[] args) {

//		1조
//		이경서(팀장), 신종혁, 이재영, 송해영 , 신기범, 이준희, 김성준
//		2조
//		박민석(팀장), 유희진, 고경림, 임경재, 이지현 , 김정주, 김호영
//		3조
//		박정호(팀장), 이상문, 이주영, 정하영, 이동현, 주강민
		
		ArrayList team1 = new ArrayList(10);
		//System.out.println(team1.size());//0 총자릿수X, 그 안의 요소 수
		
		String t1 = "이경서(팀장), 신종혁, 이재영, 송해영 , 신기범, 이준희, 김성준";
		t1=t1.replaceAll("\\(팀장\\)", "");//()를 정규표현식 기호로 인식
		//t1=t1.replace("(팀장)", ""); 문자열
		String [] t1Arr= t1.split("\\s*,\\s*");
		for (int i = 0; i < t1Arr.length; i++) {
			team1.add(t1Arr[i]);
		} // for
		//System.out.println(team1);
		
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
		
		//iterator() class5 모든 요소 출력
		Iterator ir = class5.iterator();
		while (ir.hasNext()) {
			String name = (String) ir.next();
			//System.out.println(name);
		}//while
		
		System.out.println(class5.containsAll(team1));//true // 팀1이 포함되어 있는지 체크
		
		//class5 이름 오름차순으로 정렬
		//원본은 그대로 유지 복제본을 만들어서 수정,삭제,추가 할것임 clone
		ArrayList class5Clone =  (ArrayList) class5.clone(); //다운캐스팅
		class5Clone.removeAll(team1); //팀1 제거
		//System.out.println(class5);
		
		
		
		//2조 + 3조 원
		System.out.println(class5Clone);
		//이름 순으로 오름차순 정렬
							   //정렬할 때 기준이 되는 comparator 비교잣대, 비교기
		class5Clone.sort(new Class5Comparator());		
		
		System.out.println(class5Clone);
		
		
	}//main

}//class

class Class5Comparator implements Comparator{

	@Override
	public int compare(Object o1, Object o2) {
		//o1 instanceof String 
		String s1 = (String)o1;//다운캐스팅
		String s2 = (String)o2;
		return s1.compareTo(s2);//오름차순
		//return s2.compareTo(s1);//내림차순
	}
	
}

