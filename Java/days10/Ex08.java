package days10;

import java.util.Arrays;
import java.util.stream.IntStream;

public class Ex08 {

	public static void main(String[] args) {
		
		//max 최고값 얼마이고, 인덱스값이 몇번째인지 출력?
		int [] score = new int [20];
		//0~100 임의의 수로 채우고
		for (int i = 0; i < score.length; i++) {
			score[i]=(int)(Math.random()*101);
		} // for
		System.out.println(Arrays.toString(score));
		int max, min;
		
		//출력.
		min = max = score[0];
		
		int sum = score[0];
		for (int i = 1; i < score.length; i++) {
			if (max<score[i])  max = score[i];
			else if (min>score[i]) min = score[i];
			
			sum+=score[i];
		} // for
		System.out.println("max : " + max);
		System.out.println("max : " + min);
		System.out.println("sum : " + sum);
		// avg = (double)sum/score.length
		
		//람다식과 스트림
		max =IntStream.of(score).max().getAsInt();
		min =IntStream.of(score).min().getAsInt();
		sum =IntStream.of(score).sum();
		double avg =IntStream.of(score).average().getAsDouble();
		
	}//main

}//class
