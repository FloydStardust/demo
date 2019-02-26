package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.UserDao;
import com.example.entity.User;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Floyd
 * Date: 2019/1/27
 * Time: 10:32 AM
 * 用户查找类
 */

@Repository
public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public ResultData queryUser(Map<String, Object> condition) {
		ResultData result = new ResultData();
		try {
			List<User> list = sqlSession.selectList("vkc.user.query", condition);
			if (list.isEmpty()) {
				result.setResponseCode(ResponseCode.RESPONSE_NULL);
			}
			result.setData(list);
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}

	@Override
	public ResultData insertUser(User user) {
		ResultData result = new ResultData();
		try {
			sqlSession.insert("vkc.user.insert", user);
			result.setData(user);
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}

	@Override
	public ResultData queryUsers(List<Integer> ids) {
		ResultData result = new ResultData();
		try {
			List<User> list = sqlSession.selectList("vkc.user.queryByUids", ids);
			if (list.isEmpty()) {
				result.setResponseCode(ResponseCode.RESPONSE_NULL);
			}
			result.setData(list);
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}

	@Override
	public ResultData selectAll() {
		ResultData result = new ResultData();
		try {
			List<User> list = sqlSession.selectList("vkc.user.selectAll");
			if (list.isEmpty()) {
				result.setResponseCode(ResponseCode.RESPONSE_NULL);
			}
			result.setData(list);
		} catch (Exception e) {
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription(e.getMessage());
		}
		return result;
	}
}
