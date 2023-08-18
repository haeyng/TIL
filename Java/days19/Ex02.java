package days19;

import java.util.Arrays;

public class Ex02 {

	public static void main(String[] args) {

//		my_str	n	result
//		"abc1Addfggg4556b"	6	["abc1Ad", "dfggg4", "556b"]
//		"abcdef123"	3	["abc", "def", "123"]
		
		String my_str = "abc1Addfggg4556b";
		int n = 6;
		
		String [] answer = Solution.solution(my_str, n);
		System.out.println(Arrays.toString(answer));
		
	}//main

}//class


class Solution {
    public static String[] solution(String my_str, int n) {
        
    	int answerLength = (int) Math.ceil ((double) my_str.length() / n ); //2.xxxx 나머지 올림 2일때는 2 //Math.ceil 는 double이 리턴값이라 int로 형변환해야됨
    	
    	String[] answer = new String [answerLength];
    	
    	int beginIndex =0, endIndex;
    	String str=null; //잘라온 문자열
    	int my_strLength = my_str.length();
    	int index = 0;
    	
    	/*
    	String a = my_str.substring(0, 6);
    	System.out.println(a);
    	
    	a = my_str.substring(6, 12);
    	System.out.println(a);
    	
    	a = my_str.substring(12,16); // java.lang.StringIndexOutOfBoundsException: begin 12, end 18, length 16 : 범위 벗어남
    	System.out.println(a);
    	 */
    	
    	while (index!=answerLength) { //조건.. 
    		endIndex = beginIndex + n;
			if(endIndex>my_strLength) endIndex = my_strLength;
    		str = my_str.substring(beginIndex,endIndex);
    		beginIndex = endIndex;
    		answer[index++] = str;
    	}
    	return answer;
    	
    	/* 더 나은 코딩
    	int i = 0, idx = 0;
    	try {
    	   for (             ; i < my_strLength ; i+=n, idx++) {
    	       answer[idx] =   my_str.substring(i, i+n );
    	     } 
    	} catch (Exception e) {
    	   answer[idx] =   my_str.substring(i);
    	}
    	*/
    }
}






