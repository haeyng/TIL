package days13;
/**
 * @author 송해영
 * @date 2023. 7. 31. - 오후 12:18:48
 * @subject
 * @content
 */
public class Ex05 {

	public static void main(String[] args) {
		
		// [클래스 배열]로 선언
		/*
		Tv tv1 = new Tv();
		Tv tv2 = new Tv();
		Tv tv3 = new Tv();
		*/
		
		//배열 선언 형식
		//자료형 [] 배열명 = new 자료형 [배열크기];
		Tv [] tvArr = new Tv[3];
		//     배열명
		
		//객체 생성
		for (int i = 0; i < tvArr.length; i++) {
			tvArr[i]=new Tv();
		} // for
		
		//java.lang.NullPointerException //인스턴스화 되지 않아서
		//tvArr[0]=new Tv(); 없어서 나는 오류
		tvArr[0].power();
		System.out.println("Tv : " + (tvArr[0].power ? "ON" : "OFF"));
		tvArr[0].channelUp();
		System.out.println("현재 채널 : " + tvArr[0].channel);
		tvArr[0].power();
		System.out.println("Tv : " + (tvArr[0].power ? "ON" : "OFF"));
		System.out.println(" end ");
		
	}//main
}//class
