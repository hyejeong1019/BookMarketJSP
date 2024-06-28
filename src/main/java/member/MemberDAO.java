package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnection;
import common.OracleJDBConnection;

public interface MemberDAO {
	public int insert(Member member);
	public Member select(int no);
	public Member select(String id, String password);
	public List<Member> selectAll();
	public int delete(int no);
	public int update(Member member);	
}
