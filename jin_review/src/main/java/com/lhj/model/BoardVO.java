package com.lhj.model;

import java.util.Arrays;

public class BoardVO {
	
	private int pno;
	private String pname;
	private String pcate;
	private String ptel;
	private String pinfo;
	private String regdate;
	private String place;
	
	private String fn;
	private double rate;
	
	private int rcnt;
	
	private String[] files;
	
	
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public double getRate() {
		return Math.ceil(rate*2)/2; //리뷰 총 평점을 0.5단위로 나타내기 위함
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcate() {
		return pcate;
	}
	public void setPcate(String pcate) {
		this.pcate = pcate;
	}
	public String getPtel() {
		return ptel;
	}
	public void setPtel(String ptel) {
		this.ptel = ptel;
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	
	
	public String getFn() {
		String front = fn.substring(0,12);
		String end = fn.substring(14);
		System.out.println(front+end);
		
		return front+end;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	@Override
	public String toString() {
		return "BoardVO [pno=" + pno + ", pname=" + pname + ", pcate=" + pcate + ", ptel=" + ptel + ", pinfo=" + pinfo
				+ ", regdate=" + regdate + ", place=" + place + ", fn=" + fn + ", files=" + Arrays.toString(files)
				+ "]";
	}
	
	
}
