package days22;

import java.util.Deque;
import java.util.LinkedList;
import java.util.Queue;

/**
 * @author 송해영
 * @date 2023. 8. 11. - 오후 3:12:36
 * @subject
 * @content
 */
public class Ex10 {

	public static void main(String[] args) {

		//큐(Queue)
		//디큐[Deque] 더블 큐 : 큐의 반대쪽으로 들어가서 나오기도 가능
		
		//offer()				poll(),peek()
		//push				pop(스택)
		//FIFO 구조
		
		//Queue 는 Collection 인터페이스를 상속받은 인터페이스.
		//Queue q = new LinkedList();//LinkedList더블큐를 구현한 클래스
		Deque q = new LinkedList();
		
		q.offer("유희진");
		q.offer("임경재");
		q.offer("김호영");
		q.offer("이지현");
		
		q.offerFirst("홍길동");
		//q.offerLast(q);
		//q.pollFirst()
		//q.pollLast()
		
		//FIFO
		while (!q.isEmpty()) {
			System.out.println(q.poll());
			//String name = (String) q.remove();
			//System.out.println(name);
		}//while
		
	}//main

}//class
