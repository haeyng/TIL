package days18;
/**
 * @author 송해영
 * @date 2023. 8. 7. - 오전 11:25:11
 * @subject 시험
 * @content
 */
public class Ex03_02 {

	public static void main(String[] args) {
		//주민등록 번호가 같으면 동일한 사람(객체)이다.
		Person p1 = new Person("111", "홍길동");
		Person p2 = new Person("111", "홍길둥");
		
		//[3번째] Object.toString()
		//days18.Person@be11
		//패키지명.클래스명@해시코드의 16진수 값
		System.out.println(p1.toString()); //Person [rrn=111, name=홍길동]
		System.out.println(p2.toString());
		
		System.out.println(p1);
		System.out.println(p2);
		
		System.out.println(p1.hashCode());//1521118594 인스턴스가 다름
		System.out.println(p2.hashCode());//1940030785 
		
		//Person p2 = null;
		
		//주민번호만 같으면 같은 사람으로 true가 나오도록 하고 싶음. Object에서 물려받은 equals() 메서드를 오버라이딩하면 됨
		//System.out.println(p1.equals(p2)); //false
		
		
	}//main

}//class

//Person 클래스의 객체가 복제(clone) 되도록 코딩할것임  1.cloneable 인터페이스 구현 2.클론메서드 오버라이딩
class Person implements Cloneable{
	
	//생성자
	public Person(String rrn,String name) {
		super();
		this.rrn = rrn;
		this.name = name;
	}

	String rrn;
	String name;


	@Override
	public String toString() {
		//return "Person [rrn=" + rrn + ", name=" + name + "]";
		return String.format("Person [rrn=%s, name=%s]", this.rrn, this.name);
	}


	//업캐스팅 다형성
//p1.equals(p2) ......... 시험 한줄한줄 의미
	@Override
	public boolean equals(Object obj) { //오버라이딩 의미 조건
	if(obj != null && obj instanceof Person) { //어떤것을 체크하는 코딩인지, if문에 &&연산자로 왜 들어갔는지 , 조건식 의미
		Person p = (Person)obj; //다운캐스팅 
				return this.rrn.equals(p.rrn);
	}//if
	return false; //return문이 왜 있는지..
	
	
}
	
	@Override
	public int hashCode() {
		return this.rrn.hashCode();
	}


	/*
	//checked 예외 이기 떄문에 예외처리 해야함
	@Override
	protected Object clone() throws CloneNotSupportedException {
		//return super.clone(); //부모의 clone 메서드 호출해 리턴, 아래 세줄과 같은 코딩
		Object obj = null;
		obj = super.clone();
		return obj;
	}
	*/
	
	//오버라이딩 조건(주의사항) Person이 아니라 Object로 해야되는데 왜 Person으로 했는지? 
	// : 매번 형변환해서 예외처리하고 써야됨 JDK 1.5부터 새로 추가된 문법 공변반환타입(convariant return type)추가
	// 오버라이딩 할 때 조상 메서드의 반환 타입을 자식 클래스 타입으로 변경이 가능하다.(여기서는 부모 Object 반환타입을 자식인 Person으로 변경이 가능하다.)
	@Override
	protected Person clone(){
		
		Person p = null;
		
		try {
			p = (Person)super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return p;
	}
	
	
}