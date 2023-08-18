package days16;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.RandomAccess;
import java.util.Vector;

/**
 * @author 송해영
 * @date 2023. 8. 3. - 오후 2:05:31
 * @subject - 시험
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {
		//인터페이스의 장점
		//1. 개발 시간을 단축시킬 수 있다.
		//    왜? 인터페이스만 작성하면 사용하는 곳에서는 
		//			인터페이스를 구현한 클래스가 만들어져있지 않더라도 개발을 진행할수있다. 
		//	예) has-a 관계 Car, Engine 클래스
		//  Car 클래스 코딩..
		//			ㄴ Engine 클래스 구현이 되어야하는데 만들어지지 않았으면?
		//			Engine 인터페이스 구현 클래스 - H_Engine, K_Engine
		//
		
		/*[1번- 개발시간을 단축시킬수있다.]
		//인터페이스 매개변수 다형성
		//Engine engine = new K_Engine2();
		Engine engine = new K_Engine();
		Car mycar = new Car (engine);
		*/
	
		//2. 표준화가 가능하다.
		//		Engine 인터페이스를 구현해서 클래스를 만들었다면 
		//		표준화 되어져 있을것이다.
		
		//3. 서로 상속관계 관련이 없는 클래스들에게 인터페이스로 관계를 맺어 줄 수 있다.
		//		 (상속관계가 아닌. 부모, 자식 관계X)
		//		왜?
		
		/*
//		class ArrayList<E> extends AbstractList<E>
//      implements List<E>, RandomAccess, Cloneable, java.io.Serializable		
		List l = new ArrayList();
		
//		class Vector<E>
//	    extends AbstractList<E>
//	    implements List<E>, RandomAccess, Cloneable, java.io.Serializable		
		List v = new Vector();
		
		test03(l);
		test03(v);
		*/
		
		//4. 독립적인 프로그래밍이 가능하다.
		//		선언 + 구현
		
		
	} // main
		
		public static void test03(List list) {
			
		}
		
}//class
