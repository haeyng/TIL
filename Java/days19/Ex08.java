package days19;

import java.util.Objects;
import java.util.Random;

/**
 * @author 송해영
 * @date 2023. 8. 8. - 오후 12:36:52
 * @subject
 * @content
 */
public class Ex08 {

	public static void main(String[] args) {

		//Arrays 클래스 
		
		//Objects 클래스 : 객체를 다룰때 자주 사용되는 기능들이 구현된 클래스
		Ex08 obj = null;
		
		//if (obj != null) 객체가 null인지 아닌지 체크해서 하는 코딩 많이 함
		
		//Object.isNull(obj)  obj 객체가 null일때 true를 반환하는 메서드 : isNull()
		//Object.nonNull()    obj 객체가 null이 아닐때 true를 반환하는 메서드 : nonNull()
		
		
		//같은 의미의 코딩
		//if (obj != null)
		//if(!Object.isNull(obj))
		//if(Object.nonNull(obj))
		
		
		
		/*
		if (obj ==null) {
			new ~Exception("예외 메세지");
		} 
		this.name = name;
		*/
		
		//this.name = Objects.requireNonNull(name,"예외 메세지");
		
		
		
		//같은 의미 코딩 
		//if(a!=null && a.equals(b)){} 
		//if(Objects.equals(a,b))
		
		
		
		//java.util.Random 클래스
		Random rnd = new Random();
		//rnd.nextBoolean(); //랜덤하게 true/false
		//rnd.nextInt(bound); //0<=   정수   <bound 
		//rnd.nextXXXXX();  등등...		
		
	}//main

}//class
