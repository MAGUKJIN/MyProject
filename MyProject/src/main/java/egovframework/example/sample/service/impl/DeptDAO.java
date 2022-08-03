package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;



@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {

	public String InsertDept(DeptVO vo) {
		 
		return (String) insert("deptDAO.InsertDept",vo); //ibatis 안의 여러 sql중에 하나를 정해야 함
}

	public List<?> SelectDeptList(DeptVO vo) {
		
		return (List<?>) list("deptDAO.SelectDeptList",vo); //list도 메소드임 EgovAbstractDAO여기에 정의
}

	public DeptVO selectDeptDetail(int deptno) {
		
		return (DeptVO) select("deptDAO.selectDeptDetail",deptno);
	}

	public int deleteDept(int deptno) {
		
		return (int) delete("deptDAO.deleteDept",deptno);
	}

	public int updateDept(DeptVO vo) {
		
		return update("deptDAO.updateDept",vo);
	}

}
