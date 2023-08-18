package days25;

import java.text.Format;

public class TeamVO {
	
	//TeamVO (name, totalNumber , leader ) 
	private String name; //팀명 1조 2조 3조
	private int totalNumber; //팀 총인원수
	private String leaderName; //팀장명
	//private MemberVO leader; //리더 객체
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public TeamVO(String name, int totalNumber, String leaderName) {
		super();
		this.name = name;
		this.totalNumber = totalNumber;
		this.leaderName = leaderName;
	}
	public TeamVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return String.format("[%s(%d명) - %s]", this.name, this.totalNumber,this.leaderName);
	}
	
	@Override
	public int hashCode() {
		return this.name.hashCode(); //팀명을 hashcode값으로 처리
	}
	
	@Override
	public boolean equals(Object obj) {
		TeamVO vo = (TeamVO) obj;
		return this.name.equals(vo.name);
	}
	
	

	
}
