package days24;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 2:35:27
 * @subject 제네릭스, 어노테이션, 열거형, 자바 IO, 스레드 + 네트워크, 람다식과 스트림
 * @content
 */
public class Ex07 {

	public static void main(String[] args) {

		/*
		 * [제네릭(Generics)]
		 * 		1. jdk 1.5 - 제네릭
		 * 			jdk 1.8 - 람다식
		 * 		2. 제네릭이란?
		 * 			*다양한 타입*의 객체를 다루는 메서드, 컬렉션 클래스에서 *컴파일할 때* 타입을 체크해 주는 기능. 
		 * 		3. 왜 컴파일 될때 타입을 체크하는지? 
		 * 			객체 타입을 컴파일 시에 체크하기 때문에 
		 * 			1)객체의 타입 안정성을 높이고, 
		 * 			2)형 변환의 번거로움이 줄어든다. 
		 * 			==> 코드가 간결해진다. <<제네릭의 장점>>
		 * 		
		 * 		
		 * 
		 * */
		
		/*
		ArrayList list = new ArrayList(); 
		//제네릭을 사용하지 않으면 데이터를 집어넣고 난 다음에 사용할때마다 형변환 작업을 꼭 해줘야되서 번거로움

		list.add("홍길동");
		//String <- Object get()  다운캐스팅(형변환) 
		String name = (String) list.get(0);
		System.out.println(name);

		list.add(20);//ArrayList에 이름을 넣을건데 int 나이가 들어가져서 데이터의 안정성이 떨어짐
		//int <-Integer <-Object 
		int age = (int) list.get(1);
		System.out.println(age);
		
		
		list.add(true);
		list.add('a');
		*/
		
		
		
		//            제네릭 클래스 < > 
		ArrayList<String> list = new ArrayList<>();
		list.add("홍길동");
		list.add("김정주");
		list.add("이지현");
		list.add("김호영");
		//list.add(20); //<String> 이면 맞는 데이터만 입력 가능 안맞는거 넣으면 오류남
		
		String name =list.get(0); // 다운캐스팅 할 필요가 없음
		System.out.println(name);
		
		/*
		Iterator ir = list.iterator(); //제네릭을 쓰지 않으면
		while (ir.hasNext()) {
			String name = (String) ir.next(); //제네릭을 쓰지 않으면 반드시 String으로 다운캐스팅해서 출력해야됨
			System.out.println(name)
		}
		*/
		
		Iterator <String> ir = list.iterator();
		while (ir.hasNext()) {
			String name2 = ir.next();//제네릭을 사용하면 다운캐스팅 필요없음
			System.out.println(name2);		
		}
		
		
		
		
		
		
		
		
	}//main

}//class
