package days04;

import java.util.Iterator;

/**
 *@author 송해영
 *@date 2023. 7. 22.-오후 2:29:31
 *@subject
 *@content
 */
public class Ex10_02 {
	public static void main(String[] args) {
		// 임의의(랜덤한) 수 발생시키는 클래스가 있고 그 클래스 안에 발생시키는 메서드가 있다.
		//Math.random()
		//1.기능:임의의 수를 발생시키는 함수 2.매개변수:안줘도 됨 3.리턴값:(0.0<=double 실수를 반환<1.0)
		
		// 0.0*3<=Math.random*3<1.0*3
		// 0.0<=Math.random*3<3.0
		// 0<=(int)(Math.random*3)<3
		// 1<=(int)(Math.random*3)<4
		
		for (int i = 0; i < 10000; i++) {
			//double v = Math.random();
			int v = (int)(Math.random()*3)+1;
			if (v<1 || v>4) {            //if 돌려서 위에 설정한 범위에 맞는 값만 나오는지 확인작업임
				System.out.println(v); //실행해도 범위에서 벗어나는 값이 없고 end만 출력됨	
			} //if
			//System.out.println(v);
		} //for
		System.out.println( " end ");
	}//main
}//class
