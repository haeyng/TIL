package days18;

import java.util.Arrays;
import java.util.Collections;

public class Ex01 {

	public static void main(String[] args) {

		int [] m = {3,5,2,4,1};
		System.out.println(Arrays.toString(m));
		Arrays.sort(m);
		System.out.println(Arrays.toString(m));
		
		/* [내림차순 첫번째방법]
		int [] temp = new int [m.length];
		for (int i = m.length-1; i >=0; i--) {
			temp[4-i] = m[i];
		} // forr
		System.out.println(Arrays.toString(temp));
		//names = temp;
		*/
		
		
		//[이유 이해하기]
		//The method sort(int[]) in the type Arrays is not applicable for the arguments (int[], Collections.reverseOrder())
		//: 인자가 기본형인 int 배열 타입은 적용이 안된다. comparable 인터페이스 클래스 타입만 가능
		//Arrays.sort(m, Collections.reverseOrder());    //T 는 type 는 반드시 클래스
		//System.out.println(Arrays.toString(m));
		
		
		
		//int[] -> Integer[] 래퍼클래스 배열로 변환 해서 Arrays.sort(m, Collections.reverseOrder()); 사용
		//박싱 언박싱
		Integer[] temp = Arrays.stream(m).boxed().toArray(Integer[]::new);
		//배열을 스트림으로 바꿈.integer타입으로 된 스트림객체가 됨.  Integer 배열이 됨
		Arrays.sort(temp, Collections.reverseOrder());
		System.out.println(Arrays.toString(temp));
		
		
		
		
	}//main

}//class
