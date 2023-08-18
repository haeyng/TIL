package days24;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

/**
 * @author 송해영
 * @date 2023. 8. 16. - 오전 9:11:48
 * @subject
 * @content
 */
public class Ex01_02 {

	public static void main(String[] args) {
//		2. days19 패키지 안에 있는 "1. Java 팀 구성.txt" 파일을 읽어와서
//		   Map 컬렉션 클래스 사용해서
//		      key : 1조, 2조, 3조
//		      value :  직위(급)과 이름을 저장하는 클래스를 선언하고 //팀장,팀원-----------MemberVO 클래스 구현함
//		      그 클래스 객체를 저장하는 컬렉션 클래스 사용 저장하고 출력하는 코딩을 하세요. --------- 순서만 ArrayList 

		String fileName = ".\\src\\days19\\1. Java 팀 구성.txt";

		ArrayList<MemberVO> teamList = null;
		HashMap<String, ArrayList<MemberVO>> teamMap = new LinkedHashMap<>(); //HashMap를 LinkedHashMap으로 변경하면 1조부터 출력됨

		String line = null;
		String teamName = null; //key
		MemberVO memberVO = null;
		
		try (FileReader reader = new FileReader(fileName);
			  BufferedReader br = new BufferedReader(reader))  //라인단위로 읽어옴
		{
			while ((line=br.readLine()) != null && !line.equals("")) {//한줄 읽어와서 null이 아니면 && 빈문자열도 아니면
				
				//if (line.equals("")) {  //문자열 비교할때는 =같다 말고 equals쓰기
				//	break;}				
				
				teamName = line; //key // 팀이름으로
				
				line = br.readLine();//팀원 라인 읽어옴 //이경서(팀장), 신종혁, 이재영, 송해영 , 신기범, 이준희, 김성준
				
				String [] tNames = line.split("\\s*,\\s*");
				
				teamList = new ArrayList<MemberVO>(); //팀원 객체
				
				for (String tName : tNames) {

					if (tName.contains("(팀장)")) {
						tName = tName.replace("(팀장)", "");
						memberVO = new MemberVO(tName,"팀장"); 
					}else {
						memberVO = new MemberVO(tName,"팀원"); 
					}//if
					
					teamList.add(memberVO);//value
					
				}//foreach
				
				teamMap.put(teamName, teamList);
				
			}//while
	
			//출력
			dispTeamMember(teamMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch
		
		
		
	}//main

	private static void dispTeamMember(HashMap<String, ArrayList<MemberVO>> teamMap) {
		Set<Entry<String, ArrayList<MemberVO>>> eset = teamMap.entrySet();
		Iterator<Entry<String, ArrayList<MemberVO>>> ir = eset.iterator();
		
		
		
		//팀명
		String teamName = null;
		
		//팀인원
		ArrayList<MemberVO> teamList = null;
		int teamCount =0;
		
		//팀장
		//String teamLeader = teamList.get(0);
		MemberVO teamLeaderVO = null;
		String teamLeaderName = null;
	
		
		
		while (ir.hasNext()) {
			Entry<String,ArrayList<MemberVO>> entry = ir.next();
//			[1조(7명):이윤서] 
//			1.팀원
//			2.팀원
//			3.팀원
			
			/* while문 밖으로
			//팀명
			String teamName = entry.getKey();
			
			//팀인원
			ArrayList<MemberVO> teamList = entry.getValue();
			int teamCount = teamList.size();
			
			//팀장
			//String teamLeader = teamList.get(0);
			MemberVO teamLeaderVO = teamList.get(0);
			String teamLeaderName = teamLeaderVO.getName();
			*/
			
			//팀명
			teamName = entry.getKey();
			
			//팀인원
			teamList = entry.getValue();
			teamCount = teamList.size();
			
			//팀장
			teamLeaderVO = teamList.get(0);
			teamLeaderName = teamLeaderVO.getName();
			
			
			System.out.printf("[%s(%d명):%s]\n",teamName,teamCount,teamLeaderName);
			
			
			//팀원들 출력
//			teamList.subList(1, teamCount);
			Iterator<MemberVO> ir2 = teamList.iterator(); //변수 밖으로 빼서 선언하면 좋은 코딩
			int seq = 1;
			
			if(ir2.hasNext()) ir2.next();// 팀장 읽어와서 버리겠다. 한번
			
			while (ir2.hasNext()) {
				MemberVO memberVO = ir2.next();
				System.out.printf("  [%d] %s\n", seq++, memberVO.getName());
			}
			
			
		}//while
		
		
	}

}//class
