package com.example.dao;

import com.example.entity.User;
import com.example.util.ResultData;

import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/27
 * Time: 10:32 AM
 */
public interface UserDao {

	ResultData queryUser(Map<String, Object> condition);

	ResultData insertUser(User user);

	ResultData update(User user);

	ResultData queryUsers(List<Integer> ids);

	ResultData selectAll();
}
