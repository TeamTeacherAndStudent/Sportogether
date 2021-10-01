package member.model.service;

import java.sql.Connection;

import member.model.vo.Member;

public class MemberService {

	//회원 가입
	public int registerMember(Member member) {
		int result = 0;
		Connection conn = null;
		
		
		return 0;
	} 
	
	
	//Login 
	//login page에서 id와 pw를 받아와 해당하는 회원 정보를  DB에서 가져와
	//세션에 저장( 아이디, 닉네임, 선수여부, 관리자여부 )
	public Member printOneLogin(String userId, String userPw) {
		
		
		return null;
	}

}
