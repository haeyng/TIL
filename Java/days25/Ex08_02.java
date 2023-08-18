package days25;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Optional;
import java.util.stream.Stream;

import days25.Ex03.Direction;

public class Ex08_02 {

	public static void main(String[] args) throws IOException {

		String source = "package days25;\r\n"
				+ "/**\r\n"
				+ " * @author 송해영\r\n"
				+ " * @date 2023. 8. 17. - 오전 10:52:56\r\n"
				+ " * @subject\r\n"
				+ " * @content\r\n"
				+ " */\r\n"
				+ "public class Ex03 {\r\n"
				+ "	//							0			1			2			3			순서\r\n"
				+ "	//enum Direction { EAST, SOUTH, WEST, NORTH }\r\n"
				+ "	\r\n"
				+ "	 //순서보다는 내가 원하는 고정된 상수값으로 열거형을 사용할 일이 더 많음 \r\n"
				+ "	//enum Direction { EAST=100, SOUTH=100, WEST, NORTH } //문법에러\r\n"
				+ "	\r\n"
				+ "	\r\n"
				+ "	//The constructor Ex03.Direction(int) is undefined\r\n"
				+ "	//						생성자(1) X\r\n"
				+ "	//enum Direction { EAST(100), SOUTH(200), WEST(300), NORTH(400) } \r\n"
				+ "	\r\n"
				+ "	\r\n"
				+ "	enum Direction { //getter,setter 중에 setter은 안됨 수정이 안되서\r\n"
				+ "		EAST(100, \"▶\"), SOUTH(200,\"▲\"), WEST(300,\"◀\"), NORTH(400,\"▲\"); \r\n"
				+ "		\r\n"
				+ "		private final int value;\r\n"
				+ "		private final String symbol;\r\n"
				+ "		\r\n"
				+ "		/*\r\n"
				+ "		Direction(int value){		\r\n"
				+ "			this.value = value;\r\n"
				+ "		}\r\n"
				+ "		*/\r\n"
				+ "		\r\n"
				+ "		Direction(int value, String symbol) {\r\n"
				+ "			this.value = value;\r\n"
				+ "			this.symbol = symbol;\r\n"
				+ "		}\r\n"
				+ "\r\n"
				+ "		public int getValue() {\r\n"
				+ "			return value;\r\n"
				+ "		}\r\n"
				+ "\r\n"
				+ "		public String getSymbol() {\r\n"
				+ "			return symbol;\r\n"
				+ "		}\r\n"
				+ "\r\n"
				+ "		//추상메서드 선언 가능\r\n"
				+ "//		abstract int test(int i);\r\n"
				+ "		\r\n"
				+ "	} \r\n"
				+ "	\r\n"
				+ "	\r\n"
				+ "	\r\n"
				+ "	public static void main(String[] args) {\r\n"
				+ "\r\n"
				+ "			//[열거형에 멤버(필드,메서드,생성자) 추가하기]\r\n"
				+ "		\r\n"
				+ "			//[열거형 구조 이해하기]\r\n"
				+ "			/*\r\n"
				+ "			 *1. enum Direction { EAST, SOUTH, WEST, NORTH }\r\n"
				+ "			 *2. 컴파일러가 클래스 변환\r\n"
				+ "			 *		class Direction extends Enum{\r\n"
				+ "			 *			static final Direction EAST = new Direction(\"EAST\");\r\n"
				+ "			 *			static final Direction SOUTH = new Direction(\"SOUTH\");\r\n"
				+ "			 *			static final Direction WEST = new Direction(\"WEST\");\r\n"
				+ "			 *			static final Direction NORTH = new Direction(\"NORTH\");\r\n"
				+ "			 *\r\n"
				+ "			 *			private String name;\r\n"
				+ "			 *			public int namename(){\r\n"
				+ "			 *				return this.name;\r\n"
				+ "			 *			}\r\n"
				+ "			 *\r\n"
				+ "			 *			private int ordinal;\r\n"
				+ "			 *			public int ordinal(){\r\n"
				+ "			 *				return this.ordinal;\r\n"
				+ "			 *			}\r\n"
				+ "			 *\r\n"
				+ "			 *			private Direction(String name){\r\n"
				+ "			 *				this.name=name;\r\n"
				+ "			 *			}\r\n"
				+ "			 *		}\r\n"
				+ "			 *\r\n"
				+ "			 * */\r\n"
				+ "		\r\n"
				+ "			//열거형 ordinal() 메서드에 의해서 열거형 상수를 사용하는데 이 상수값은 0,1,2,3 순서를 반환한다.\r\n"
				+ "		 	//내가 원하는 정수값을 설정해서 사용할 수 있다.\r\n"
				+ "		\r\n"
				+ "			Direction [] dirArr = Direction.values();\r\n"
				+ "			for (Direction dir : dirArr) {\r\n"
				+ "				System.out.println(dir.name() + \"/\" + dir.ordinal() + \"/\"  + dir.getSymbol() + \"/\" + dir.getValue());			\r\n"
				+ "			}\r\n"
				+ "			\r\n"
				+ "//			EAST/0/▶/100\r\n"
				+ "//			SOUTH/1/▲/200\r\n"
				+ "//			WEST/2/◀/300\r\n"
				+ "//			NORTH/3/▲/400\r\n"
				+ "		\r\n"
				+ "		\r\n"
				+ "		\r\n"
				+ "		\r\n"
				+ "		\r\n"
				+ "		\r\n"
				+ "		\r\n"
				+ "		\r\n"
				+ "	}//main\r\n"
				+ "\r\n"
				+ "}//class\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "";
		
		//[문제] source 문자열에서 [21번째 라인] 문자열을 String line21 변수에 저장한 후 출력하는 코딩.
		
		/*[3번째 방법-람다식 성능별로..]
		String [] datas = source.split("\r\n");
		Optional<String> a =  Stream.of(datas).skip(20).findFirst();
		a.get();
		*/
		
		
		/*[2번째 방법]
		//라인 단위 처리할 수 있는 보조스트림 : BufferedReader
		// source -> XXXReader 문자스트림 -> 보조스트림
		// String -> StringReader/StringWriter
		
		StringReader sr = new StringReader(source); //문자열을 문자스트림으로 변환.
		
		BufferedReader br = new BufferedReader(sr);
		
		//br.skip(20); //문자 20개를 스킵함
	
		String line21 = null;
		int i = 1;
		while (i++<=20) br.readLine() ;
			line21=br.readLine();
				
		System.out.println(line21);
		*/
		
		//[1번째 방법]
		
		String [] datas = source.split("\r\n");
		System.out.println(datas[20]);
		
	}//main

}//class
