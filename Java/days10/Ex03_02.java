package days10;

import java.util.Arrays;

public class Ex03_02 {

	public static void main(String[] args) {
		
		int [] m = new int [3];
		m[0] =5;
		m[1] =3;
		m[2] =7;
		
		//java.lang.ArrayIndexOutOfBoundsException 배열크기가 3이라 안된다는뜻
		//m[3]=10;
		int index = 3;
		if (index==m.length) { //같으면 배열이 다 찼다는 뜻
			int [] temp = new int [m.length+3];
//			temp[0]=m[0];
//			temp[1]=m[1];
//			temp[2]=m[2];
			
			for (int i = 0; i < m.length; i++) {
				temp[i] = m[i];
			} // for
			m = temp; //temp 주소값을 m에
		}
		//1.원래 배열크기에 +3 만큼 증가
		//[5][3][7]
		//[][][][][][]              []temp
		//2.m 배열의 데이터를 temp 배열에 요소 복사
		//3.temp배열을 m배열로 바꾸는 코딩.
		m[3]=10;
		System.out.println(Arrays.toString(m));
		
	}//main

}//class
