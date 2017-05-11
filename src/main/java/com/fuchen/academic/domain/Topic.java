package com.fuchen.academic.domain;

import java.util.Date;

/**
 * 话题实体类
 * @author
 *
 */
public class Topic {

	private String id;
	
	/**
	 * 创建人
	 */
	private Users users;
	
	private String title;
	
	private String content;
	
	private Date createTime;

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
	
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Topic [id=" + id + ", users=" + users + ", title=" + title
				+ ", content=" + content + ", createTime=" + createTime + "]";
	}

	
}
