package days05;
/**
 *@author 송해영
 *@date 2023. 7. 22.-오후 11:54:11
 *@subject  [Java 14] 개선된 switch 문(Enhanced Switch Expressions)
 *@content
 *          https://congcoding.tistory.com/73
 *          https://openjdk.org/jeps/361
 */
public class Test00 {

	public static void main(String[] args) {
		/*
		String users;
		switch (user) {
		case 1:
			users = "가위";
			break;
		case 2:
			users = "바위";
			break;
		case 3:
			users = "보";
			break;
		} // switch
		 */

		/* JDK 14~
		int com = 1;
		String coms = switch (com) {
			case 1 -> "가위";
			case 2 -> "바위";
			case 3 -> "보";		 
			default -> null;
		}; // switch
		System.out.println(coms);
		 */

	}

}