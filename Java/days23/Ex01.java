package days23;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;

public class Ex01 {

	public static void main(String[] args) {

		//로또 게임 
		//중복허용하지 않는 컬렉션 클래스 set 계열 사용 hashset이나 linkedhashset
		
		int n = 5; //로또 게임 횟수
		
		ArrayList<LinkedHashSet<Integer>> lottos = new ArrayList<LinkedHashSet<Integer>>();
		LinkedHashSet<Integer> lotto = null;//반복 횟수따라서 생성하려고 null값 줌
		//  LinkedHashSet에 Integer만 넣겠다는 뜻 //제네릭에는 기본형int는 못씀! 항상 class타입만 가능
		
		int lottoNumber = -1;
		for (int i = 0; i < n; i++) {
			lotto = new LinkedHashSet<>(6); //초기용량6 <Integer> 생략
			while ( lotto.size()<6 ) {
				lottoNumber  = (int) (Math.random()*45)+1;
				lotto.add(lottoNumber);
			}//while
		lottos.add(lotto);
		} // for
		
		//출력
		Iterator<LinkedHashSet<Integer>> ir = lottos.iterator();
		int no = 1;
		while (ir.hasNext()) {
			lotto = ir.next(); //다운캐스팅 필요없음
			Iterator<Integer> ir2 = lotto.iterator();
			System.out.printf("%d게임 : ", no++);
			while (ir2.hasNext()) {
				//Integer - > int 오토 언박싱
				lottoNumber = ir2.next();
				System.out.printf("[%02d]", lottoNumber);

			}//while
			System.out.println();
		}//while
		

	}//main

}//class
