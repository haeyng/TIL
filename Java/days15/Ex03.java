package days15;

import days13.Tv;

/**
 * @author 송해영
 * @date 2023. 8. 2. - 오전 11:32:56
 * @subject
 * @content
 */
public class Ex03 {

	public static void main(String[] args) {
		CaptionTv ctv = new CaptionTv();
		ctv.channel = 11;
		ctv.channelDown();
		System.out.println(ctv.channel);
		ctv.dispCaption("Hello World"); //기본값이 false라 자막이 안켜진 상태
		ctv.caption=true; //자막기능 on이 됨
		ctv.dispCaption("Hi");
		
		
	}//main

}//class


//자막Tv + 기존의 존재하는 Tv클래스 
class CaptionTv extends Tv{
	boolean caption;   //자막 기능 on(true)/off(false) 
	
	void dispCaption(String text) {
		if (this.caption) {//자막이 켜져있다면
			System.out.println(text);
		} // if
	}

}