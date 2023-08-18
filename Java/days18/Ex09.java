package days18;

public class Ex09 {

	public static void main(String[] args) {

		//                StringBuffer,        StringBuilder 클래스
		// 차이점? 멀티스레드에 안전하고     안전하지 못함
		// 동기화 처리        O						 X
		
		//위의 두 클래스는 언제 사용하는지? String 변경 불가능한 클래스. 변경 가능한 클래스(삽입,수정,삭제,추가)
		//문자열 연결 될 때마다 라인 수 만큼 객체 생성이 됨 - 안좋은 코딩
		
		String sql = "SELECT "; 
        sql += "a.ano ";
        sql += " ";
        sql += ", a.user_id as userId ";
        sql += " ";
        sql += ", b.user_name as userName ";
        sql += " ";
        sql += ", a.rno ";
        sql += " ";
        sql += ", c.rname ";
        sql += " ";
        sql += ", DATE_FORMAT(a.sd,'%Y-%m-%d') as sd ";
        sql += " ";
        sql += ", DATE_FORMAT(a.ed,'%Y-%m-%d') as ed ";
        sql += " ";
        sql += ", DATE_FORMAT(a.rd,'%Y-%m-%d %T') as rd ";
        sql += " ";
        sql += ", DATE_FORMAT(a.check_in,'%Y-%m-%d %T') as checkIn ";
        sql += " ";
        sql += ", DATE_FORMAT(a.check_out,'%Y-%m-%d %T') as checkOut ";
        sql += " ";
        sql += "-- , a.sign_yn as signYn ";
        sql += " ";
        sql += ", d.code_name as signYn ";
        sql += " ";
        sql += "-- , a.cancel_yn as cancelYn ";
        sql += " ";
        sql += ", e.code_name as cancelYn ";
        sql += " ";
        sql += "FROM tb_reservation a left outer join tb_user b on a.user_id = b.user_id ";
        sql += " ";
        sql += "left outer join tb_rooms c on a.rno = c.rno ";
        sql += " ";
        sql += "left outer join tb_code d on a.sign_yn = d.code_cd ";
        sql += " ";
        sql += "left outer join tb_code e on a.cancel_yn = e.code_cd ";
        
		System.out.println(sql);
	}//main

}//class
