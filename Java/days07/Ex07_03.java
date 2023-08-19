package days07;

import java.util.Iterator;
import java.util.stream.IntStream;

public class Ex07_03 {

	public static void main(String[] args) {
		//[문제] 피보나치 수열
		//항이 100보다 같거나 작을때까지의 수열을 출력하고
		//합을 구해서 출력
		//1+1+2+3+5+8+13+21+34... 항 = ?
		//  
		
		
		/*[1]
		int [] p = new int[1000]; //나중에 ArrayList 컬렉션 클래스 
		p[0] = p[0] = 1;
		//[1][1][2][][][][][89][xxx][][]
		int index =2;
		while (true) {
			//p[index] = p[index-1] + p[index-2]
			int term = p[index-1] + p[index-2];
			if (term>100) break;
			p[index] = term;
			index++;
		}
		System.out.println(Arrays.toString(p));
		System.out.println(index-1);
		
		// JDK 1.8 람다식과 스트림
		int sum = IntStream.of(p).sum();
		System.out.println(sum);
		*/
		
		//[2]
		//첫번째항 1 (토끼 암)
		//두번째항 1 (토끼 수)
		
		/*기억해두기
		int firstTerm = 1;
		int secondTerm = 1;
		int nextTerm;
		int sum = firstTerm + secondTerm;
		System.out.printf("%d+%d+",firstTerm,secondTerm);
		//f   s
		//    
		//    f   s
		//1+1+2+nextTerm
		
		while (true) {
			nextTerm = firstTerm + secondTerm;
			if(nextTerm >100) break;
			System.out.printf("%d+",nextTerm);
			sum += nextTerm;
			firstTerm = secondTerm;
			secondTerm = nextTerm;
		}//while
		System.out.printf("=%d\n",sum);
		*/
		
		
		//[]
		int firstTerm = 1;
		int secondTerm = 1;
		int nextTerm;
		int sum = firstTerm + secondTerm;

		while ((nextTerm = firstTerm + secondTerm)<=100) {		
			System.out.printf("%d+",nextTerm);
			sum += nextTerm;
			firstTerm = secondTerm;
			secondTerm = nextTerm;
		}//while
		System.out.printf("=%d\n",sum);
		
		
		
	}//main

}//class
