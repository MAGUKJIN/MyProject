package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "Board/boardWrite";
	}
	
	@RequestMapping ("/boardWriteSave.do")
	@ResponseBody //비동기데이터 전송 결과 값을 리턴할때, 동기데이터는 model로 전송
	public String insertBoard(BoardVO vo) throws Exception{
		
		
		String result = boardService.insertBoard(vo);
		String msg = "";
		if(result == null) {
			msg = "ok";
		}else {
			msg = "fail";
		}
		return msg;	
	}
	
	@RequestMapping("/boardList.do")
	public String selectBoardList(BoardVO vo,ModelMap model) throws Exception{
		
		
		//페이징처리
		int unit = 10;
		int total = boardService.selectBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/unit);
		
		int viewPage = vo.getViewPage();	
		if(viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}
		
		int startIndex = (viewPage-1) * unit + 1;
		int endIndex = startIndex + (unit - 1);
		
		int startRn = total - (viewPage-1)*unit;
		
		
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
	
		
		List<?> list = boardService.selectBoardList(vo);
		 
	    model.addAttribute("startRn",startRn);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("ResultList",list);
		
             return "Board/boardList";
 }
	
	@RequestMapping("/boardDetail.do")
	public String selectBoardDetail(BoardVO vo, ModelMap model) throws Exception{
		
		boardService.updateBoardHits(vo.getUnq());
		BoardVO boardVO = boardService.selectBoardDetail(vo.getUnq());
		
		
		  String content = boardVO.getContent();
		  boardVO.setContent(content.replace("\n", "<br>"));
		 
		model.addAttribute("boardVO",boardVO);
		 
		return "Board/boardDetail";
	}
	@RequestMapping("/boardModify.do")
	  public String selectBoardModify(BoardVO vo, ModelMap model) throws Exception{
		BoardVO boardVO = boardService.selectBoardDetail(vo.getUnq());
		model.addAttribute("boardVO",boardVO);
		
		 return "Board/boardModify";	
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateBoard(BoardVO vo) throws Exception {
		int result = 0;

		int count = boardService.selectBoardPass(vo);  
		if ( count == 1 ) {
			result = boardService.updateBoard(vo);
		} else {
			result = -1;
		}
		
	
		return result+"";
	}
	
	
	 @RequestMapping("/passWrite.do") 
	 public String passWrite(int unq, ModelMap model) { //DB연동이 아니라 throw 처리 안함.
	 
	 model.addAttribute("unq",unq);
	 return "Board/passWrite"; 
   }
	 
	 @RequestMapping("/boardDelete.do")
	 @ResponseBody
	 public String deleteBoard(BoardVO vo)throws Exception{
		 
		 int result = 0;
		 
		 int count = boardService.selectBoardPass(vo); //암호 일치검사 실행, 암호가 맞으면 count=1
		 if(count == 1) {
			  result = boardService.deleteBoard(vo);  
		 }else if(count == 0) {
			 result = -1;
		 }
		 return   result+"";	 
		 
	 }
}