package days24;

public class TeamVO {

	String name;
	String leader;
	int totalNumber;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	@Override
	public String toString() {
		return "teamVO [name=" + name + ", leader=" + leader + ", totalNumber=" + totalNumber + "]";
	}
	public TeamVO() {
		super();
	}
	
	
	
	
}
