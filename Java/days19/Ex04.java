package days19;

import java.util.StringTokenizer;

public class Ex04 {

	public static void main(String[] args) {
		//StringTokenizer 클래스
		String str = "고경림,김성준,김정주,김호영";
		//String [] = str.split(regex);
		
		StringTokenizer st = new StringTokenizer(str,","); //str 문자열을 ,로 자름 자른것을 토큰이라고 함
		//System.out.println(st.countTokens());//4
		
		/*
		System.out.println(st.nextToken());
		System.out.println(st.nextToken());
		System.out.println(st.nextToken());
		System.out.println(st.nextToken());
		System.out.println(st.nextToken());//java.util.NoSuchElementException 토큰이 없는데 더 가져오려고 해서 예외 발생
		*/
		
		/*
		//nextToken이 가져온 토큰을 제거해버려서 countTokens()  계속 변함
		int countToken = st.countTokens();
		for (int i = 0; i <countToken; i++) {
			System.out.println(st.nextToken());
		} // for
		*/
		
		
		while (st.hasMoreTokens()) { //가져올 토큰이 더 있는지 물어보는 //true, false //위에꺼보다 이 코딩을 더 많이 씀
			System.out.println(st.nextToken());
		}
	}

}
