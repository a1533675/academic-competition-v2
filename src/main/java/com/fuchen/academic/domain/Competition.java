package com.fuchen.academic.domain;

import java.util.Date;

/**
 * 比赛项目
 */
public class Competition {

	/**
	 * 主键ID
	 */
	private String id;
	
	/**
	 * 发布人ID
	 */
	private Users publisher;
	
	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 项目描述
	 */
	private String content;
	
	/**
	 * 比赛开始时间
	 */
	private Date startTime;
	
	/**
	 * 比赛结束时间
	 */
	private Date endTime;
	
	/**
	 * 报名开始时间
	 */
	private Date enrollStartTime;
	
	/**
	 * 报名结束时间
	 */
	private Date enrollEndTime;
	
	/**
	 * 比赛地点
	 */
	private String position;
	
	/**
	 * 附件URL
	 */
	private String attachmentUrl;
	
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	/**
	 * 是否结束
	 */
	private Boolean finished;
	
	/**
	 * 审核步骤
	 * 0 开始 1 一级审核 2 二级审核 3 三级审核 -1 拒绝
	 */
	private Integer checkStep;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Users getPublisher() {
		return publisher;
	}

	public void setPublisher(Users publisher) {
		this.publisher = publisher;
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

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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

	public Boolean getFinished() {
		return finished;
	}

	public void setFinished(Boolean finished) {
		this.finished = finished;
	}

	public Integer getCheckStep() {
		return checkStep;
	}

	public void setCheckStep(Integer checkStep) {
		this.checkStep = checkStep;
	}

	public Date getEnrollStartTime() {
		return enrollStartTime;
	}

	public void setEnrollStartTime(Date enrollStartTime) {
		this.enrollStartTime = enrollStartTime;
	}

	public Date getEnrollEndTime() {
		return enrollEndTime;
	}

	public void setEnrollEndTime(Date enrollEndTime) {
		this.enrollEndTime = enrollEndTime;
	}

	@Override
	public String toString() {
		return "Competition [id=" + id + ", publisher=" + publisher + ", title=" + title + ", content=" + content
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", enrollStartTime=" + enrollStartTime
				+ ", enrollEndTime=" + enrollEndTime + ", position=" + position + ", attachmentUrl=" + attachmentUrl
				+ ", createTime=" + createTime + ", finished=" + finished + ", checkStep=" + checkStep + "]";
	}


	
	
	
}
