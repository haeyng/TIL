package days13;

 /**
 * @author 송해영
 * @date 2023. 7. 31. - 오후 2:47:02
 * @subject 클래스의 복사(copy)와 복제(clone)
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {
		//클래스 복사(copy)
		
		//클래스 복제(clone)
		//        ㄴ 얕은복제
		//        ㄴ 깊은복제
		
		Point p = new Point();
		//객체명.필드명
		//객체명.메서드명
		p.x = 100;
		p.y = 200;
	
		//클래스 복사(동일한 인스턴스 참조)
		Point pcopy = p;
		pcopy.x = 1;
		
		System.out.println(p.x); //1
		
		//클래스 복제
		Point pclone = new Point();
		pclone.x = p.x;
		pclone.y = p.y;
		
		
		
		
	}//main

}//class
