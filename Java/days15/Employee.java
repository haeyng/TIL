package days15;


//[사원 클래스]
//모든 사원들이 공통적으로 가져야할 멤버(필드,메서드)를 구현한 클래스
public abstract class Employee extends Object{

	//필드
	private String name; //사원명
	private String addr;  //사원주소
	private String tel;    // 연락처
	private String hiredate; //입사일자
	
	
	//생성자
	public Employee() {
		System.out.println(">Employee 디폴트 생성자 호출");
	}
	public Employee(String name, String addr, String tel, String hiredate) {
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.hiredate = hiredate;
		System.out.println(">Employee 4 생성자 호출");
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	 	
	//메서드
	//사원들의 정보를 출력하는 메서드
	public void dispEmpInfo() {
		System.out.printf("사원명:%s, 주소:%s, 연락처:%s, 입사일자:%s\n",
				this.name, this.addr, this.tel, this.hiredate );
		
	}
	
	
	@Override
	public String toString() {
		return String.format("사원명:%s, 주소:%s, 연락처:%s, 입사일자:%s",
				this.name, this.addr, this.tel, this.hiredate );
	}
	
	/*
	public  int getPay() { //기능은 하지 않지만 가상적으로 함수를 만들어놓으면 자식이 오버라이딩해서 쓰라고 만들어줌
		return 0;
	}
	*/
	
	//This method requires a body instead of a semicolon : 몸체가 필요하다
	//body {} 몸체가 구현이 안된 불완전한 메서드
	//추상 메서드
	//abstract 키워드를 붙인다.
	//추상 메서드가 한개라도 있다면 그 클래스는 불완전한 클래스이고, 객체를 생성할 수 없고 그 클래스를 추상클래스라고한다.
	//추상 클래스가 되려면 클래스 앞에 abstract 키워드가 붙는다.
	//자식이 오버라이딩해서 쓰라는 의도로 쓰는것
	public abstract  int getPay();//몸체가 구현 안된 메서드
	

	
}//class









