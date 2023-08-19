package days23;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;

public class Ex01 {

	public static void main(String[] args) {
		
		/* 아래 출력 형식으로 코딩
		1게임 : [08][04][19][02][21][36]
		2게임 : [07][30][16][28][37][11]
		3게임 : [21][30][04][19][16][29]
		4게임 : [37][26][32][07][42][35]
		5게임 : [30][22][05][23][45][32]
		*/
		
		
		/*
		LinkedHashSet lotto = new LinkedHashSet();

		lotto.add(Object e)메서드에 매개변수는 Object이고, 모든 자료형 타입을 다 넣을 수 있기 때문에 		
		
		String lotto.add("홍길동"); 	// String
		double lotto.add(3.14); 	// double
		boolean lotto.add(true);	 // boolean
		lotto.add('A'); 				 // char
		lotto.add(100L);				 // long
		lotto.add(new Student()); // Student 클래스	
		
		모든 자료형을 다 넣을 수 있지만 내가 원하는 값을 얻어오려고 할 때 get 함수를 쓰려고 하니
	
		lotto.get(0); ----- get함수가 없다!
		lotto는 LinkedHashSet 으로 set 계열이기 때문에 순서가 없다. 
		그래서 0번째에 해당하는 순서값을 가져오는 것은 불가능하기 때문에 get 함수가 없다
		
		값을 얻어오는 get 메서드도 없는데 매개변수가 Object형이기 때문에
	  	Object -> 각 자료형별로 다운캐스팅 형변환을 해야 사용할 수 있다.
	  	
	  	LinkedHashSet<Integer> lotto = new LinkedHashSet<Integer>();  	
	  	컬렉션 클래스 LinkedHashSet에 요소로 정수만을 집어 넣겠다는 의도로 <Integer> ---> 이것이 제네릭!
	
		*/
		
		
		//로또 게임 
		//중복허용하지 않는 컬렉션 클래스 set 계열 사용 hashset이나 linkedhashset
		
		int n = 5; //로또 게임 횟수
		
		ArrayList<LinkedHashSet<Integer>> lottos = new ArrayList<LinkedHashSet<Integer>>();
		//ArrayList 안에 요소로 <6개의 로또 번호를 가지고 있는 LinkedHashSet lotto 객체>를 순차적으로 담을 객체 lottos 생성 
		
		LinkedHashSet<Integer> lotto = null;	//반복 횟수 따라서 생성하려고 null값 줌
		//  LinkedHashSet에 Integer만 넣겠다는 뜻 	//제네릭 쓸때는 기본형int는 못씀! 항상 class타입만 가능 ----- 기억해두기
		
		int lottoNumber = -1;
		
		for (int i = 0; i < n; i++) {
			lotto = new LinkedHashSet<Integer>(6); //lotto는 게임 횟수만큼 만들어져야함. 초기용량 6 (초기용량 안잡아도 됨 6개만 잡고 빠져나올것임)		
			while ( lotto.size()<6 ) { 
				lottoNumber  = (int) (Math.random()*45)+1;
				lotto.add(lottoNumber);//제네릭으로 Integer값만 집어넣기로 해놨기 때문에 다른 자료형은 add 안됨.
			}//while		
		lottos.add(lotto); // while문으로 6개의 번호 생성 후에 번호를 가진 lotto 객체를 ArrayList 객체에 add한다. 
		} // for
		
		
		//출력 (반복처리 작업에 Iterator 사용)
		Iterator<LinkedHashSet<Integer>> ir = lottos.iterator(); //반복자 선언 (LinkedHashSet 객체를 가지고 있는)
		int no = 1;
		while (ir.hasNext()) {
			//LinkedHashSet<java.lang.Integer> lotto = (LinkedHashSet<java.lang.Integer>) ir.next();
			lotto = ir.next(); //위 코딩을 생략할 부분들은 지우고 lotto로 수정 //다운캐스팅 부분은 필요 없음 이미 안에 있는 것을 알고 있기 때문에
			
			Iterator<Integer> ir2 = lotto.iterator();
			//ArrayList 안에 있는 요소는 LinkedHashSet.
			//그 LinkedHashSet 안에 있는 하나하나의 요소를 가져오려면 또 반복자를 사용
			
			System.out.printf("%d게임 : ", no++); //게임횟수로 활용할것이 없으므로 변수 새로 선언
			while (ir2.hasNext()) {// while문 안에는 로또 번호가 있음
				//Integer integer = (Integer) ir2.next();
				lottoNumber = ir2.next(); 
				//lottoNumber는 int 이고 ir2는 Integer이다 
				//Integer가 기본형 int로 변환 됨 (: 래퍼클래스가 자동으로 변환됨. ===> 오토 언박싱)
				System.out.printf("[%02d]", lottoNumber);
			}//while
			System.out.println();
		}//while
		
	}//main

}//class
