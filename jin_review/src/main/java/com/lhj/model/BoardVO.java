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
	
	private String openMon,closeMon;
	private String openTue,closeTue;
	private String openWed,closeWed;
	private String openThu,closeThu;
	private String openFri,closeFri;
	private String openSat,closeSat;
	private String openSun,closeSun;
	
	private String pevent;
	private String pevent_file;
	private String pevent_info;
	
	private String pef;
	
	private String pevent_startDay;
	private String pevent_endDay;
	
	
	
	public String getPevent_startDay() {
		return pevent_startDay;
	}
	public void setPevent_startDay(String pevent_startDay) {
		this.pevent_startDay = pevent_startDay;
	}
	public String getPevent_endDay() {
		return pevent_endDay;
	}
	public void setPevent_endDay(String pevent_endDay) {
		this.pevent_endDay = pevent_endDay;
	}
	public String getPef() {
		return pef;
	}
	public void setPef(String pef) {
		this.pef = pef;
	}
	public String getPevent_info() {
		return pevent_info;
	}
	public void setPevent_info(String pevent_info) {
		this.pevent_info = pevent_info;
	}
	public String getPevent() {
		return pevent;
	}
	public void setPevent(String pevent) {
		this.pevent = pevent;
	}
	
	public String getPevent_file() {
		return pevent_file;
	}
	public void setPevent_file(String pevent_file) {
		this.pevent_file = pevent_file;
	}
	public String getOpenMon() {
		return openMon;
	}
	public void setOpenMon(String openMon) {
		this.openMon = openMon.substring(0,5);
	}
	public String getCloseMon() {
		return closeMon;
	}
	public void setCloseMon(String closeMon) {
		this.closeMon = closeMon;
	}
	public String getOpenTue() {
		return openTue;
	}
	public void setOpenTue(String openTue) {
		this.openTue = openTue;
	}
	public String getCloseTue() {
		return closeTue;
	}
	public void setCloseTue(String closeTue) {
		this.closeTue = closeTue;
	}
	public String getOpenWed() {
		return openWed;
	}
	public void setOpenWed(String openWed) {
		this.openWed = openWed;
	}
	public String getCloseWed() {
		return closeWed;
	}
	public void setCloseWed(String closeWed) {
		this.closeWed = closeWed;
	}
	public String getOpenThu() {
		return openThu;
	}
	public void setOpenThu(String openThu) {
		this.openThu = openThu;
	}
	public String getCloseThu() {
		return closeThu;
	}
	public void setCloseThu(String closeThu) {
		this.closeThu = closeThu;
	}
	public String getOpenFri() {
		return openFri;
	}
	public void setOpenFri(String openFri) {
		this.openFri = openFri;
	}
	public String getCloseFri() {
		return closeFri;
	}
	public void setCloseFri(String closeFri) {
		this.closeFri = closeFri;
	}
	public String getOpenSat() {
		return openSat;
	}
	public void setOpenSat(String openSat) {
		this.openSat = openSat;
	}
	public String getCloseSat() {
		return closeSat;
	}
	public void setCloseSat(String closeSat) {
		this.closeSat = closeSat;
	}
	public String getOpenSun() {
		return openSun;
	}
	public void setOpenSun(String openSun) {
		this.openSun = openSun;
	}
	public String getCloseSun() {
		return closeSun;
	}
	public void setCloseSun(String closeSun) {
		this.closeSun = closeSun;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public double getRate() {
		return Math.ceil(rate*2)/2; //由щ럭 珥� �룊�젏�쓣 0.5�떒�쐞濡� �굹���궡湲� �쐞�븿
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
		System.out.println(fn+"이것은 fn");
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
				+ ", regdate=" + regdate + ", place=" + place + ", fn=" + fn + ", rate=" + rate + ", rcnt=" + rcnt
				+ ", files=" + Arrays.toString(files) + ", openMon=" + openMon + ", closeMon=" + closeMon + ", openTue="
				+ openTue + ", closeTue=" + closeTue + ", openWed=" + openWed + ", closeWed=" + closeWed + ", openThu="
				+ openThu + ", closeThu=" + closeThu + ", openFri=" + openFri + ", closeFri=" + closeFri + ", openSat="
				+ openSat + ", closeSat=" + closeSat + ", openSun=" + openSun + ", closeSun=" + closeSun + "]";
	}
	
	
}
