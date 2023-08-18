package days16;

/**
 * @author 송해영
 * @date 2023. 8. 3. - 오전 11:41:32
 * @subject [Singleton pattern]
 * @content
 */
public class Ex06 {

	public static void main(String[] args) {

		//[Singleton pattern]
		//1.DBCP(DataBase Connection Pool) 
		//2. 객체 생성에 제한 - 1개 객체만 생성해서 같이 쓴다
		//	  첫번째 객체 생성 - 1개 객체 생성
		//   두번째 객체 생성 - 생성X 전에 생성했던 첫번째 객체를 돌려줌
		//   세번째 객체 생성 - 생성X
		
		
		/*
		//The constructor BoardDao() is not visible 
		BoardDao dao1 = new BoardDao();   private BoardDao() {}//디폴트 생성자 때문에 new 연산자로 객체 생성 불가능 다른방법으로 객체생성 해야함.
		System.out.println(dao1.hashCode()); //hashCode 객체의 고향 코드값
		BoardDao dao2 = new BoardDao();
		System.out.println(dao2.hashCode());
		BoardDao dao3 = new BoardDao();
		System.out.println(dao3.hashCode());
		BoardDao dao4 = new BoardDao();
		System.out.println(dao4.hashCode());
	     */
		
		BoardDao dao1 = BoardDao.getInstance();
		System.out.println(dao1.hashCode()); 
		BoardDao dao2 = BoardDao.getInstance();
		System.out.println(dao2.hashCode());
		BoardDao dao3 = BoardDao.getInstance();
		System.out.println(dao3.hashCode());
		BoardDao dao4 = BoardDao.getInstance();
		System.out.println(dao4.hashCode());
		
	}//main

}//class


//1개의 객체만 생성 패턴
//클래스 내부에서는 객체 생성 할 수 있다. 외부에서는 private 때문에 안됨
class BoardDao extends Object{

	private BoardDao() {}//디폴트 생성자
	
	//공유변수, 클래스변수 [필드]
	private static BoardDao boardDao = null; //자기자신 객체를 저장할수있는 필드. //static한개 만들어서 공유한다는 의미	
	
	//메서드 앞에 synchronized 키워드를 붙이면------암기
	//해당 메서드는 [스레드]에 안전한 [동기화 처리]가 되어진다.
	public synchronized static BoardDao getInstance() {
		
		if (boardDao == null) {
			boardDao = new BoardDao(); //같은 클래스 안에서 객체 생성 가능
		} // if
		return boardDao;
	}
	
}



/*
 * 
 * 							[학생(스)-대변기] 여기 안에 들어간 스레드가 나와야 다음 스레드가 들어감 -> 동기화.
 * 							 학생(스)
 * 							 학생(스)
 * 							 학생(스)
 * 
 *  학생 하나하나 각각을 (스레드)
 * 
 * 
 * */













