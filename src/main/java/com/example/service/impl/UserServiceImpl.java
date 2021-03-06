package com.example.service.impl;

import com.example.dao.AuthorizationDao;
import com.example.dao.UserDao;
import com.example.entity.Authorization;
import com.example.entity.User;
import com.example.service.UserService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Floyd
 * Date: 2019/1/27
 * Time: 11:17 AM
 */

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private AuthorizationDao authorizationDao;

	@Override
	public ResultData findByName(String name) {
		Map<String, Object> condition = new HashMap<>();
		condition.put("userName", name);
		return userDao.queryUser(condition);
	}

	@Override
	public ResultData findByIds(List<Integer> ids) {
		return userDao.queryUsers(ids);
	}

	@Override
	public ResultData findByEmail(String email) {
		Map<String, Object> condition = new HashMap<>();
		condition.put("email", email);
		return userDao.queryUser(condition);
	}

	@Override
	public ResultData create(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public ResultData update(User user) {
		return userDao.update(user);
	}

	@Override
	public ResultData findAll() {
		ResultData allUserResult = userDao.selectAll();
		Map<String, String> users = new HashMap<>();
		if(allUserResult.getResponseCode() == ResponseCode.RESPONSE_OK){
			List<User> userList = (List<User>) allUserResult.getData();
			for(User user : userList){
				users.put(String.valueOf(user.getId()), user.getUserName());
			}
			ResultData result = new ResultData();
			result.setResponseCode(ResponseCode.RESPONSE_OK);
			result.setData(userList);
			return result;
		}
		return null;
	}

	@Override
	public ResultData getAuthorization(int userId) {
		Map<Integer, String> authorizers = new HashMap<>();
		Map<String, Object> condition = new HashMap<>();
		condition.put("authorizee", userId);
		ResultData newResult = new ResultData();
		ResultData resultData = authorizationDao.select(condition);
		if(resultData.getResponseCode() == ResponseCode.RESPONSE_NULL){
			newResult.setResponseCode(ResponseCode.RESPONSE_NULL);
		} else {
			for(Authorization authorization : (List<Authorization>)resultData.getData()){
				User authorizer = (User) userDao.selectByUid(authorization.getAuthorizer()).getData();
				authorizers.put(authorizer.getId(), authorizer.getUserName());
			}
			newResult.setData(authorizers);
			newResult.setResponseCode(ResponseCode.RESPONSE_OK);
		}
		return newResult;
	}
}
