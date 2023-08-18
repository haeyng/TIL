package days24;

import java.util.ArrayList;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오후 3:29:10
 * @subject
 * @content
 */
public class Ex10 {

	public static void main(String[] args) {
		/*
		
		//[제네릭 클래스의 객체 생성과 사용]
		Box03<Fruit> fruitBox = new Box03<Fruit>();
		Box03<Apple> AppleBox = new Box03<Apple>();
		Box03<Grape> GrapeBox = new Box03<Grape>();
		
		Box03<Toy> toyBox = new Box03<Toy>();
		
		//Type mismatch: cannot convert from Box03<Grape> to Box03<Apple>
		//Box03<Apple> = new Box03<Grape>();//포도객체를 만들었는데 사과에 참조 시키니 예외 발생
		
		//Type mismatch: cannot convert from Box03<Fruit> to Box03<Apple>
		//Box03<Apple> box1 = new Box03<Fruit>();  예외발생
		//													부모
		
		//Type mismatch: cannot convert from Box03<Apple> to Box03<Fruit>
		//Box03<Fruit> box1 = new Box03<Apple>(); 예외발생
		
		fruitBox.add(new Fruit());
		fruitBox.add(new Apple());//사과 객체
		fruitBox.add(new Grape());//포도 객체
		
		//The method add(Fruit) in the type Box03<Fruit> is not applicable for the arguments (Toy)
		//fruitBox.add(new Toy());//장난감 객체 오류
		
		
		
		*/
		
	}//main

}//class

//Fruit
// ㄴ Apple
// ㄴ Grape
//Toy

/*
class Fruit{
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


//제네릭 클래스
class Box03<T>{
	ArrayList<T> list = new ArrayList<T>();   // int라면 [1,2,3]
	void add(T item) { this.list.add(item); }
	int sizq() { return this.list.size(); }
	T get(int i) { return this.list.get(i); }
	public String toString() {return this.list.toString();}
}

*/




