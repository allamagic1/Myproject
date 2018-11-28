package com.bit.test.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.test.model.entity.VoAdBBS;
import com.bit.test.model.entity.VoBBS;
import com.bit.test.model.entity.VoComment;
import com.bit.test.model.entity.VoMyAdBBS;
import com.bit.test.model.entity.VoMyBBS;
import com.bit.test.model.entity.VoMyHP;
import com.bit.test.model.entity.VoReview;
import com.bit.test.model.entity.VoUsers;

public interface Dao {
	// 게시판 리스트 호출
	List<VoBBS> selectList(int start, int end) throws SQLException;

	// 게시판 글 검색 리스트 호출
	List<VoBBS> select(String select, String text, int start, int end) throws SQLException;

	// 검색 후 페이징을위한 카운트
	int selectCount(String select, String text) throws SQLException;

	// 게시판 글작성
	int insertOne(VoBBS bbs) throws SQLException;

	// 게시판 글 수정
	int updateOne(VoBBS bbs) throws SQLException;

	// 게시판 글 삭제
	int deleteOne(int idx) throws SQLException;

	// 상세보기
	VoBBS selectOne(int idx) throws SQLException;
	//광고게시판 상세보기
	VoAdBBS selectOne_adbbs(int idx) throws SQLException;
	
	// 페이징을 위한 게시판 전체 글 카운트
	int allCount() throws SQLException;

	// 조회수
	int hitup(int idx) throws SQLException;

	// 회원가입
	int signup(VoUsers users) throws SQLException;

	// 회원가입할때 email 중복체크
	VoUsers signupcek(VoUsers users) throws SQLException;

	// 로그인처리
	VoUsers login(VoUsers users) throws SQLException;

	// 댓글 출력
	List<VoComment> commentList(int idx) throws SQLException;

	// 댓글 입력
	int commentAdd(VoComment comment) throws SQLException;
	
	//댓글 삭제
	int commentDelete(int key);
	//글 삭제할때 댓글 전부 삭제
	int commentDeleteAll(int idx);
	
	//건강정보 게시판 즐겨찾기 추가
	int addMyBBS(VoMyBBS vomybbs) throws SQLException;
	//건강정보 게시판 디테일
	VoMyBBS myBBS(VoMyBBS vomybbs) throws SQLException;
	//건강정보 게시판에 즐겨 찾기 해제
	int delMyBBS(VoMyBBS vomybbs) throws SQLException;
	//글삭제 할때 즐겨 찾기 삭제
	int bbsdel(VoMyBBS vomybbs) throws SQLException;
	
	//광고게시판 디테일
	VoMyAdBBS myAdBBS(VoMyAdBBS vomybbs) throws SQLException;
	//광고 게시판 즐겨찾기 추가
	int addMyAdBBS(VoMyAdBBS vomyadbbs) throws SQLException;
	//광고 게시판에 즐겨 찾기 해제
	int delMyAdBBS(VoMyAdBBS vomyadbbs) throws SQLException;
	//광고 글삭제 할때 즐겨 찾기 삭제
	int AdBbsdel(VoAdBBS voadbbs) throws SQLException;
	
	//광고 글 추가
	int adAdd(VoAdBBS voadbbs) throws SQLException;
	//광고 글 출력
	List<VoAdBBS> adlist() throws SQLException;
	List<VoAdBBS> adlistplus(VoAdBBS voadbbs) throws SQLException;
	
	//즐겨찾기한 건강정보 게시판 가져오기
	List<VoBBS> selMyBBS(String id) throws SQLException;
	//즐겨찾기한 광고게시판 가져오기
	List<VoAdBBS> selMyADBBS(String id) throws SQLException;
	//즐겨찾기한 병원/약국 가져오기
	List<VoMyHP> selMyHP(String id) throws SQLException;
	
	//즐겨찾기
	VoMyHP myhpselect(VoMyHP hp) throws SQLException;
	int myhpdel(VoMyHP hp) throws SQLException;
	int myhpadd(VoMyHP hp) throws SQLException;
	
	//리뷰,평점 입력
	int addReview(VoReview review) throws SQLException;
	//리뷰,평점 보기
	List<VoReview> selReview(String key) throws SQLException;
	//내가쓴 리뷰 보기
	List<VoReview> mypage_Review(String id) throws SQLException;
	//리뷰,평점 수정
	int editReview(VoReview review) throws SQLException;
	//리뷰,평점 삭제
	int deleteReview(int idx) throws SQLException;
	
	//내가 쓴 게시판글 보기
	List<VoBBS> mypage_BBS(String id) throws SQLException;
}
