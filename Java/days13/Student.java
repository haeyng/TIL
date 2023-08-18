package days13;

public class Student {

	//멤버 = 멤버변수(필드) + 멤버함수(메서드)
	//필드
	//인스턴스 변수
	public int no;
	public String name;
	public int kor;
	public int eng;
	public int mat;
	public int tot;
	public double avg;
	public int rank;
	public int wrank;
	
	//메서드
	public void printStudentInfo() { 		
			System.out.printf("%d번\t%s\t%d\t%d\t%d\t%d\t%.2f\t\t%d등\n"
					,no, name, kor, eng, mat, tot, avg, rank );
	}
	
	
	
}//class
