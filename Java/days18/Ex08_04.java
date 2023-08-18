package days18;
/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 3:46:04
 * @subject
 * @content
 */
public class Ex08_04 {

	public static void main(String[] args) {
		
		String s = "안녕하세요. 홍길동입니다. 홍길도이고, 홍길둥입니다. 홍길.입니다.";
		
		//"홍길동" -> "hong.gildong" 으로 변경하고 싶음
		
		//첫번째 인자값은 String regex 정규표현식
		//s = s.replaceFirst("홍길동", "hong.gildong"); //첫번째 홍길동과 일치하는것을 바꿈
		//s = s.replaceAll("홍길동", "hong.gildong"); //모든 홍길동과 일치하는것을 바꿈
		
		//s = s.replaceAll("홍길.", "hong.gildong"); // . 은 모든 한문자를 뜻함
		//s = s.replaceAll("홍길\\.", "hong.gildong"); // \\. 해야 .을 나타내는것
		//s = s.replaceAll("홍길[가-힣]", "hong.gildong");

		//s = s.replace('홍', '강');
		
		//CharSequence target = "홍길동"; //업캐스팅
		CharSequence target = new StringBuffer("홍길동"); //자식으로 구현된 stringBuffer 객체 넣어도 됨. 
		s = s.replace(target, "XYZ");

		//s = s.replace("홍길도", "XYZ");
		System.out.println(s);
		

		
		
	}//main

}//class
