package days22;

import java.util.Stack;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오후 2:42:39
 * @subject
 * @content
 */
public class Ex09 {

	public static void main(String[] args) {

		//ArrayList
		//Vector
		//LinkedList
		//스택(Stack)과 큐(Queue)
		//		스택 요소가 1부터 시작
		//    	     ──────┐
		// →    C  B  A  ㅣ
		//       	 ──────┘
		//LIFO(Last In First Out)구조
		// ->push()
		// <-pop() 값을 읽어가면서 제거			peek() 값을 읽기만
		//	   empty()
		//index	    search() 
		//-1			찾는게 없으면
		
		//스택 활용 : 웹브라우저 뒤로/앞으로
		
		
		//Stack의 부모클래스는 Vector   , 동기화처리가 되어있는것 Vector
		//Vector의 부모는 List
		//List의 부모는 Collection
		Stack s = new Stack();
		s.push("유희진");
		s.push("임경재");
		s.push("김호영");
		s.push("이지현");
		
		System.out.println(s);
		/*
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.pop());

		//java.util.EmptyStackException 이제 비어있는데 더 꺼내려고해서 예외발생
		System.out.println(s.pop());
		*/
		
		/*
		while (!s.empty()) {//비어있지 않으면 최신거 계속 꺼내기
			System.out.println(s.pop());
		}
		*/
		
		/*
		System.out.println(s.peek());//제거하지 않고 읽어오기만
		System.out.println(s.peek());
		System.out.println(s.peek());
		System.out.println(s.peek());
		*/
		
		//pop() pop() pop() 
		System.out.println(s.search("임경재")); //최신부터 1~ //3
	
		
	}//main

}//class
