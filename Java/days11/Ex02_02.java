package days11;

import java.util.ArrayList;

public class Ex02_02 {

	public static void main(String[] args) {
		
		
		//검색(Search)
		//1.순차검색(sequential search)
 		//2.이진검색(binary Search) + 정렬
		
		//int [] m =  {3,5,2,4,1};
		//위에 코딩처럼 배열 m을 사용 -> 단점
		//1) 요소 추가 (배열크기가 자동으로 증가/감소 되지 않는다)
		//2) 요소 삽입
		//3) 요소 삭제
		//4) 요소 수정 X
		
		//->컬렉션(collection) 클래스
		//ArrayList<E> jdk 1.5 제네릭스
		ArrayList list = new ArrayList(); //성능이 느림 for문보다
		list.add(3);
		list.add(5);
		list.add(2);
		list.add(4);
		list.add(1);
		list.add(6); //추가하면 자동으로 배열크기 증가!
		
		int index = list.indexOf(4); //찾고자하는 요소의 위치(index) 가져오기
		System.out.println(index);//3
		System.out.println(list);//[3, 5, 2, 4, 1]
		list.add(index, 100); // 요소삽입
		System.out.println(list);
		
		
		
		
	}//main
}//class
