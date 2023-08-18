package days16;
/**
 * @author 송해영
 * @date 2023. 8. 3. - 오후 1:59:39
 * @subject
 * @content
 */
public class Ex08 {

	public static void main(String[] args) {

	}//main

}//class


//자바에는 ~able의 인터페이스가 많음
interface Movable{
	//1.상수
	//2.추상메서드
	//3.default메서드
	//4.static메서드
	
	void move(int x, int y);     //public abstract 붙이지 않아도 있는것과 같음
}

interface Attackable{
	void attack(Unit nuit); // 매개변수가 공격할 유닛(대상)
}

//인터페이스끼리 상속이 가능하고 다중상속도 가능하다.
interface Fightable extends Attackable, Movable{
	//추상메서드
}

abstract class Unit{ //공통적인 부분 abstract 추가
	int currentHP; //현재 유닛의 체력
	int x; //현재 유닛의 위치 x좌표
	int y; //현재 유닛의 위치 y좌표
}


//하늘 유닛
class AirUnit extends Unit{
	
} 

//땅 유닛
class GroundUnit extends Unit{
	
}

//군인
class Fighter implements Fightable{//move(),attack()가 오버라이딩

	@Override
	public void attack(Unit nuit) {
		//총 칼 공격 등등..
	}

	@Override
	public void move(int x, int y) {
		//걷는 작업
	}
	
}

//수리가 가능한 유닛을 나타냄
//상수,추상메서드,멤버 등 아무것도 없지만 만들어 두는 이유? 수리가 가능한 객체인지 아닌지 판단 scv,Tank
interface Repairable{} 

class Tank extends GroundUnit implements Fightable, Repairable{

	@Override
	public void attack(Unit nuit) {
		//포 쏘는 공격
	}

	@Override
	public void move(int x, int y) {
		//탱크가 움직이는 코딩
	}
	
}

//SCV
//수리를 할 수 있는 객체가 수리 가능 : Repairable 인터페이스를 구현한 클래스, Tank, SCV
//수리 불가능 : Fighter


class SCV extends GroundUnit implements Repairable{
	
	SCV(){}
	
	//건물 짓기 메서드
	//다른 유닛 수리하는 메서드
	void repair(Readable unit) {//수리할수있는 유닛 매개변수로
		
		if (unit instanceof Tank) {
			//탱크수리하는코딩
		} else if (unit instanceof SCV) {
			//SCV 수리하는 코딩
		} else if (unit instanceof DropShip) {
			//DropShip을 수리하는 코딩
		} // if
	}
}

//탱크,군인,무기 등 수송선
class DropShip extends AirUnit implements Fightable, Repairable{

	@Override
	public void attack(Unit nuit) {
		
	}

	@Override
	public void move(int x, int y) {
		
	}
}




