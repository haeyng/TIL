package days24;

import java.util.ArrayList;
import java.util.Collections;
import java.util.stream.Collectors;
/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 12:08:34
 * @subject
 * @content
 */
public class Ex03 {

	public static void main(String[] args) {

		//Arrays : 배열을 사용하기 쉽도록 기능이 구현된 클래스
		//			sort(), binarySearch(), fill(), copy() 등등
		//Collections 클래스
		
		ArrayList<Integer> list = new ArrayList<>();
		System.out.println(list); //[]
		
		//1,2,3,4,5
		//list.add(1); ... list.add(5);
		//			<? super Object>의 의미
		//			Collection<? super Object>
		//			,Object....
		
		Collections.addAll(list, 1,2,3,4,5);
		System.out.println(list); //[1, 2, 3, 4, 5]
		
		//[4, 5, 1, 2, 3] 로 만들고 싶음
		Collections.rotate(list, 2);
		System.out.println(list);//[4, 5, 1, 2, 3] 회전됨
		
		//0번째 2번째 자리바꿈
		Collections.swap(list, 0, 2);;
		System.out.println(list);//[1, 5, 4, 2, 3] 자리바꿈됨
		
		//섞기
		Collections.shuffle(list);
		Collections.shuffle(list);
		Collections.shuffle(list);
		System.out.println(list);
		
		//정렬
		Collections.sort(list);
		System.out.println(list);
		
		//내림차순 정렬
		Collections.sort(list, Collections.reverseOrder());
		System.out.println(list);
		
		//-1로 채우기
		Collections.fill(list, -1);
		System.out.println(list);
		
		//복사
		//Collections.copy(null, null);
		
		//바꾸기
		//Collections.replaceAll(null, null, null)
		
		//...등등
		
		
		
		
		
	}//main

}//class
