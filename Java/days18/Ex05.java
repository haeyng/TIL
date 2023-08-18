package days18;

public class Ex05 {

	public static void main(String[] args) {
		//Object.equals()
		//Object.hashCode()
		//Object.toString()
		
		//Object.getClass() - 객체의 클래스 정보를 담고 있는 Class 타입의 인스턴스를 반환하는 메서드.
		
		Person p1 = new Person("111", "홍길동");
		Class cls = p1.getClass(); // getClass()는 p1 객체가 어떤 클래스로부터 만들어졌는지 클래스 정보 리턴.
		
		System.out.println(cls.getName()); //days18.Person
		System.out.println(cls.getSimpleName()); //Person
		
		
	}//main

}//class
