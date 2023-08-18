package days11;

import java.util.stream.IntStream;

public class Ex01_02 {

	public static void main(String[] args) {
		
		int [] m = { 3, 92, 3, 40, 71, 91, 61, 92, 76, 71, 59, 54, 64, 48, 66, 92, 25, 20, 73, 37 };

		int max = IntStream.of(m).max().getAsInt();
		System.out.printf("max=%d\n", max);
		
		/*
		//공간을 갯수만큼 잡으려면? 첫번째
		int maxCount = 0;
		for (int i = 0; i < m.length; i++) {
			if (m[i]==max) maxCount++;
		} // for
		System.out.println("maxCount = " + maxCount);
			
		int [] maxIndexArr = new int [maxCount]; 
		*/
		//공간을 갯수만큼 잡으려면? 두번째
		int maxCount = (int) IntStream.of(m).filter(i->i==max).count();
		System.out.println("maxCount = " + maxCount);
		int [] maxIndexArr = new int [maxCount]; 
		
	}//main
}//class

