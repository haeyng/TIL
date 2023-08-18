package days09;

public class Ex03_04{

	public static void main(String[] args) {
	
		String rrn = "940314-2122451";
		boolean checkSum = checkRRN(rrn);
		if (checkSum) {
			System.out.println("올바른 주민번호");
		}else {
			System.out.println("잘못된 주민번호");
		}//if
		
	}//main

	private static boolean checkRRN(String rrn) {
	
		int total = 0;
		int [ ] m = {2,3,4,5,6,7,0,8,9,2,3,4,5};
		for (int i = 0; i <= 12; i++) {
			total += (rrn.charAt(i) - '0')*m[i];
			
		} // for
		
		/*
		int ㄱ = rrn.charAt(0) - '0'; //'9' ->9
		int ㄴ = rrn.charAt(1) - '0';
		int ㄷ = rrn.charAt(2) - '0';
		int ㄹ = rrn.charAt(3) - '0';
		int ㅁ = rrn.charAt(4) - '0';
		int ㅂ = rrn.charAt(5) - '0';
		int ㅅ = rrn.charAt(7) - '0';
		int ㅇ = rrn.charAt(8) - '0';
		int ㅈ = rrn.charAt(9) - '0';
		int ㅊ= rrn.charAt(10) - '0';
		int ㅋ= rrn.charAt(11) - '0';
		int ㅌ= rrn.charAt(12) - '0';
		
		total = ㄱ*2+ㄴ*3+ㄷ*4+ㄹ*5+ㅁ*6+ㅂ*7+ㅅ*8+ㅇ*9+ㅈ*2+ㅊ*3+ㅋ*4+ㅊ*5;
		*/
		
		  int check = (11 - total % 11)%10;
//	     check %= 10;   // 11->1, 10->0
//	      else if( check==11) check=1;
	      
	      int ㅍ = rrn.charAt(13) - '0';
	      
	      return ㅍ == check;

		
	
	}//main

}
