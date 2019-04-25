package com.example.vo;

import com.example.entity.Schedule;
import com.example.util.ScheduleUtils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Floyd
 * Date: 2019/2/1
 * Time: 8:32 PM
 */
public class ScheduleVO {
	private int id;
	private int pid;
	private String username;
	private String date;
	private String start;
	private String end;
	private String venue;
	private String event;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public ScheduleVO() {
	}

	public ScheduleVO(Schedule schedule) {
		this.id = schedule.getUid();
		this.pid = schedule.getPerson();
		this.date = formatDate(schedule.getDate().toLocalDate());
		this.event = schedule.getContent();
		this.venue = schedule.getVenue();
		this.start = schedule.getStart();
		this.end = schedule.getEnd();
	}

	private String formatDate(LocalDate date) {
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String day = date.format(dateFormat);
		String week = date.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.CHINA);
		return day + " " + week;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int personId) {
		this.pid = personId;
	}
}
