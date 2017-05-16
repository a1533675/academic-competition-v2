package com.fuchen.academic.domain;

import java.util.Date;

/**
 * 比赛实体类
 */
public class Matches {

	private String id;
	
	/**
	 * 参赛者
	 */
	private Users participant;
	
	/**
	 * 竞赛项目
	 */
	private Competition competition;
	
	/**
	 * 提交内容
	 */
	private String content;
	
	/**
	 * 附件地址
	 */
	private String attachmentUrl;
	
	/**
	 * 提交时间
	 */
	private Date createTime;
	
	private Integer score1;
	
	private Integer score2;
	
	private Integer score3;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Users getParticipant() {
		return participant;
	}

	public void setParticipant(Users participant) {
		this.participant = participant;
	}

	public Competition getCompetition() {
		return competition;
	}

	public void setCompetition(Competition competition) {
		this.competition = competition;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getScore1() {
		return score1;
	}

	public void setScore1(Integer score1) {
		this.score1 = score1;
	}

	public Integer getScore2() {
		return score2;
	}

	public void setScore2(Integer score2) {
		this.score2 = score2;
	}

	public Integer getScore3() {
		return score3;
	}

	public void setScore3(Integer score3) {
		this.score3 = score3;
	}

	@Override
	public String toString() {
		return "Matches [id=" + id + ", participant=" + participant + ", competition=" + competition + ", content="
				+ content + ", attachmentUrl=" + attachmentUrl + ", createTime=" + createTime + ", score1=" + score1
				+ ", score2=" + score2 + ", score3=" + score3 + "]";
	}

	
}
