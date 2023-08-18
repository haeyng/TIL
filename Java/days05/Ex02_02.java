package days05;

public class Ex02_02 {

	public static void main(String[] args) {
		//"a" -> 'a'    "a" -> "a".charAt(0) 첫번째 문자를 가져온다는뜻

		//char -> String 변환하는 방법
		//첫번째) 'a' + ""
		//두번째)String.valueOf('a');
		//세번째)Character.toString('a');
		
		//String -> char 바꾸고 싶을때
		String name = "kenik";
		//"kenik" 여기서 원하는 위치의 한 문자를 얻어 오고 싶을 때의 함수
		// char 문자열.charAt(index)         
		      //index는 위치값 
		      //매개변수는 문자열 속에서 원하는 문자가 있는 위치가 몇번째인지 index값
		      //리턴값은 char
		
//		System.out.println(name.charAt(0));   //k
//		System.out.println(name.charAt(1));   //e
//		System.out.println(name.charAt(2));   //n
//		System.out.println(name.charAt(3));   //i
//		System.out.println(name.charAt(4));   //k
		//이 반복 작업을 for 돌려서 나타내보기
		
		//for (int i = 0; i < 5; i++) { //i는 index값이라고 생각
		//for (int i = 0; i < 문자열 길이까지; i++) { 
		for (int i = 0; i < name.length(); i++) { 
			//5 대신 이렇게 하면 문자열이 길어도 편하게 가져올수있음 
			//-> 문자열 길이를 가져오는 코딩이 필요! name.length()
			//System.out.println(name.length()); 문자열 길이값이 출력됨
			
			System.out.println(name.charAt(i));
		} //for

		
		int len = name.length();
		for (int i = 0; i < len; i++) { 		 
			//문자열 길이를 얻어오는 것을 for문을 돌때마다 얻어오기 때문에 변수로 바꿔주면 위에 보다 좋은 코딩이 됨	
			System.out.println(name.charAt(i));
		} //for
		
		
		
		//문자열을 다루는 메서드(함수) 기억하기
		// 1. split()
		// 2. length()
		// 3. charAt()
		// 4. valueOf()
		// 5. toString()
	    // 6. toCharArray() 문자열을 char 배열로 반환하는 함수
		// 7. matches()
		
		
	}//main
}//class
