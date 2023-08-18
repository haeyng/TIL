package days24;
/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 3:23:08
 * @subject
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {

		//[제네릭스의 제한]


	}//main

}//class


class Box02<T>{
	
	//첫번째)
	//Cannot make a static reference to the non-static type T : 제네릭 클래스에서는 정적필드를 선언할 수 없다. ... 컴파일 되기 전에 메모리에 올라감
	//static T item2; //정적 static 필드 선언

	
	/*
	//두번째)
	//static 메서드의 매개변수로 T 타입을 사용할 수 없다.
	static int compare(T t1, T T2) {
		return 0;		
	}
	*/
	
	//세번째)
	//T 타입의 배열은 선언할 수 있다.
	T [] itemArr;
	
	
}








