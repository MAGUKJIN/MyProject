package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.antlr.grammar.v3.ANTLRParser.exceptionGroup_return;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
public class DeptController {
	
	@Resource(name="deptService")
	private DeptService deptService;
	
	@RequestMapping(value = "/deptWrite.do")
	public String deptWrtie() {
		return "dept/deptWrite";
	}
	
	@RequestMapping(value= "deptWriteSave.do")
	public String InsertDept(DeptVO vo) throws Exception {
		
		System.out.println("부서번호는"+vo.getDeptno()+"입니다.");
		System.out.println("부서이름은"+vo.getDname()+"입니다.");
		System.out.println("부서위치는"+vo.getLoc()+"입니다.");
		
		String result = deptService.InsertDept(vo);
		if(result == null) {
			
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		return "";
		
	}
	
	@RequestMapping(value = "/deptList.do")     /* 자바의 데이터를 jsp로 전달하는게 모델맵 */
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception {
		
		List<?> list = deptService.SelectDeptList(vo);
		model.addAttribute("resultList", list);  //모델을 통해서만 데이터가 jsp로 전달죔
		return "dept/deptList";
			
	}
	
	@RequestMapping(value="/deptDetail.do")
	public String selectDeptDetail(int deptno, ModelMap model) throws Exception {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		 
		
		model.addAttribute("deptVO",vo);
		return "dept/deptDetail";
	}
	
    @RequestMapping (value= "/deptDelete.do")
    public String deleteDept(int deptno) throws Exception{
    	int result = deptService.deleteDept(deptno);
   
    	return "";   	
    }
    
    @RequestMapping (value= "/deptModify.do")
    public String selectDeptModify(int deptno, ModelMap model) throws Exception{
    	 DeptVO vo = deptService.selectDeptDetail(deptno);
    	 model.addAttribute("vo",vo);
    	return "dept/deptModify";
    }
    
    @RequestMapping (value = "/deptModifySave.do")
    public String updateDept(DeptVO vo) throws Exception{
    	
    	int result = deptService.updateDept(vo);
    	
    	return "";
    	
    }
}
