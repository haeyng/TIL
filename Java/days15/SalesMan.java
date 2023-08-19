package days15;

//영업직 사원 최종(마지막)클래스
//final class    자식 클래스를 가질 수 없는 최종클래스 
public final class SalesMan extends Regular{

	//필드 - name, addr, tel, hiredate, basePay
	//생성자 X
	//메서드 - @dispEmpInfo(), @toString(), getPay() , getter, setter
	
	private int sales; //판매량
	private int comm; //커미션
	
	public SalesMan() {
		super();
		System.out.println(">디폴트 생성자 호출됨");
	}

	public SalesMan(String name, String addr, String tel,String hiredate, int basePay,int sales, int comm) {
		super(name, addr, tel, hiredate, basePay);
		this.sales = sales;
		this.comm=comm;
		System.out.println(">SalesMan 7 생성자 호출됨");
	}
	
	@Override
	public void dispEmpInfo() {

	System.out.printf("사원명:%s, 주소:%s, 연락처:%s, 입사일자:%s, 기본급:%d, 판매량:%d, 커미션:%d\n",
			this.getName(),this.getAddr(),this.getTel(),this.getHiredate(),this.getBasePay(),this.sales,this.comm);	
	}
	
	@Override
	public int getPay() { //월급계산하는 함수
		return super.getPay() + this.sales * this.comm;
	}
}//class


///The type child cannot subclass the final class SalesMan : 자식클래스를 가질수없다
//class child extends SalesMan{
//}
