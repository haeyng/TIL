package days11;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Ex02_03 {

	public static void main(String[] args) {
		//배열 선언
		int [] m =  {3,5,2,4,1};
		
		//int [] ->ArrayList 변환
		
		/*변환 1번
		ArrayList list = new ArrayList();
		for (int  i= 0;  i< m.length; i++) {
			list.add(m[i]);
		} // for
		System.out.println(list);        //[3, 5, 2, 4, 1]
		*/
		
		/*변환 2번
		List<Integer> list = IntStream.of(m).boxed().collect(Collectors.toList());
		int index = list.indexOf(4);
		list.add(index, 100);
		*/
		
		
		
		
		
	}//main
}//class
