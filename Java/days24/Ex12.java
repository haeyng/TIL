package days24;

import java.util.ArrayList;
import java.util.Collections;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 3:48:35
 * @subject
 * @content
 */
public class Ex12 {

	public static void main(String[] args) {

		//[와일드 카드 설명]
		
		FruitBox<Fruit> fruitBox = new FruitBox<>();
		FruitBox<Apple> appleBox = new FruitBox<>();
		FruitBox<Grape> grapeBox = new FruitBox<>();
		
		/*
		//									FruitBox<? extends Fruit> box
		Juice juice = Juicer.makeJuice(fruitBox);
		juice = Juicer.makeJuice(appleBox);
		juice = Juicer.makeJuice(grapeBox);
		*/

		//makeJuice 메서드를 제네릭 메서드로 선언(수정)함. 호출 방법이 다르다.
		//Juice juice = Juicer.<Apple>makeJuice(appleBox);
		//생략이 가능하다
		Juice juice = Juicer.makeJuice(appleBox);
		
		
		
		//[제네릭 메서드]
		// - 메서드의 선언부(몸체가 아닌 함수 원형)에 제네릭 타입이 선언된 메서드를 제네릭 메서드라고 한다.
		// - 형식 (리턴타입 앞에 <>)
		// public static <T> Juice makeJuice (FruitBox<T> box){
		//} 
		
		
	}//main

}//class


class Fruit {
	public String toString() {return "Fruit";}
}

class Apple extends Fruit{
	public String toString() {return "Apple";}
}

class Grape extends Fruit{
	public String toString() {return "Grape";}
}


class Box05<T>{
	ArrayList<T> list = new ArrayList<T>(); 
	void add(T item) { this.list.add(item); }
	int sizq() { return this.list.size(); }
	T get(int i) { return this.list.get(i); }
	public String toString() {return this.list.toString();}
}


class FruitBox<T extends Fruit> extends Box05<T>{ 
	//구현
}

//[일반 클래스 선언]    제네릭 클래스 아님
//매개변수를 과일박스를 주면 
//쥬스를 만들어서 반환하는 기능이 있는 쥬스 클래스
class Juice{}


class Juicer{
	/* 메서드 오버로딩 조건 
	 * 제네릭에서는 FruitBox<Fruit> box, FruitBox<Apple> box,FruitBox<Grape> box 를 같은 것으로 인식= 매개변수가 달라도 같은것으로 인식
	 * 제네릭 타입의 매개변수는 오버로딩 자체가 성립되지 않는다.
	//static Juice makeJuice(FruitBox<T> box) { //T는 안됨
	static Juice makeJuice(FruitBox<Fruit> box) { 
		return new Juice();
	}
	static Juice makeJuice(FruitBox<Apple> box) { 
		return new Juice();
	}
	static Juice makeJuice(FruitBox<Grape> box) { 
		return new Juice();
	}
	*/
	
	
	/*
매개변수
FruitBox<? extends Fruit> box      :		Fruit 에서 물려받은 자식들만 가능하다는 뜻
FruitBox<? super Fruit> box      :		Fruit  부모들 가능하다
FruitBox<?> box      :		제한이 없다, 모든 타입이 가능하다.
	static Juice makeJuice(FruitBox<? extends Fruit> box) {
		return new Juice();
	}
	 */
	
	//위의 일반 메서드를 제네릭 메서드로 변경하려고 함
	//		클래스의 <T>하고 상관없음 클래스에 <T>있어도,없어도 상관X
	static <T extends Fruit> Juice makeJuice(FruitBox<T> box) {
		return new Juice();
	}
	
}




