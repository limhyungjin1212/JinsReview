package com.lhj.model;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private String uid,upw,uname,umail,gender,follow,follower,regdate;
	private String user_info;
	private String file;
	private int ffcnt; //팔로워리스트의 팔로워카운트
	private int frcnt; //팔로워리스트의 리뷰 카운트
	
	

	public int getFrcnt() {
		return frcnt;
	}

	public void setFrcnt(int frcnt) {
		this.frcnt = frcnt;
	}

	public int getFfcnt() {
		return ffcnt;
	}

	public void setFfcnt(int ffcnt) {
		this.ffcnt = ffcnt;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	public String getFollow() {
		return follow;
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	
	public String getUmail() {
		return umail;
	}

	public void setUmail(String umail) {
		this.umail = umail;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public String getUser_info() {
		return user_info;
	}

	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}

	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", umail=" + umail + ", gender=" + gender
				+ ", follow=" + follow + ", follower=" + follower + ", regdate=" + regdate + ", user_info=" + user_info
				+ ", file=" + file + ", ffcnt=" + ffcnt + "]";
	}
	
}
