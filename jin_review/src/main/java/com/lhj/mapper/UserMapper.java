package com.lhj.mapper;

import java.util.Date;
import java.util.List;

import com.lhj.model.Criteria;
import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;

public interface UserMapper {
	
	//로그인
	public UserVO login(LoginVO lvo) throws Exception;
	
	//회원가입
	public void join(UserVO uvo) throws Exception;
	
	//닉네임 중복검사
	public int nameCheck(String uname) throws Exception;
	
	//id 중복검사
	public int idCheck(String uid) throws Exception;
	
	//로그인 유지
	public void keepLogin(String uid,String sessionId,Date next);
	
	public UserVO checkUserWithSessionKey(String value);
	
	//유저의 프로필
	public UserVO userDetail(String uname) throws Exception;
	
	//팔로우신청
	public void follow(String uname, String myname) throws Exception;
	
	//팔로우 해제
	public void unfollow(String uname,String myname) throws Exception;
	
	//팔로우 목록
	public List<UserVO> followList(String uid)throws Exception;
	
	//팔로워 목록
	public List<UserVO> followerList(String uid)throws Exception;
	
	//관리자 페이지 유저 리스트
	public List<UserVO> userList(Criteria cri) throws Exception;
	
	//회원의 총 카운트
	public int userCnt() throws Exception;
	
	//유저 프로필 사진 및 정보 업데이트
	public void user_profile(UserVO uv) throws Exception;
	
	//유저 Id 찾기
	public UserVO userIdFind(UserVO uv) throws Exception;
	
	//유저 Pw 찾기
	public UserVO userPwFind(UserVO uv) throws Exception;
}
