package days25;

//~VO == Value Object
//DTO, DAO, VO 
//값을 읽기 작업/쓰기작업을 할 수 있는 Object 객체.
//팀 이름, 직위 가진 객체

public class MemberVO {

	private String name;
	private String position; //팀장, 팀원
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	
	public MemberVO(String name, String position) {
		super();
		this.name = name;
		this.position = position;
	}
	
	
	public MemberVO() {
		super();
	}
	
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", position=" + position + "]";
	}
	
	
	
	
}
