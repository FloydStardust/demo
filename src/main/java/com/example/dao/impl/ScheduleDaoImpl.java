package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.ScheduleDao;
import com.example.entity.Schedule;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 10:41 AM
 */

@Repository
public class ScheduleDaoImpl extends BaseDao implements ScheduleDao {

	@Override
	public ResultData select(Map<String, Object> condition) {
		ResultData result = new ResultData();
		try {
			List<Schedule> list = sqlSession.selectList("vkc.schedule.select", condition);
			if (list.isEmpty()) {
				result.setResponseCode(ResponseCode.RESPONSE_NULL);
			} else {
				result.setData(list);
			}
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}

	@Override
	public ResultData selectByUid(int uid) {
		ResultData result = new ResultData();
		try {
			List<Schedule> list = sqlSession.selectList("vkc.schedule.selectByUid", uid);
			if (list.isEmpty()) {
				result.setResponseCode(ResponseCode.RESPONSE_NULL);
			} else {
				result.setData(list.get(0));
			}
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}

	@Override
	public ResultData insert(Schedule schedule) {
		ResultData result = new ResultData();
		try {
			sqlSession.insert("vkc.schedule.insert", schedule);
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}

	@Override
	public ResultData update(Schedule schedule) {
		ResultData result = new ResultData();
		try {
			sqlSession.insert("vkc.schedule.update", schedule);
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}

	@Override
	public ResultData delete(int uid) {
		ResultData result = new ResultData();
		try {
			sqlSession.insert("vkc.schedule.delete", uid);
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}
}
