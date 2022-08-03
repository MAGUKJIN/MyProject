package egovframework.example.sample.service;

import java.util.List;


public interface DeptService {
	public String InsertDept(DeptVO vo) throws Exception; //메소드 소문자여야됨
	public List<?> SelectDeptList(DeptVO vo)throws Exception; //메소드 소문자여야됨
    public DeptVO selectDeptDetail(int deptno) throws Exception;
    public int deleteDept(int deptno) throws Exception;  //출력이 아니라면 결과(몇개를 삭제,업뎃했는지) 그 갯수를 받아와야해서 int
    public int updateDept(DeptVO vo) throws Exception;
}
