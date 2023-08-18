package days10;

import java.util.Arrays;

public class Ex03_03 {

	public static void main(String[] args) {
		
		
//		1.Arrays.copyOfRange() 복사하는 함수
//		int [] arr = {1,2,3,4,5};
//		int [] arrCopy = Arrays.copyOfRange(arr, 2, 4);
//		System.out.println(Arrays.toString(arrCopy)); //[3,4]
		
		int [] m = new int [3];
		m[0] =5;
		m[1] =3;
		m[2] =7;
		// m     [1][2][3][4][5]
		// temp  [][][][][2][3][][]
		int index = 3;
		
		
		//[2]arraycopy 복사하는 함수
		if (index==m.length) { //같으면 배열이 다 찼다는 뜻
			int [] temp = new int [m.length+3];
			//System.arraycopy(m, 1 , temp, 4, 2); //m배열에서 1번째공간에 갯수 두개를 temp배열에 4번째 공간에 복사
			System.arraycopy(m, 0 ,temp , 0, m.length);
			//Arrays 클래스 : 배열을 다루기 쉽도록 기능이 구현된 클래스
			m = temp;
		}//if
		m[3]=10;
		System.out.println(Arrays.toString(m));
		
	}//main

}//class
