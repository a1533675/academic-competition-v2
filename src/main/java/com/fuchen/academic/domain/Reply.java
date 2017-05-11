package com.fuchen.academic.domain;

import java.util.Date;

/**
 * 回复实体类
 * @author
 *
 */
public class Reply {

	private String id;
	
	/**
	 * 话题ID
	 */
	private Topic topic;
	
	/**
	 * 用户ID
	 */
	private Users users;
	
	/**
	 * 回复内容
	 */
	private String content;
	
	/**
	 * 创建时间
	 */
	private Date createTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
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

	@Override
	public String toString() {
		return "Reply [id=" + id + ", topic=" + topic + ", users=" + users
				+ ", content=" + content + ", createTime=" + createTime + "]";
	}
	
	
}
