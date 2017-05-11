package com.fuchen.academic.domain;

import java.util.Date;

/**
 * 系统公告
 */
public class Notice {
	
	private String id;
	
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

	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", content=" + content
				+ ", createTime=" + createTime + ", attachmentUrl="
				+ attachmentUrl + "]";
	}
	
	
}
