package days25;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.Map.Entry;

import days24.MemberVO;

public class Ex01_Copy {

	public static void main(String[] args) {
//		1.  "1. Java 팀 구성.txt" 파일을 읽어와서
//	    HashMap 컬렉션 클래스를 사용해서 
//	    key   - TeamVO (name, totalNumber , leader ) 
//	    value - ArrayList<MemberVO>
//	    로 저장해서 출력하는 코딩을 하세요. 
//	    ( 조건 1: key 값으로 TeamVO 클래스 선언 )
//	    ( 조건 2: value 값으로 어제 선언한 MemberVO 클래스 사용 )
		String fileName = ".\\src\\days19\\1. Java 팀 구성.txt";

		ArrayList<MemberVO> teamList = null;
		HashMap<TeamVO, ArrayList<MemberVO>> teamMap = new LinkedHashMap<>(); 

		String line = null;
		String teamName = null; //key
		
		TeamVO teamVO = null;
		MemberVO memberVO = null;
		int teamTotalNumber = 0;
		String teamLeaderName = null;
		
		try (FileReader reader = new FileReader(fileName);
			  BufferedReader br = new BufferedReader(reader)) 
		{
			while ((line=br.readLine()) != null && !line.equals("")) {
				
				teamName = line;
				line = br.readLine();
				String [] tNames = line.split("\\s*,\\s*");
				teamList = new ArrayList<MemberVO>(); //팀원 객체
				for (String tName : tNames) {
					if (tName.contains("(팀장)")) {
						teamLeaderName = tName.replace("(팀장)", "");
						memberVO = new MemberVO(tName,"팀장"); 
					}else {
						memberVO = new MemberVO(tName,"팀원"); 
					}//if
					teamList.add(memberVO);//value
				}//foreach
				teamTotalNumber = teamList.size();
				teamVO = new TeamVO(teamName, teamTotalNumber, teamLeaderName);
				teamMap.put(teamVO, teamList);
			}//while
			
			//만약에 key 가 중복이 된다면 x 팀명이 같으면 key가 중복이 된다고 처리해야된다.
			
			
			teamVO = new TeamVO("1조", 1, "홍길동");
			if (!teamMap.containsKey(teamVO)) {
				teamList = null;
				teamMap.put(teamVO, teamList);
			} else {
				System.out.println(">> 1조는 teamMap에 사용 중이다."); //키값으로 사용못한다
			}
			
			
			
			
			//팀원이 존재하지 않을때 팀원이 존재하지 않는다고 메세지 띄우기
			
			
			//출력
			dispTeamMember(teamMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//catch		
	}//main

	private static void dispTeamMember(HashMap<TeamVO, ArrayList<MemberVO>> teamMap) {
		Set<Entry<TeamVO, ArrayList<MemberVO>>> eset = teamMap.entrySet();
		Iterator<Entry<TeamVO, ArrayList<MemberVO>>> ir = eset.iterator();	
		
		//팀명
		String teamName = null;
		
		//팀인원
		ArrayList<MemberVO> teamList = null;
		int teamCount =0;
		
		//팀장
		MemberVO teamLeaderVO = null;
		String teamLeaderName = null;
		TeamVO teamVO = null;
		
		while (ir.hasNext()) {
			Entry<TeamVO,ArrayList<MemberVO>> entry = ir.next();

			teamVO = entry.getKey();
			teamList = entry.getValue();
			
			System.out.printf("%s\n",teamVO);//toString()재정의 했기 때문에
				
			
			//예외가 발생하지 않을때 if문 반복 안하는게 좋음 try~catch문 사용하기
			try {
				Iterator<MemberVO> ir2 = teamList.iterator(); //팀리스트가 null인데 반복자로 가져오다가 오류
				int seq = 1;
				if(ir2.hasNext()) ir2.next();
				while (ir2.hasNext()) {
					MemberVO memberVO = ir2.next();
					System.out.printf("  [%d] %s\n", seq++, memberVO.getName());
				}//while
			} catch (NullPointerException e) {
				System.out.println("  팀원이 존재하지 않습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}//catch
			
			
			/*
			//if문으로 teamList null일때 아닐때 
			if (teamList != null) {
				Iterator<MemberVO> ir2 = teamList.iterator(); //팀리스트가 null인데 반복자로 가져오다가 오류
				int seq = 1;
				if(ir2.hasNext()) ir2.next();
				while (ir2.hasNext()) {
					MemberVO memberVO = ir2.next();
					System.out.printf("  [%d] %s\n", seq++, memberVO.getName());
				}
			} else {
				System.out.println("  팀원이 존재하지 않습니다.");
			}
			*/
			
			
			
			/* 예외처리 하기 전
			Iterator<MemberVO> ir2 = teamList.iterator(); //팀리스트가 null인데 반복자로 가져오다가 오류
			int seq = 1;
			if(ir2.hasNext()) ir2.next();
			while (ir2.hasNext()) {
				MemberVO memberVO = ir2.next();
				System.out.printf("  [%d] %s\n", seq++, memberVO.getName());
			}
			*/
		}//while
	}
}//class