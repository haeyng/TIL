package days24;

import java.util.ArrayList;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 3:48:35
 * @subject
 * @content
 */
public class Ex11 {

	public static void main(String[] args) {

/*
		//[제한된 제네릭 클래스]
		// T 모든 타입이 아니라 과일 타입만 제한해서 제네릭 클래스를 사용하려고 함
		
		FruitBox<Fruit> box1 = new FruitBox<Fruit>();
		FruitBox<Apple> box2 = new FruitBox<Apple>();
		FruitBox<Grape> box3 = new FruitBox<Grape>();

		//FruitBox에는 과일만 담으려는데 toy도 오류 안나고 담겨짐
		//FruitBox<Toy> box4 = new FruitBox<Toy>();
		//<T extends Fruit> 제한했더니 이제 아래 오류 남
		//Bound mismatch: The type Toy is not a valid substitute for the bounded parameter <T extends Fruit> of the type FruitBox<T>
		
		
*/		
	}//main

}//class

/*
interface Eatable {   }

class Fruit implements Eatable{
	public String toString() {return "Fruit";}
}

class Apple extends Fruit{
	public String toString() {return "Apple";}
}

class Grape extends Fruit{
	public String toString() {return "Grape";}
}

class Toy{
	public String toString() {return "Toy";}
}


//상자(Box04) 제네릭 클래스 선언
class Box04<T>{
	ArrayList<T> list = new ArrayList<T>(); 
	void add(T item) { this.list.add(item); }
	int sizq() { return this.list.size(); }
	T get(int i) { return this.list.get(i); }
	public String toString() {return this.list.toString();}
}


//과일만을 담을 수 있는 제네릭 클래스로 제한해서 선언하려고 함
//		<T extends Fruit>	과일만 물려받은 것으로 제한하겠다는 뜻
//class FruitBox<T extends Fruit> extends Box04<T>{ 

//					과일에서 물려받은 클래스타입 & Eatable을 구현한 클래스 : Fruit 클래스의 자식 클래스이고 동시에 Eatable 인터페이스도 구현. 타입변수로 사용
//& 기호로 연결
class FruitBox<T extends Fruit & Eatable> extends Box04<T>{ 
	//필드 필요하면 추가 선언
	//재정의 함수
}
*/







