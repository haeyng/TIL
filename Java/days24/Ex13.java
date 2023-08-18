package days24;
/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 4:51:15
 * @subject
 * @content
 */
public class Ex13 {

	public static void main(String[] args) {

		// [원시타입(raw type)과 제네릭 타입 간의 형변환]
		//  - 경고만 발생시키고 자동으로 사용가능함.
		//  - <T> 없으면 Object 타입으로 컴파일된다.
		Box05<String> box = new Box05<>();
		
		//Box05 <Object>box2 = new Box05(); 
		Box05 box2 = new Box05(); //<T>없으면 위에 코딩처럼 Object 타입과 같음
		
		
		
		
	}//main

}//class
