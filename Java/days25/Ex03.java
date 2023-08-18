package days25;
/**
 * @author 송해영
 * @date 2023. 8. 17. - 오전 10:52:56
 * @subject
 * @content
 */
public class Ex03 {
	//							0			1			2			3			순서
	//enum Direction { EAST, SOUTH, WEST, NORTH }
	
	 //순서보다는 내가 원하는 고정된 상수값으로 열거형을 사용할 일이 더 많음 
	//enum Direction { EAST=100, SOUTH=100, WEST, NORTH } //문법에러
	
	
	//The constructor Ex03.Direction(int) is undefined
	//						생성자(1) X
	//enum Direction { EAST(100), SOUTH(200), WEST(300), NORTH(400) } 
	
	
	enum Direction { //getter,setter 중에 setter은 안됨 수정이 안되서
		EAST(100, "▶"), SOUTH(200,"▲"), WEST(300,"◀"), NORTH(400,"▲"); 
		
		private final int value;
		private final String symbol;
		
		/*
		Direction(int value){		
			this.value = value;
		}
		*/
		
		Direction(int value, String symbol) {
			this.value = value;
			this.symbol = symbol;
		}

		public int getValue() {
			return value;
		}

		public String getSymbol() {
			return symbol;
		}

		//추상메서드 선언 가능
//		abstract int test(int i);
		
	} 
	
	
	
	public static void main(String[] args) {

			//[열거형에 멤버(필드,메서드,생성자) 추가하기]
		
			//[열거형 구조 이해하기]
			/*
			 *1. enum Direction { EAST, SOUTH, WEST, NORTH }
			 *2. 컴파일러가 클래스 변환
			 *		class Direction extends Enum{
			 *			static final Direction EAST = new Direction("EAST");
			 *			static final Direction SOUTH = new Direction("SOUTH");
			 *			static final Direction WEST = new Direction("WEST");
			 *			static final Direction NORTH = new Direction("NORTH");
			 *
			 *			private String name;
			 *			public int namename(){
			 *				return this.name;
			 *			}
			 *
			 *			private int ordinal;
			 *			public int ordinal(){
			 *				return this.ordinal;
			 *			}
			 *
			 *			private Direction(String name){
			 *				this.name=name;
			 *			}
			 *		}
			 *
			 * */
		
			//열거형 ordinal() 메서드에 의해서 열거형 상수를 사용하는데 이 상수값은 0,1,2,3 순서를 반환한다.
		 	//내가 원하는 정수값을 설정해서 사용할 수 있다.
		
			Direction [] dirArr = Direction.values();
			for (Direction dir : dirArr) {
				System.out.println(dir.name() + "/" + dir.ordinal() + "/"  + dir.getSymbol() + "/" + dir.getValue());			
			}
			
//			EAST/0/▶/100
//			SOUTH/1/▲/200
//			WEST/2/◀/300
//			NORTH/3/▲/400
		
		
		
		
		
		
		
		
	}//main

}//class





