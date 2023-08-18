package days14;

public class Ex12 {

	public static void main(String[] args) {
			/*
			 * [클래스들 간의 관계]
			 * 1.has-a 관계 ***
			 *   2개의 클래스 선언
			 *   Car 		클래스 
			 *   Engine 클래스 - 연료를 가지고 구동장치
			 *   
			 *   Car는 has-a Engine이라는 클래스를 가진다
			 * 
			 * 2.is-a 관계 (상속)
			 * 
			 * */
			
			Engine engine = new Engine();
			// DI 2가지 방법
			// 1) 생성자를 통해서 DI
			Car myCar = new Car(engine);   //생성자를 통한 의존성 주입(DI) - 결합력이 낮아짐
			// 2) setter 통해서 DI
			//Car myCar = new Car();
			myCar.setEngine(engine);
			
			
			myCar.speedUp(100);
			int carSpeed = myCar.getEngine().speed;
			System.out.println(carSpeed);
			
			myCar.speedDown(10);
			carSpeed = myCar.getEngine().speed;
			System.out.println(carSpeed);
			
			myCar.stop();
			carSpeed = myCar.getEngine().speed;
			System.out.println(carSpeed);
			
			System.out.println("end");
			
	}//main
}//class
