package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 3:04:12
 * @subject [전위형, 후외형 증감연산자 설명]
 * @content
 */
public class Ex05_07 {

	public static void main(String[] args) {
		int x =10;
		//int y = ++x;  //전위형 증감연산자 먼저 처리 되고 대입 x=11,y=11
		int y = x++;  //후위형 증가 시키기 전에 먼저 대입됨 x=11,y=10
		
		//단독(홀로) 사용 될 때는 전/후위형은 같은 결과이고 대입연산자와 같이 사용될때는 처리결과가 달라진다.
		//x++;
	    //++x;
		
		System.out.printf(">x=%d,y=%d\n", x,y);
		
	}//main

}//class
