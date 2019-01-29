package com.example.dao;

import com.example.entity.Schedule;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 10:40 AM
 */
public interface ScheduleDao {

	ResultData select(Map<String, Object> condition);

	ResultData selectByUid(int uid);

	ResultData insert(Schedule schedule);

	ResultData update(Schedule schedule);

	ResultData delete(int uid);
}
