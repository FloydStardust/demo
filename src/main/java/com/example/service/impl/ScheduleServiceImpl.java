package com.example.service.impl;

import com.example.dao.ScheduleDao;
import com.example.entity.Schedule;
import com.example.service.ScheduleService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

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
		schedule.setCreator(currentUserHelper.currentUser().getId());
		return scheduleDao.insert(schedule);
	}

	@Override
	public ResultData deleteSchedule(int id) {
		if (permissionCheck(id)) {
			ResultData result = new ResultData();
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription("无权限操作");
			return result;
		}
		return scheduleDao.delete(id);
	}

	@Override
	public ResultData updateSchedule(Schedule schedule) {
		if (permissionCheck(schedule.getUid())) {
			ResultData result = new ResultData();
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription("无权限操作");
			return result;
		}
		return scheduleDao.update(schedule);
	}

	@Override
	public ResultData fetchSchedule() {
		Map<String, Object> condition = new HashMap<>();
		condition.put("creator", currentUserHelper.currentUser().getId());
		return scheduleDao.select(condition);
	}


	private boolean permissionCheck(int scheduleId) {
		ResultData result = scheduleDao.selectByUid(scheduleId);
		if (result.getResponseCode() == ResponseCode.RESPONSE_OK) {
			Schedule schedule = (Schedule) result.getData();
			return !schedule.getCreator().equals(currentUserHelper.currentUser().getId());
		} else {
			return true;
		}

	}

}
