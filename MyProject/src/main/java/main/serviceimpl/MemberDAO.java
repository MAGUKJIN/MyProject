package main.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

@Repository
public class MemberDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberIdCheck(String userid) {
		 
		return (int) select("memberDAO.selectMemberIdCheck",userid);
	}

	public List<?> selectPostList(String dong) {
		 
		 return list("memberDAO.selectPostList",dong);  //목록출력 메소드
	}

	public int selectMemberCount(MemberVO vo) {
		
		return (int) select("memberDAO.selectMemberCount",vo);
	}

}
