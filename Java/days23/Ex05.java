package days23;

import java.util.SortedSet;
import java.util.TreeSet;

/**
 * @author 송해영
 * @date 2023. 8. 14. - 오후 2:00:54
 * @subject
 * @content
 */
public class Ex05 {

	public static void main(String[] args) {

		//Set : HashSey, LinkedHashSet, 
		//			[TreeSet]
		//1. 중복을 허용하지 않음, 순서유지 안됨
		//2. 이진 검색 트리라는 자료 구조로 데이터를 저장하는 컬렉션 클래스.
		//3. 이진 검색 트리 - 검색, 정렬, 범위 검색하는데 성능이 높다.
		//4. 링크드리스트 처럼 노드(Node)가 서로 연결된 구조.
		//5. 최상위 노드를 루트(root)노드라고 한다.
		//		부모-자식 노드 관계
		//		형제 노드 관계
		//6. 트리노드의 구조
		//		class TreeNode{
		//				TreeNode left; //왼쪽 자식노드
		//				Object element;
		//				TreeNode right; //오른쪽 자식노드
		//		}
		TreeSet<Integer> ts = new TreeSet<>();
		 ts.add(7);
		 ts.add(4);
		 ts.add(9);
		 ts.add(1);
		 ts.add(5);
		 ts.add(6);
		 
		 System.out.println(ts); //[1, 4, 5, 6, 7, 9]
		 
		 //정렬된 순서에서 첫 번째, 마지막번째 값을 반환
		 System.out.println(ts.first()); //1
		 System.out.println(ts.last()); //9
		 
		 SortedSet<Integer> ss = ts.subSet(4, 7);//4에서 7까지 집합, 4,7은 포함 안됨
		 System.out.println(ss);//[4, 5, 6]
		 
		 //지정된 값(1)보다 큰 값을 가진 가장 가까운 값을 반환.
		 System.out.println(ts.higher(1)); //4
		 System.out.println(ts.lower(4)); //1
		 
		 //지정된 값(3)과 같은 객체를 반환한다.
		 //트리 구조에 3값이 없으면 작은 값을 가진 객체 중에 가장 가까운 값을 반환한다.
		 //없으면 null 반환
		 System.out.println(ts.floor(3));  //1

		 System.out.println(ts.ceiling(3));  //4
		 
		
	}//main

}//class
