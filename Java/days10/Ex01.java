package days10;

import java.util.Arrays;

public class Ex01 {

	public static void main(String[] args) {
		int n = 125; //0x7D  10->0x0A
		
		//0123456789A(10)BCDEF(15)
		int share, reminder ; //몫, 나머지 변수
		
						   //0   1  2  3  4  5
		char [] ch = {'a','b','c','d','e','f'};
		
		String s = "";
		char one;
		
		
		while (n!=0) {
			share = n/16;
			reminder = n%16;
			
//			if(reminder >=10) System.out.println(ch[reminder-10]);
//			else System.out.println(reminder);
			
			if(reminder>=10) one = ch[reminder-10];
			else 					one = (char)(reminder+'0');//7->'7'
			
			s = one+s;
			
			n = share;
		}
		//System.out.println(s);
		System.out.printf("0x%s",s);
	}
}
