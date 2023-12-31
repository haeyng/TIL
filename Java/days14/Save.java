package days14;

//저축 관련 클래스 - static 키워드
public class Save {

	//필드
	private String name =null; //예금주
	private int money = 0; 	//예금액
	
	//1. 인스턴스가 생성될 때 마다 필드가 생성되지 않는다.
	//2. 클래스가 선언될 때 Method 영역에 필드가 생성된다.
	//    (객체를 생성하지 않아도 static 필드는 벌써 생성되어져 있다.)
	//3. 모든 인스턴스(객체)가 공유하는 필드가 된다.
	//    공유변수(필드) , shared 변수, static 변수, 정적변수,클래스변수(클래스당하나씩 만들어져서)
	private static double rate = 0.04;	//이자율           프로그램 시작할때 메모리에 올라감
	//생성자
	public Save() {} 
	// Alt + Shift + S
	public Save(String name, int money, double rate) {
		this.name = name;
		this.money = money;
		this.rate = rate;
	}
	
	//getter, setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	//인스턴스 메서드
	//static 메서드, 정적 메서드
	public static double getRate() {
		return rate;
	}
	public static void setRate(double rate) {
		//3.static메서드 안에서 지역변수는 사용 가능
		int n = 10;
		
		//2.static메서드 안에서 인스턴스변수 사용X
		//Cannot make a static reference to the non-static field name
		//name = "홍길동";
		
		
		//1.static메서드 안에서 this 키워드 사용불가
		//Cannot use this in a static context : 
		//this는 객체가 생성되야 사용할수있는데 static 필드는 객체가 생성되기 전에 사용할수있게 만든 메서드라 필요없음
		//this.rate = rate; //static 붙이고 생긴 오류
		
		//The assignment to variable rate has no effect : 
		Save.rate=rate; //클래스명.필드명
	}
	
	//메서드
	public void dispSave() {
		System.out.printf("> 예금주 : %s, 예금액 : %d, 이자율 : %.2f\n", this.name, this.money, this.rate);
	}
	
}//필드
