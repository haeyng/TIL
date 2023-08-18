package days02;

/**
 *@author 송해영
 *@date 2023. 7. 16.-오후 7:36:29
 *@subject String -> byte, short, int, long-> 형변환하는 방법
 *@content
 */
public class Ex10_02 {

	public static void main(String[] args) {

		String n = "10";
		
		int i = Integer.parseInt(n);       //10
		long l = Long.parseLong(n);    //10L
		short s = Short.parseShort(n); //10
		byte b = Byte.parseByte(n);     //10
		
	}

}
