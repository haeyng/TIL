package days18;

public class Ex09_02 {

	public static void main(String[] args) {

   
//		StringBuffer sb = new StringBuffer("SELECT ");
//		sb.append("a.ano");
//		sb.append("");
		
		String s = "안녕하세요. 홍길동입니다. 홍길동입니다. 홍길동입니다.";
		//두번째 "홍길동" 문자열을 찾아서 "XYZ"로 수정하려고 함
		
//		int index =15;
//		s = s.substring(0,15) + "XYZ" + s.substring(18);
//		System.out.println(s);//안녕하세요. 홍길동입니다. XYZ입니다. 홍길동입니다.
		
		StringBuffer sb = new StringBuffer(s);
		//System.out.println(sb.toString());
		//StringBuilder sb = new StringBuilder(s);
		
		
		int index = sb.indexOf("홍길동", 0);
		index = sb.indexOf("홍길동", index + 3);
		//System.out.println(index);
		
		sb.delete(15, 18);
		
		sb.insert(index, "XYZ");
		
		System.out.println(sb);

		//builder나 buffer 사용법은 똑같음
		//
		
	}//main

}//class
