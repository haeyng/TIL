package days09;

import java.util.Arrays;

public class Ex02 {

	public static void main(String[] args) {

//		6. 정수를 입력받아서 2진수로 출력하는 코딩을 하세요. 
//	    10 => 00000000000000000000000000001010
		
		int n = 10;
		int count = 0;
		int unit =2;
		
		//[3] 제어문 활용.
//	     2 10
//		   몫5 ---- 나머지0
//		   몫2 -----나머지1
//		   몫1 -----나머지0
//		   몫0 -----나머지1

		int share, reminder ; //몫, 나머지 변수
		String s = "";
		
		int [] binaryArr = new int [32];
		int index = binaryArr.length-1;  //31;
		
		
		while (n!=0) { // n>0 
			share = n /2 ;
			reminder = n %2 ;
			System.out.println(reminder);
			binaryArr[index--] = reminder; //한칸앞으로 땡김
			s+=reminder; //누적
			n = share; 
		}
		//System.out.println(s); //"1010" -> "0101"
		System.out.println(Arrays.toString(binaryArr).replace(", ",""));
		
		// String, StringBuilder, StringBuffer 문자열 다루는 클래스
		// StringBuilder sb= new StringBuilder();
		// sb.reverse()
		
		/*
		share = n /2 ;
		reminder = n %2 ;
		System.out.println(reminder);
		n = share; 

		share = n /2 ; //2
		reminder = n %2 ; //1
		System.out.println(reminder);
		n = share; 
		
		share = n /2 ; //1
		reminder = n %2 ; //0
		System.out.println(reminder);
		n = share; 
		
		share = n /2 ; //0
		reminder = n %2 ; //1
		System.out.println(reminder);
		n = share; 
		*/
		
			
		
		/*[2]
		String b = Integer.toBinaryString(n);
		System.out.println(b);
		//문자열 1010 -> 숫자 1010변환
		String s = String.format("%032d\n", Integer.parseInt(b) );
		System.out.println( s );
		*/
		
		
		/*
		//System.out.printf("%032d\n",Integer.parseInt(b));//다른데서 쓰려면 아래처럼 변경
		String s = String.format("%032d\n",Integer.parseInt(b));
		System.out.println(s);
		*/
		
		/* [1]
		//                          "1010"
		//System.out.println( Integer.toBinaryString(n) );
		
		String s = "00000000000000000000000000000000";
		String b = Integer.toBinaryString(n); 
		s += b;
		System.out.println(s);
		
		// 오버로딩 , 중복함수
		// s.substring(beginIndex);
		// s.substring(beginIndex, endIndex);
		
		System.out.println(s.substring( b.length() ));
		*/
		
		
	}//main
}//class
