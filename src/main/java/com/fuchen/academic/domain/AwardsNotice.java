package com.fuchen.academic.domain;

import java.util.Date;

/**
 * 获奖通知
 */
public class AwardsNotice {

	private String id;
	
	/**
	 * 发布获奖者
	 */
	private Users publisher;
	
	/**
	 * 比赛项目
	 */
	private Competition competition;
	
	/**
	 * 主题
	 */
	private String title;
	
	/**
	 * 内容
	 */
	private String content;
	
	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 附件地址
	 */
	private String attachmentUrl;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}
	
	public Competition getCompetition() {
		return competition;
	}

	public void setCompetition(Competition competition) {
		this.competition = competition;
	}

	public Users getPublisher() {
		return publisher;
	}

	public void setPublisher(Users publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "AwardsNotice [id=" + id + ", publisher=" + publisher
				+ ", competition=" + competition + ", title=" + title
				+ ", content=" + content + ", createTime=" + createTime
				+ ", attachmentUrl=" + attachmentUrl + "]";
	}

}
