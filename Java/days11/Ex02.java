package days11;

import java.util.Arrays;

public class Ex02 {

	public static void main(String[] args) {

			int [] m =  {3,5,2,4,1};
//		   정수 4가 있는 위치(index)에 100을 삽입하는 코딩을 하세요.   
			
			int n = 4;
			int index = sequentialSearch(m,n);
			System.out.println("> index : " + index);
			
			
			//System.arraycopy()
			int [] temp = new int [m.length+1];
			for (int i = 0; i < m.length; i++) {
//				if(index>i) temp[i] = m[i];
//				else temp[i+1] = m[i];
				temp[index>i?i:i+1] = m[i];
			} // for
			temp[index]=100;
			m=temp;
			
			System.out.println(Arrays.toString(m));
			
			
	}//main

	private static int sequentialSearch(int[] m, int n) {
		int index = -1; //배열은 0부터 시작 찾은값이 없다 보통 -1로 줌
		for (int i = 0;  i< m.length; i++) {
			if (n==m[i]) {
				index = i;
				break;
			} //if
		} // for
		return index;
	}
}//class
