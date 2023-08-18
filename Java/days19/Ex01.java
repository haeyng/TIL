package days19;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Arrays;
import java.util.Collections;
import java.util.StringJoiner;

public class Ex01 {

	public static void main(String[] args) {
		
		//파일을 읽어올때는 경로가 필요함
		
		String key = "user.dir";
		String userDir = System.getProperty(key);
		//System.out.println(userDir);
		String fileName = "1. Java 팀 구성.txt";
		String path = String.format("%s\\src\\days19\\%s", userDir,fileName); //전체 경로를 나타냄
		//System.out.println(path);

		//파일 안의 모든 내용을 출력
		
		String line = null;//라인단위로 처리하기 위한 변수
		
		try (FileReader fr = new FileReader(path);
				BufferedReader br = new BufferedReader(fr)) 
		{
			while ((line=br.readLine())!=null) { //파일의 끝을 만날때까지
				//System.out.println(line); //파일 모든 내용출력됨
				if (line.equals("1조")) {
					line = br.readLine();//다음 라인을 읽어옴
					System.out.println(line);
					break;
				} //if
			}//while
		} catch (Exception e) {
			e.printStackTrace();
		}
		// line 에는 "이경서(팀장), 신종혁, 이재영, 송해영 , 신기범, 이준희, 김성준";
		String regex = "\\s*,\\s*"; //공백 없게 ,로 자르기
		String [] teamMembers = line.split(regex);	
		String teamLeader=null;
		String [] teamMembers2 = new String [teamMembers.length-1];//팀장 제외한 팀원 배열
		for (int i = 0, index = 0; i < teamMembers.length; i++) {//팀장찾기
			if (teamMembers[i].contains("(팀장)")) {
				teamLeader = teamMembers[i]; //이경서(팀장)에서 (팀장)은 제거해야됨
				teamLeader = teamMembers[i].replace("(팀장)", "");
				//break;
				continue;
			} // if
			teamMembers2[index++] = teamMembers[i];
		} // for
		//System.out.println(">teamLeader : "+teamLeader);
		System.out.println(Arrays.toString(teamMembers2));
		
		//Arrays.sort(teamMembers2, Collections.reverseOrder());
		Arrays.sort(teamMembers2, (n1,n2)->n2.compareTo(n1));
		System.out.println(Arrays.toString(teamMembers2));
		
//		<ul>
//		<li class="leader">임경재</li>
//		<li>이지현</li>
//		<li>유희진</li>
//		<li>박민석</li>
//		<li>김호영</li>
//		<li>김정주</li>
//		<li>고경림</li>
//		</ul>
		
		/*
		String output = "<ul>";
		output += String.format("\r\n\t<li class=\"leader\">%s</li>", teamLeader);
		
		output +="\r\n\t<li>" + String.join("</li>\r\n\t<li>", teamMembers2)+"<li>";
		output += "\r\n<ul>";
		System.out.println(output);
		*/
		
		StringBuilder sb = new StringBuilder();
	      sb.append("<ul>");
	      sb.append(String.format("\r\n\t<li class=\"leader\">%s</li>", teamLeader ));
	      sb.append("\r\n\t<li>"+ String.join("</li>\r\n\t<li>", teamMembers2) + "</li>");
	      sb.append("\r\n</ul>");
	      
	      System.out.println( sb.toString() );

		
		
	}//main

}//class
