package days05;
/**
 *@author 송해영
 *@date 2023. 7. 22.-오후 9:12:25
 *@subject 문자열을 char 배열로 변환
 *@content
 */
public class Ex02_03 {

	public static void main(String[] args) {
		
		/*
		//[1] 직접 배열 선언 후 for문 사용해서 직접 처리한것. -> 이 처리를 하는 매서드가 존재함 [2]번 설명 확인
		String name = "kenik";
		// String  -> char[] 변환 ->char 배열[] (=배열의 [0] 값) 
		char [] nameArr = new char[name.length()]; //문자열 길이만큼 배열크기.
		//[k][e][n][i][k]
		for (int i = 0; i < nameArr.length; i++) {
			nameArr[i] = name.charAt(i);
			//i가 0이면 0번째 값이니까 nameArr배열의 0번째 공간 값인 k
			//i가 1이면 1번째 값이니까 nameArr배열의 1번째 공간 값인 e
		} // for
		
		//nameArr[0]   'k'
		//nameArr[1]   'e'
		//nameArr[2]   'n'
		//nameArr[3]   'i'
		//nameArr[4]   'k'
		 */
		 
		
		
		//[2]
		String name = "kenik";
		//문자열을 char 배열로 변환 시킬것
		char [] nameArr = name.toCharArray(); //문자열을 자동으로 배열로 만들어서 채워줌
		System.out.println(nameArr[0]); //0번째 공간에 k
		
	}//main
}//class
