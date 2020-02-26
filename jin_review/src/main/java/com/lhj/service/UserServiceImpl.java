package com.lhj.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lhj.mapper.UserMapper;
import com.lhj.model.Criteria;
import com.lhj.model.LoginVO;
import com.lhj.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper um;

	@Override
	public UserVO login(LoginVO lvo) throws Exception {
		return um.login(lvo);
	}

	@Override
	public void join(UserVO uvo) throws Exception {
		um.join(uvo);
	}

	@Override
	public int nameCheck(String uname) throws Exception {
		return um.nameCheck(uname);
	}

	@Override
	public int idCheck(String uid) throws Exception {
		return um.idCheck(uid);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		um.keepLogin(uid, sessionId, next);
	}


	@Override
	public UserVO checkLoginBefore(String value) {
		return um.checkUserWithSessionKey(value);
	}

	@Override
	public UserVO userDetail(String uname) throws Exception {
		return um.userDetail(uname);
	}

	@Override
	public void follow(String uname, String myname) throws Exception {
		um.follow(uname, myname);
	}

	@Override
	public List<UserVO> followList(String uid) throws Exception {
		return um.followList(uid);
	}

	@Override
	public List<UserVO> followerList(String uid) throws Exception {
		return um.followerList(uid);
	}

	@Override
	public List<UserVO> userList(Criteria cri) throws Exception {
		return um.userList(cri);
	}

	@Override
	public int userCnt() throws Exception {
		return um.userCnt();
	}

	@Override
	public void user_profile(UserVO uv) throws Exception {
		um.user_profile(uv);
	}

	@Override
	public void unfollow(String uname, String myname) throws Exception {
		um.unfollow(uname, myname);
	}

	@Override
	public UserVO userIdFind(UserVO uv) throws Exception {
		return um.userIdFind(uv);
	}

	@Override
	public UserVO userPwFind(UserVO uv) throws Exception {
		return um.userPwFind(uv);
	}
	
}
