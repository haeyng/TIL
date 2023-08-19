package days07;

public class Ex07 {

	public static void main(String[] args) {
		
		//1. 1/2+2/3+3/4+.....8/9+9/10=??
		
		//[1]
		//분자 1 2 3 4...9   i
		//분모 2 3 4 5...10 i+1
		double sum = 0;
		for (int i = 1; i <=9; i++) {
			sum+=(double)i/(i+1);
			System.out.printf("%d/%d+",i,i+1);
		} // for
		System.out.printf("=%f\n",sum);		
		
		
		//2. 20개 항 까지의 합을 구해서 출력
		//2. 1+2+4+7+...+191 = ??? 규칙적인 수열
		//      1 2  3   4   5 6 
		//[2] https://terms.naver.com/entry.naver?docId=3338127&cid=47324&categoryId=47324
		
		
		
		
	}//main

}//class
