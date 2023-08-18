package days03;

/**
 * @author 송해영
 * @date 2023. 7. 17.-오후 2:26:37
 * @subject 단항연산자 ++ -- + - ~(비트부정연산자) ! (cast) 등등
 *                (다른연산자보다 우선순위가 높음) 
 * @content
 */
public class Ex05_05 {

	public static void main(String[] args) {
		System.out.println(+3); // 양수
		System.out.println(-3);  //부호비트로 음수
		
		//비트부정(틸드)연산자 0->1 / 1->0   0 부정하면 1 / 1 부정하면 0
		System.out.println(~5); // -6  
		//                    0000 0101 를 부정하면 아래
		//                    1111 1010 계산하면 -6
		//                   -             1
		// 1을 뺀다         1111 1001
		// 1의 보수처리    0000 0110 계산하면 6
		//        절대치 취한게 10진수 = 6 이니까 -6이 나온다
		
		// [-10 음수 저장 방법 ? 2의 보수법]
		//
		
	}//main

}//class
