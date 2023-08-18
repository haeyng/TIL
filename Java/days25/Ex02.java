package days25;
/**
 * @author 송해영
 * @date 2023. 8. 17. - 오전 10:45:16
 * @subject
 * @content
 */
public class Ex02 {

	enum Direction { EAST, SOUTH, WEST, NORTH } //클래스 밖에 선언 가능
	
	public static void main(String[] args) {
		
		Direction d1 = Direction.EAST;
		
		System.out.println(d1);
		System.out.println(d1.name()); //"EAST"
		System.out.println(d1.ordinal()); //0 상수의 순서
		
		Direction d2 = Direction.valueOf(d1.name());
		System.out.println(d2);
		
		switch (d2) {
		case EAST: //1 Direction 생략되고 상수만 적으면 된다
			break;
		case NORTH: //2
		 	break;
		case SOUTH://3 
			break;
		case WEST:
		}//switch
		
		
		
	}//main

}//class	
