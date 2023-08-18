package days15;

import java.util.Arrays;

public class Ex01 {

	public static void main(String[] args) {

//		  [취업 문제] ego(자아)
		  String n = "keNik";   
		  String m= "kKnie";   
//		  
//		  위의 두 문자열 n, m 이 알파벳과 알파벳갯수가 똑같은지 비교하는 코딩 
//		  결과는 같을 경우 true/ 다를 경우 false 로 출력.
//		  조건) 대소문자는 구분하지 않는다.  
		  
		  char [] nArr = n.toUpperCase().toCharArray();
		  Arrays.sort(nArr);
		  char [] mArr = m.toUpperCase().toCharArray();
		  Arrays.sort(mArr);
		  n = String.valueOf(nArr);
		  m = String.valueOf(mArr);
		  
		  /*
		  System.out.println(n+"/"+m);
		  
		  n=n.toUpperCase();
		  m=m.toUpperCase();
		  //정렬 KENIK -> EIKKN
		  char [] nArr =  n.toCharArray();
		  Arrays.sort(nArr);
		  System.out.println(Arrays.toString(nArr));
		  
		  char [] mArr =  m.toCharArray();
		  Arrays.sort(mArr);
		  System.out.println(Arrays.toString(mArr));
		  
		  //char [] - > String n, m
		  n = String.valueOf(nArr);
		  m = String.valueOf(mArr);
		  
		  System.out.println(n+"/"+m);
		  */
		  System.out.println(n.equals(m));
		
	}//main

}//class
