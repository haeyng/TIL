package days22;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;

public class Ex05_02 {

	public static void main(String[] args) {

//		5. 이름, 나이 필드를 가진 Person2 클래스를 선언하고
//		   ArrayList 컬렉션 클래스에  Person2 객체를 요소로 추가하고 
//		   이름으로 오름차순 정렬해서    출력하는 코딩을 하세요
		
		ArrayList<Person2> list = new ArrayList();
		
		list.add(new Person2("박정호",23));
		list.add(new Person2("김성준",21));
		list.add(new Person2("주강민",29));
		list.add(new Person2("이경서",20));
		list.add(new Person2("신기범",30));
		
		System.out.println(list);
		
		list.sort((p1,p2)->p1.getName().compareTo(p2.getName())); 
		//list 객체 두개 가져와서 이름 비교 처리
		
		
		//반복자를 사용해서 출력
		Iterator ir = list.iterator();
		while (ir.hasNext()) {
			Person2 p = (Person2) ir.next();
			System.out.println(p);
		}
		
		
	}//main

}//class


class Person2{
	
	private String name;
	private int age;
	
	
	public Person2() {
		super();
	}

	public Person2(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "[name=" + name + ", age=" + age + "]";
	}
	

	
	
}//class