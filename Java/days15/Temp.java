package days15;


//임시직
public class Temp extends Employee{

	//필드 - name, addr, tel, hiredata
	//생성자x
	//메서드 - dispEmpInfo(), @toString(), getter, setter 

	private int days; //근무일수
	private int payOfDay; //하루일당
	
	//생성자
	public Temp() {
		super();
		System.out.println("디폴트 생성자 호출");
	}

	public Temp(String name, String addr, String tel, String hiredate, int days, int payOfDay) {
		super(name, addr, tel, hiredate);
		this.days = days;
		this.payOfDay = payOfDay;
		System.out.println("temp6 생성자 호출");

	}
	//@Override 안붙여도 오버라이딩됨 붙이면 컴파일러가 됐는지 체크해줌
	public int getPay() {
		return this.days*this.payOfDay; //임시직 급여계산
	}
	
	//사원들의 정보를 출력하는 메서드
	@Override
	public void dispEmpInfo() {
		System.out.printf("사원명:%s, 주소:%s, 연락처:%s, 입사일자:%s, 근무일수:%d, 하루일당:%d\n",
				this.getName(), this.getAddr(), this.getTel(), this.getHiredate(),this.days,this.payOfDay );		
	}
	
	
}//class
