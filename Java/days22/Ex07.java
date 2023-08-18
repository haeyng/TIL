package days22;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오전 11:54:16
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {

		//Vector 컬렉션 클래스
		//		ㄴ List 인터페이스를 구현한 클래스
		//		ㄴ 순서가 유지되고 중복 허용 한다 
		//		ㄴ ArrayList 와 동일함 (차이점?)
		//			 	ㄴ 멀티스레드에 안전(동기화 처리 되어있다.) : 스레드 쓸때는 Vector 사용
		
		//StringBuilder : 멀티 스레드에 안전하지 않다, 동기화 처리가 되어있지 않다.
		//StringBuffer : 멀티 스레드에 안전하다, 동기화 처리가 되어 있다.
		
		
		Vector v = new Vector();
		
		v.addElement("김호영"); //add()와 동일.
		v.add("김성준");
		v.add("이지현");
		
		System.out.println(v.size()); //요소의 갯수
		System.out.println(v.capacity()); //용량을 가져오는  //10
		
		v.trimToSize(); //빈,남는 용량제거
		System.out.println(v.capacity());
		
		v.setSize(5);//빈곳은 unll을 넣어서 크기를 설정  // [a][b][c][미정][미정]
		//ㄴ 잘 안쓰임
		
		System.out.println(v.size()); //요소의 갯수
		System.out.println(v);
		
		//같은 코딩
		v.get(0);//"김호영"
		v.elementAt(0); //0번째 요소를 가져온다.
		
		
		//[반복자] 와 [열거자]의 차이점?
		Iterator ir = v.iterator();
		//
		
		//Enumeration 반복자가 아니라 열거자를 돌려준다.
		Enumeration en =  v.elements();
		
		//hasMoreElements() 요소 더 있는지 물어보고 true/false 반환 // 더 있으면 true
		while (en.hasMoreElements()) {
			//										nextElement() :  다음 요소를 얻어오는 메서드
			String name = (String) en.nextElement();
		System.out.println(name);	
		}
		
		String 제거한이름 = (String) v.remove(0);
		//v.removeElementAt(0);
		//v(벡터) null 요소 제외한 나머지 요소를 출력
		v.removeIf(n->n==null);
		System.out.println(v);
		
		//					메서드 참조
		//v.forEach(System.out::println);
		v.forEach(n->System.out.println(n));
		
		//같은 코딩
		//v.firstElement(); == v.get(0);
		//v.lastElement();    v.get(v.size()-1)
		
		//같은 코딩
		//v.insertElementAt("임경재", 1); == v.add(1,"임경재");
		
		//ArrayList-v.iterator()
		
		List subList =  v.subList(0, 2);
		System.out.println(subList);
		
		
		
		
		
	}//main

}//class
