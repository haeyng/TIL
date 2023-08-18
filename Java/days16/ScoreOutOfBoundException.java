package days16;

//unchecked 예외
//0~100점 아니면 사용자가 정의한 예외를 발생시키기 위해서 예외클래스 하나 선언할 것임
public class ScoreOutOfBoundException extends RuntimeException{

	//예외 코드번호 필드
	private final int ERROR_CODE; 

	//getter
	public int getERROR_CODE() { //상수라 값을 한번만 초기화 하면 되서 get만 만들어짐
		return ERROR_CODE;
	}

	
	public ScoreOutOfBoundException(String message) {
		this(1000,message); //생성자로 초기화
	}
	//생성자
	public ScoreOutOfBoundException(int eRROR_CODE, String message) {
		super(message);//부모 생성자 호출
		ERROR_CODE = eRROR_CODE;
	}
	

	
}
