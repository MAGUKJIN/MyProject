package main.service;

import java.util.List;


//리턴 타입 int는 리턴타입이 없는 거 . 그냥 sql에서 성공실행 갯수리턴. void로 써도 됨.
public interface BoardService {
	public String insertBoard(BoardVO vo) throws Exception;  //저장처리
    public List<?> selectBoardList(BoardVO vo) throws Exception;  //목록뽑기
    public int selectBoardTotal(BoardVO vo) throws Exception; //토탈갯수 페이징
    public BoardVO selectBoardDetail(int unq) throws Exception; //상세보기
    public int updateBoardHits(int unq) throws Exception;//조회수증가
    public int updateBoard(BoardVO vo) throws Exception;//게시글 수정
    public int selectBoardPass(BoardVO vo) throws Exception;//암호체크
    public int deleteBoard(BoardVO vo) throws Exception;
}