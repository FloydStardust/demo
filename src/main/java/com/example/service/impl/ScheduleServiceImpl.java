package com.example.service.impl;

import com.example.dao.ScheduleDao;
import com.example.entity.Schedule;
import com.example.entity.User;
import com.example.form.ScheduleQueryParam;
import com.example.service.ScheduleService;
import com.example.service.UserService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.vo.ScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by IntelliJ IDEA.
 * User: Floyd
 * Date: 2019/1/29
 * Time: 10:58 AM
 */

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scheduleDao;

	@Autowired
	private CurrentUserHelper currentUserHelper;

	@Autowired
	private UserService userService;

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
		} else {
			return scheduleDao.update(schedule);
		}
	}

	@Override
	public ResultData fetchSchedule(ScheduleQueryParam param) {
		Map<String, Object> condition = new HashMap<>();
		return scheduleDao.select(condition);
	}

	@Override
	public ResultData fetchScheduleWeekly() {
		Map<String, Object> condition = new HashMap<>();

		LocalDate today = LocalDate.now();
		LocalDate monday = today.with(DayOfWeek.MONDAY);
		LocalDate sunday = today.with(DayOfWeek.SUNDAY);
		condition.put("startDate", monday);
		condition.put("endDate", sunday);
		ResultData result = scheduleDao.select(condition);

		if (result.getResponseCode() == ResponseCode.RESPONSE_OK) {
			List<Schedule> list = (List<Schedule>) result.getData();
			List<Integer> userIds = list.stream().map(Schedule::getCreatorId).collect(Collectors.toList());
			Map<Integer, String> userMap = ((List<User>) userService.findByIds(userIds).getData()).stream()
					.collect(Collectors.toMap(User::getId, User::getUserName));
			List<ScheduleVO> data = new ArrayList<>();
			for (Schedule schedule : list) {
				ScheduleVO scheduleVO = new ScheduleVO(schedule);
				scheduleVO.setUsername(userMap.get(schedule.getCreatorId()));
				data.add(scheduleVO);
			}
			result.setData(data);
		}
		return result;
	}

	private boolean permissionCheck(int scheduleId) {
		ResultData result = scheduleDao.selectByUid(scheduleId);
		if (result.getResponseCode() == ResponseCode.RESPONSE_OK) {
			Schedule schedule = (Schedule) result.getData();
			return schedule.getCreatorId() == currentUserHelper.currentUser().getId();
		} else {
			return false;
		}
	}



}
