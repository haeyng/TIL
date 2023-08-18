package days12;

import java.util.Arrays;

/**
 *@author 송해영
 *@date 2023. 7. 30.-오전 5:44:53
 *@subject 이진검색 (binarySearch)
 *				  장점 : 반절씩 버리면서 찾으니까 데이터가 많아도 검색 성능이 빠름 
 *@content
 */
public class Ex03 {

	public static void main(String[] args) {
		//순차검색
		//이진검색 : (필수조건 - 정렬이 되어져 있어야함 )
		int [] m = { 0, 4, 5, 15, 20, 21, 22, 24, 25, 28, 29, 30, 32, 33, 40, 43, 46, 47, 48, 58, 62, 63, 71, 76, 
						86, 91, 94, 99, 111, 116, 128, 135, 137, 139, 142, 145, 146, 150, 151, 160, 161, 166, 168, 
						169, 172, 181, 184, 185, 191, 198 };
		//System.out.println(   Arrays.toString(m)   );
		//System.out.print(m.length); //배열의 갯수 50개
		
		int n = 0;
		
		int index = binarySearch(m,n); //m배열에서 n정수를 찾고 index 위치값을 반환하겠다

		if (index==-1) { //-1을 반환하게 되면 찾는 숫자는 없다
			System.out.println("찾는 정수는 없다.");
		} else { //-1이 아니면
			System.out.println(index + "위치에 있다.");
		}//if
		
	}//main

	private static int binarySearch(int[] m, int n) {
		//                   0 -------ㅣ--------(1)-m중간값-(2)------ㅣ-------m.length -1(여기서는 49)
		//		        bottom(0)                         24                              top(49)      .... ()의 값을 각각 변수에 저장
		//                                                  middle
		//						            m[middle] 하고 n 하고 같은지, 큰지, 작은지 비교
		
		//m[middle]==n 
		//m[middle]>n             중간값middle보다 찾고자 하는 n이 작으면 top의 위치를 위 그림의 (1)처럼 middle-1로 하고 다시 top+bottom/2로 middle값을 찾는다  
		//m[middle]<n 			   bottom=middle+1로 하고 다시 top+bottom/2로 middle값을 찾는다 
			
		int bottom = 0;
		int top = m.length-1;
		int middle;
		int count=0; 

		while (bottom<=top) {
			count++;
			middle = (top+bottom)/2;
			if (m[middle]==n) {
				System.out.println(">찾은 횟수 : " +count);
				return middle;
			}else if(m[middle]>n){
				top=middle-1;
			}else {  // m[middle] < n
				bottom = middle+1;
			}
		}//while
		System.out.println(">못 찾은 횟수 : " + count);
		return -1;
	}
}//class
