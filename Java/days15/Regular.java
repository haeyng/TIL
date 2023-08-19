package days15;

//[정규직] 사원 클래스
public class Regular extends Employee{
		
	//[Object] 멤버들도 상속.
	//[Employee]
	//필드 - name, addr, tel, hiredate
	//생성자 X
	//메서드 - dispEmpInfo(), @toString()
									   //@오버라이딩
	
	private int basePay; //기본급
	
	//생성자
	public Regular() {
		super(); //자식객체 생성될때 부모객체 호출
		System.out.println(">Regular 디폴트 생성자 호출됨");
	}

	public Regular(String name, String addr, String tel, String hiredate, int basePay) {
		//The field Employee.name is not visible : 접근지정자 때문에 오류
		//this.name = name; 물려받았지만 Employee안에서만 사용가능하기 때문에 안됨 오류
		//this.setName(name);//이것도 물려받은거라 접근 가능 (첫번째 방법)
		super(name, addr, tel, hiredate);  //: 부모의 디폴트 생성자를 호출한다는뜻. super참조변수 부모의 멤버, 필드를 가리키거나 생성자로 쓸수있음, 부모에서 상속된 필드 초기화. 매개변수 4개로 한번에  (두번째방법)
		this.basePay = basePay;
		System.out.println(">생성자5 호출됨");
	}
	
	
	//getter, setter
	public int getBasePay() {
		return basePay;
	}
	
	public void setBasePay(int basePay) {
		this.basePay = basePay;
	}


	@Override
	public void dispEmpInfo() {
		/*
		super.dispEmpInfo(); //super 첫번째 용도 : 부모의 멤버들을 가리킬 때
		System.out.printf(", 기본급:%d\n",this.basePay);
		 */
		
	System.out.printf("사원명:%s, 주소:%s, 연락처:%s, 입사일자:%s, 기본급:%d\n",
			this.getName(),this.getAddr(),this.getTel(),this.getHiredate(),this.basePay);
	
	}
	@Override
	public String toString() {
		return super.toString() + String.format(", 기본급:%d\n",this.basePay);
	}

	public int getPay() { //월급계산하는 함수
		return this.basePay;
	}

}//class
