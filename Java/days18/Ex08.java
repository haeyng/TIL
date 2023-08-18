package days18;

/**
 * @author 송해영
 * @date 2023. 8. 7. - 오후 12:46:03
 * @subject
 * @content
 */
public class Ex08 {

	public static void main(String[] args) {
		//문자열 다루는 클래스
		//String : 변경 불가능한 클래스.***중요! // 객체가 없어지고 홍길동님 인스턴스가 heap영역에 새로 만들어짐
		//StringBuffer
		//StringBuilder
		//StringTokenizer

	
		String name = "홍길동";//new String("홍길동"); "홍길동" 문자열이지만 heap영역에 올라간 주소값임
		name += "님"; //같은 주소 참조
		name +=" 안녕!!";
		//객체가 3개 만들어짐
		
		System.out.println(name); //홍길동님 안녕!!
		
		
		//1.
		System.out.println(name.length()); //문자열 길이 9
		
		//2.  name.length       필드
		//2.  name.length()    메서드
		
		for (int i = 0; i < name.length(); i++) { //문자열 가져오는것은 메서드로 ()괄호가 있어야함
			System.out.printf("name[%d]='%c'\n",i,name.charAt(i));
		} // for
		
		
		//3.
		String rrn = "890223-1700001";
		System.out.println(rrn.substring(rrn.length()-1)); //끝자리 1 출력 //"1" 문자열 출력

		
		System.out.println(rrn.substring(7));//1700001
		
		//behinIndex<=     < endIndex
		System.out.println(rrn.substring(0,2));//89
		
		
		//4. 입력값에 대한 유효성검사할때 정규식 패턴 일치여부 체크 : String.matches()
		String regex = "\\d{6}-\\d{7}";
		System.out.println(rrn.matches(regex));//true
		
		
		//5. concat()
		
		String a = "ㅁㅁㅁ" + "ㅠㅠㅠ" + "xxx";
		
		String b = "ㅁㅁㅁ".concat("ㅠㅠㅠ").concat("xxx"); //.으로 연결 체이닝?
	
		
		//6.
		//Stream rrn.chars();
		
	
		//7. int 0을 돌려주면 동일한 문자열이다
		//System.out.println("kenik".compareTo("kenik"));
		
		//System.out.println("kEnik".compareTo("kenik")); //-32
		
		System.out.println("kenik".compareTo("kEnik")); //32
		
		System.out.println("kenik".compareToIgnoreCase("kEnik"));
		
		//"a"97 "A"65 32
		//음수인지 양수인지에 따라서 같은지 여부, 누가 먼저 나오는지 확인 가능함
		
		
		//8. true, false
		System.out.println("kenik".equals("kEnik")); //false
		//이 자체가 if문 조건식이 되기 때문에 같다 여부를 가지고 어떤일을 할때 compareTo보다 적합함
		
		System.out.println("kenik".equalsIgnoreCase("kEnik"));
		
		
		//9.
	    boolean result = "안녕하세요. 홍길동입니다.".contains("김길동");// 문자열속에 어떤 특정한 문자열이 포함되어 있는지 boolean형으로 돌려줌
		System.out.println(result); //false
		
		
		//10. 자주 쓰임
		String url = "http://www.naver.com/test.jsp";  //이 주소가 .jsp로 끝나는지?
		String suffix = ".jsp"; //접미사
		String prefix = "http://"; //접두사
		System.out.println(url.endsWith(suffix)); //true
		System.out.println(url.startsWith(prefix)); //true
		
		
		
		//11. Ex08_03
		
		
		
		
	}//main

}//class
