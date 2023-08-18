package days16;
/**
 * @author 송해영
 * @date 2023. 8. 3. - 오후 3:09:14
 * @subject
 * @content
 */
public class Ex11_02 {

	public static void main(String[] args) {

		//인터페이스 안의 static 메서드 호출
		//Parseable.method1();
		
		String parsingFile = "hello.xml";
		String docType = "xml";
		
		//인터페이스 (다형성) XMLPaser, HTML parser 중에 뭐가 넘어올지..
		Parseable parser =  ParserManager.getParser(docType);
		parser.parse(parsingFile);
		
		// 5년 지난 후에 파싱 + 출력(인쇄) 기능을 하고 싶음
		parser.print();
		
		
	}//main

}//class

interface Parseable{
	//구문분석
	void parse(String fileName);
	
	//인쇄하는 함수
	default void print() {
		System.out.println("각각의 parser에서 각자의 인쇄기능 구현");
	};

	//static 메서드
	static void method1() {
		System.out.println("기본 코딩.");
	}

}

class XMLParser implements Parseable{

	@Override
	public void parse(String fileName) {
		System.out.println(">XML 파일 구문 분석 코딩");
	}
	
}
class HTMLParser implements Parseable{

	@Override
	public void parse(String fileName) {
		System.out.println(">HTML 파일 구문 분석 코딩");
		
	}
	
}

class ParserManager{
	
	//           아래 parseable은 리턴 자료형 인터페이스 다형성
	public static Parseable getParser(String docType) {
		if (docType.equals("xml")) {
			return new XMLParser();
		} else if(docType.equals("html")){
			return new HTMLParser();
		}else {
			return null;
		}
	}
}








