package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnection;
import common.OracleJDBConnection;

public interface MemberDAO {
	
	public int deleteMember(int no);
	public int updateMember(Member member);	
	public int insertMember(Member member);
	public List<Member> selectMemberAll();
	public Member selectMember(int no);
	
}
