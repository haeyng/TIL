package days16;
/**
 * @author 송해영
 * @date 2023. 8. 3. - 오후 2:46:16
 * @subject
 * @content
 */
public class Ex11 {

	public static void main(String[] args) {
			//[default 메서드]
			// 5년이 지난 후에 IA 조상 인터페이스에 testXX() 라는 추상메서드가 있었으면 함
			
		
			//1)여러 인터페이스를 구현하면 디폴트 메서드 충돌.
			//    => 충돌나는 디폴트 메서드를 오버라이딩하면 해결됨.
			//2)조상클래스의 메서드와 디폴트 메서드 충돌
			//    => 충돌나는 디폴트 메서드는 무시가 된다.
		
	}//main

}//class

interface IA{
	//3개 추상메서드
	//void testXX(); //이 함수 5년 뒤에 추가 가능? 힘듦 
	default void testXX() {}
	//몸체구현
}
//IA 인터페이스 implements 클래스 200개
interface IB extends IA{
	//3개 추상메서드
	//2개 추상메서드
}
//IB 인터페이스 implements 클래스 400개
interface IC extends IB{
	//3개 추상메서드
	//2개 추상메서드
	//5개
}
//IC 인터페이스 implements 클래스 300개
interface ID extends IC{
	//3개 추상메서드
	//2개 추상메서드
	//5개
	//13개
}
//IE 인터페이스 implements 클래스 100개


