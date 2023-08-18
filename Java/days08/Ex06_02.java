package days08;
/**
 * @author 송해영
 * @date 2023. 7. 24.-오후 12:20:57
 * @subject
 * @content
 */
public class Ex06_02 {

	public static void main(String[] args) {

		//1~n까지의 합 일반함수
		int n = 10;
		int result = sum(n);
		System.out.printf("1~%d=%d\n",n,result);

		//1~n까지의 합을 구하는 재귀 함수 만들기 - 시험

		result = reculsiveSum(n);
		System.out.printf("1~%d=%d\n",n,result);

	}//main

	//10분 *10 = 100분 재귀함수 사용안함    /     트리구조 - 검색할때 사용
	//			10분

	// 10 + recursiveSum(9)
	//      9+ recursiveSum(8)
	//          8+recursiveSum(7)
	//            7+recursiveSum(6)
	//                 2+recursiveSum(1)
	//                           1
	//return 10+9+8+...2+1
	//재귀함수
	private static int reculsiveSum(int n) {
		if (n==1) return n;
		else 		  return n + reculsiveSum(n-1);
	}

	//1~n까지의 합 일반함수
	private static int sum(int n) {
		int result = 0;
		for (int i = 1; i <= n; i++) {
			result +=i;
		} // for
		return result;
	}
}//class
