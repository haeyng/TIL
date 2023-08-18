package days23;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

public class Ex03 {

	public static void main(String[] args) {

		//Set 계열의 LinkedHashSet 컬렉션 클래스
		//  ㄴ 중복 허용하지 않음, 순서(add했을때의 순서) 유지됨(가장 큰 특징)
		
		//사람은 주민등록번호가 같으면 같은 객체(사람) 중복이 안되야 됨
		Set<Person> s = new LinkedHashSet<Person>();
		//부모 인터페이스에 업캐스팅
		
		s.add(new Person("111111-1111111", "김호영", 23)  );
		s.add(new Person("222222-2222222", "박민석", 25)  );
		s.add(new Person("333333-3333333", "박정호", 28)  );
		
		System.out.println(s.size()); //3
		
		s.add(new Person("222222-2222222", "박민석", 35)  ); //추가 안됨
		
		Iterator<Person> ir = s.iterator();
		while (ir.hasNext()) {
			Person p = (Person) ir.next();//(Person) 생략가능
			System.out.println(p);
		}//while
		
		
		
		
	}//main

}//class

class Person{
	
	String rrn;
	String name;
	int age;
	
	public Person() {
		super();
	}
	
	public Person(String rrn, String name, int age) {
		super();
		this.rrn = rrn;
		this.name = name;
		this.age = age;
	}

	@Override
	public String toString() {
		return "Person [rrn=" + rrn + ", name=" + name + ", age=" + age + "]";
	}

	
	
	
	
	//hashcode() 같으면 같은 객체
	//같은지 물어볼때 equals() 오버라이딩해서 처리했었음
	
	//hashcode() rrn 오버라이딩
	//equals() rrn 오버라이딩
	
	
	@Override
	public int hashCode() {
		return this.rrn.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Person) {
			Person p = (Person)obj;
			return this.rrn.equals(p.rrn);
		} // if
		return false;
	}
	
	
	
	
	
	
}
