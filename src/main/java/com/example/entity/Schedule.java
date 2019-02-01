package com.example.entity;

import java.sql.Date;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 9:46 AM
 * 日程表
 */
public class Schedule extends Entity {
	private int uid;
	private Date date;
	private Integer start;
	private Integer end;

	private int creatorId;
	private String content;
	private String venue;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(Integer creatorId) {
		this.creatorId = creatorId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}
}
