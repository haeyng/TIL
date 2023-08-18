package days10;

import java.util.Arrays;

public class Ex01_03 {

	public static void main(String[] args) {
		int n = 125; //0x7D  10->0x0A
		
		//0123456789A(10)BCDEF(15)
		int share, reminder ; //몫, 나머지 변수
		
		//            0    1    2    3    4     5 
		String hex = "0123456789ABCDEF";
		StringBuilder sb = new StringBuilder();
		
		
		while (n!=0) {
			share = n/16;
			reminder = n%16;
			sb.append(hex.charAt(reminder));
			n = share;
		}
		System.out.printf("0x%s",sb.reverse());
	}
}
