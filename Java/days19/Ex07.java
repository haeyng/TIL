package days19;
/**
 * @author 송해영
 * @date 2023. 8. 8. - 오후 12:23:00
 * @subject
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {

		//[오토 박싱(boxing)과 오토 언박싱(unboxing)]
		int i = 100; //변수
		Integer j = i;	  //Integer 클래스의 객체 // 기본형(i)->객체(j)... 오토 박싱 : 기본형이 자동으로 클래스타입의 객체로 변환되는것
		
		//JDK1.5 이전에는 Integer k = new Integer(i); 
		
		
		int k = j;        //오토 언박싱 : 래퍼클래스의 객체j가 기본형으로 변환이 되어졌다(형변환 없이 자동적으로) 
		
		test(i); //자료형이 기본형 int
		test(3.14); //int -> Integer 박싱 -> Object 업캐스팅 가능
		test(1L);
		test('a');
		test(true);
		
		test(j);//자료형이 Integer 클래스  .....부모가 Object   업캐스팅가능
		test("홍길동");//String  .....부모가 Object   업캐스팅가능
		
	}//main

	//									모든 자료형을 매개변수로 받아서 처리 (업캐스팅)
	private static void test(Object i) { 
		System.out.println(i);
	}
	
	/*
	private static void test(int i) { //Integer -> int 형변환 되었다. : 언박싱됨
		System.out.println(i);
	}
	*/
	
}//class
