package days14;

public class Person { 
	
	//필드
	private String name;
	private int age;
	private boolean gender;
	
	// [Alt + Shift + S] context menu
	
	
	public Person() { //사용안해도 만들어둬야됨
	}
	
	public Person(boolean b) { //쓰기 작업은 객체 생성할때 한번만 하겠다는 의도
		gender = b;
	}
	
	//getter(읽기전용), setter(쓰기전용) 선언
	public void setAge(int n) {
		if (0<=n&&n<=130) {
			age=n;
		} else {
			//강제로 예외(오류)를 발생시킴
			//[예외처리] throw문 - 강제로 예외를 던질때 
			throw new RuntimeException("Person.age 0~130 실행오류");
		}//if
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//setGender주석처리하면 gender 필드는 읽기전용으로만 사용하겠다는 뜻 
	public boolean isGender() {
		return gender;
	}
//	public void setGender(boolean gender) {
//		this.gender = gender;
//	}
	public int getAge() {
		return age;
	}
	


}//class
