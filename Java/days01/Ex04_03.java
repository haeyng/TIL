package days01;
public class Ex04_03 {
	public static void main(String[] args) {
		
		String name = "송해영";
		int age = 29;
		
		age = age -2;
		
		//Ctrl + Alt + 방향키
		System.out.println(name);
		System.out.println(age);
		
		// 출력 형식
		//이름은 "송해영"이고, 나이는 '29'살입니다.
		//+--------------------------------->
		
		//System.out.println("이름은 "name"이고, 나이는 age 살입니다.");
		//The left-hand side of an assignment must be a variable
		//번역:할당연산자 왼쪽은 반드시 변수여야 한다
		
		//자료형을 알수없다?
		// +name+에서 +를 빼면 뜨는 오류인데 무슨 뜻인지 정확하게 모르겠음
		
		
		System.out.println("이름은 \""+name+"\"이고, 나이는 \'"+age+"\'살입니다.");
		
		//System.out.printf("출력형식문자열", 출력할값,출력할값,출력할값,..);
		//                        format==출력 형식
		//name 문자열 출력할 때 출력서식 : %s
		//age 정수 출력할때 출력 서식 : %d
		System.out.printf("이름은 \"%s\"이고, 나이는 '%d'살입니다.",name,age);	
	}//main
}//class
