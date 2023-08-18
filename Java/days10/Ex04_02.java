package days10;

import java.util.Arrays;
/**
 *@author 송해영
 *@date 2023. 7. 30.-오후 5:06:30
 *@subject 요소 삭제
 *@content
 */
public class Ex04_02 {

	public static void main(String[] args) {

		int [] m = {3,5,2,4,1};
		System.out.println(Arrays.toString(m));
		//추가
		//삽입
		//수정
		/*
		int index = 2;
		m[2] = 100;
		*/
		//요소 삭제
		int index = 2;
		//[3, 5, 4, 1]             temp 4개짜리만들어서 앞두개 복사, 뒤에 두개는 한칸 앞으로 출력 2번째는 출력x
		
		int [] temp = new int [m.length-1];
		
		/*첫번째방법
		for (int i = 0; i <= temp.length; i++) {
			if (index>i) { temp[i] = m[i];
			} else if(index<i) {temp[i-1] = m[i];} 
		} // for
		m = temp;
		*/
		
		//두번째방법
		System.arraycopy(m, 0, temp, 0, index);
		for (int i = index+1; i < m.length; i++) {
			temp[index++] = m[i];
		} // for
		m = temp;
		
		System.out.println(Arrays.toString(m));
		
		
}
}//class





