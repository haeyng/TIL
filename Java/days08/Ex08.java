package days08;
/**
 * @author 송해영
 * @date 2023. 7. 24.-오후 2:13:30
 * @subject 재귀함수
 * @content
 */
public class Ex08 {

	public static void main(String[] args) {
			//2^3=2*2*2 = 8
			//2^-3= 1/(2^3) = 1/8 = 0.125
			//[거듭제곱] == 누승 ==  멱 == pow
			//밑수(2)를 지수(3)만큼 반복해서 곱하는 것.
		
			//일반함수
			double result = recursivePow(2,3);
			//double result = pow(2,3); //0.125 //double 변경
			//double result = pow(2,-3); //0.125 //double 변경
			System.out.println(result);
			//재귀함수
	}//main
	
	//누승(거듭제곱)을 구하는 재귀함수                                  암기!
	//2^-3
	//1/(2*2*recursivePow(2,1)     1/2*2*2
	private static double recursivePow(int n, int m) { 
		
		if (m>1) return n*recursivePow(n,m-1);
		else if(m==1) return n;
		else if(m==0) return 1;
		else return (double)1/(recursivePow(n,-1*m)); 
		
	}
		
	//일반함수
	//2^3 = 2*2*2
	//2^-3 = 1/(2^3) = 1/(2*2*2) = 0.125
	private static double pow(int n, int m) { //(밑수,지수)   //double 변경
		double result = 1; // 0.125 실수라 double로 변경
		
		int exp = Math.abs(m); //밑코딩을 변경함 절대값을 반환하는 함수
		//if(m<0) exp = -1*m; // m을 양수로 만들기(부호변경)
		
		for (int i = 1; i <=exp; i++) {
			result *= n;
		} // for
		
		if(m<0) return (double)1/result;  //강제형변환(double)
		else return result;
	}
}//class