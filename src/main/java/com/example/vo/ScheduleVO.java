package com.example.vo;

import com.example.entity.Schedule;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/2/1
 * Time: 8:32 PM
 */
public class ScheduleVO {
	private int id;
	private String username;
	private String date;
	private int start;
	private int end;
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

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
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
}
