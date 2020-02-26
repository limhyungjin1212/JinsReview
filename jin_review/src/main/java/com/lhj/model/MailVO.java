package com.lhj.model;

public class MailVO {
	private String to;	// 받는사람
	private String subject;	// 제목
	private String content;	// 내용
	private String from;	// 보내는 사람
	
	
	public String getTo() {
		return to;
	}
	
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	
	@Override
	public String toString() {
		return "MailVO [to=" + to + ", subject=" + subject + ", content=" + content + ", from=" + from + "]";
	}
	
}
