package com.example.service.impl;

import com.example.dao.UserDao;
import com.example.entity.User;
import com.example.service.UserService;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/27
 * Time: 11:17 AM
 */

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public ResultData findByName(String name) {
		Map<String, Object> condition = new HashMap<>();
		condition.put("userName", name);
		return userDao.queryUser(condition);
	}

	@Override
	public ResultData create(User user) {
		return userDao.insertUser(user);
	}
}
