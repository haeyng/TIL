package days06;

public class Ex031 {

	public static void main(String[] args) {

		//Ex03 코딩 보기쉽게 정리한것
		
		for (int i = 'A', count = 1, line = 1; i <= 'z'; i++) {
			
			if('Z'<i&&i<'a') continue;
	
			if (count%10==1) System.out.printf("%d : ",line++);
			
			System.out.printf("%1$c(%1$03d)",i);

			if(count%10==0) System.out.println();
				count++;
				
			if (i=='Z') {System.out.println();
			count = 1;}
			
		} //for		
	}//main
}//class