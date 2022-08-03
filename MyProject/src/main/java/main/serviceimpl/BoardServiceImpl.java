package main.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

@Resource(name="boardDAO")
public BoardDAO boardDAO;
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
	
		return boardDAO.insertBoard(vo);
	}

	@Override
	public List<?> selectBoardList(BoardVO vo) throws Exception {
	 
		return boardDAO.selectBoardList(vo); 
	}

	@Override
	public int selectBoardTotal(BoardVO vo) throws Exception {
		 
		return boardDAO.selectBoardTotal(vo); 
	}

	@Override
	public BoardVO selectBoardDetail(int unq) throws Exception {
		
		return boardDAO.selectBoardDetail(unq);
	}

	@Override
	public int updateBoardHits(int unq) throws Exception {
		
		return boardDAO.updateBoardHits(unq);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		
		return boardDAO.updateBoard(vo);
	}

	@Override
	public int selectBoardPass(BoardVO vo) throws Exception {
		 
		return boardDAO.selectBoardPass(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) throws Exception {
		 
		return boardDAO.deleteBoard(vo);
	}

}
