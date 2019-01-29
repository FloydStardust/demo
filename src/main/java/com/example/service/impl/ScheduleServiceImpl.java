package com.example.service.impl;

import com.example.dao.ScheduleDao;
import com.example.entity.Schedule;
import com.example.form.ScheduleQueryParam;
import com.example.service.ScheduleService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.time.temporal.WeekFields;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 10:58 AM
 */

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scheduleDao;

	@Autowired
	private CurrentUserHelper currentUserHelper;

	@Override
	public ResultData addSchedule(Schedule schedule) {
		schedule.setCreatorId(currentUserHelper.currentUser().getId());
		return scheduleDao.insert(schedule);
	}

	@Override
	public ResultData deleteSchedule(int id) {
		if (!permissionCheck(id)) {
			ResultData result = new ResultData();
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription("无权限操作");
			return result;
		}
		return scheduleDao.delete(id);
	}

	@Override
	public ResultData updateSchedule(Schedule schedule) {
		if (!permissionCheck(schedule.getUid())) {
			ResultData result = new ResultData();
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription("无权限操作");
			return result;
		}
		// 查询相同时期内是否有对应的日程安排，如果有，替换 并且删除当前记录
		ResultData result = scheduleDao.selectByUid(schedule.getUid());
		if (result.getResponseCode() == ResponseCode.RESPONSE_OK) {
			Schedule origin = (Schedule) result.getData();
			Map<String, Object> condition = new HashMap<>();
			condition.put("creatorId", currentUserHelper.currentUser().getId());
			condition.put("date", schedule.getDate() == null ? origin.getDate() : schedule.getDate());
			condition.put("start", schedule.getStart() == null ? origin.getStart() : schedule.getStart());
			condition.put("end", schedule.getEnd() == null ? origin.getEnd() : schedule.getEnd());

			result = scheduleDao.select(condition);
			if (result.getResponseCode() == ResponseCode.RESPONSE_NULL) {
				return scheduleDao.update(schedule);
			} else {
				Schedule updateSchedule = ((List<Schedule>) result.getData()).get(0);
				scheduleDao.delete(schedule.getUid());
				schedule.setUid(updateSchedule.getUid());
				return scheduleDao.update(schedule);
			}
		}

		return scheduleDao.update(schedule);
	}

	@Override
	public ResultData fetchSchedule(ScheduleQueryParam param) {
		Map<String, Object> condition = new HashMap<>();
		condition.put("creatorId", currentUserHelper.currentUser().getId());
		return scheduleDao.select(condition);
	}

	@Override
	public ResultData fetchScheduleWeekly() {
		Map<String, Object> condition = new HashMap<>();
		condition.put("creatorId", currentUserHelper.currentUser().getId());
		LocalDate today = LocalDate.now();
		LocalDate monday = today.with(DayOfWeek.MONDAY);
		LocalDate friday = today.with(DayOfWeek.FRIDAY);
		ResultData result = new ResultData();
		Map<String, List<Schedule>> schedules = new HashMap<>();

		for (LocalDate date = monday; date.compareTo(friday) <= 0; date = date.plusDays(1)) {
			condition.put("date", date);
			result = scheduleDao.select(condition);
			if (result.getResponseCode() == ResponseCode.RESPONSE_NULL) {
				schedules.put(formateDate(date), new ArrayList<>());
			} else {
				schedules.put(formateDate(date), (List<Schedule>) result.getData());
			}
		}

		result.setData(schedules);
		return result;
	}

	private boolean permissionCheck(int scheduleId) {
		ResultData result = scheduleDao.selectByUid(scheduleId);
		if (result.getResponseCode() == ResponseCode.RESPONSE_OK) {
			Schedule schedule = (Schedule) result.getData();
			return schedule.getCreatorId() == currentUserHelper.currentUser().getId();
		} else {
			return true;
		}
	}

	private String formateDate(LocalDate date) {
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String day = date.format(dateFormat);
		String week = LocalDate.now().getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.CHINA);
		return day + " " + week;
	}

}
