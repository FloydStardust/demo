package com.example.service;

import com.example.entity.Schedule;
import com.example.util.ResultData;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 10:57 AM
 */
public interface ScheduleService {

	ResultData addSchedule(Schedule schedule);

	/**
	 * 权限检查
	 * @param id
	 * @return
	 */
	ResultData deleteSchedule(int id);

	/**
	 * 权限检查
	 * @param schedule
	 * @return
	 */
	ResultData updateSchedule(Schedule schedule);

	ResultData fetchSchedule();
}
