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

	@Override
	public String toString() {
		return "Match [id=" + id + ", participant=" + participant
				+ ", competition=" + competition + ", content=" + content
				+ ", attachmentUrl=" + attachmentUrl + ", createTime="
				+ createTime + "]";
	}
	
}
