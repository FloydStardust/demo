package com.example.util;

import com.example.dao.UserDao;
import com.example.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 11:34 AM
 */


@Component
public class CurrentUserHelper {

	@Autowired
	private UserDao userDao;

	public User currentUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = ((org.springframework.security.core.userdetails.User) authentication.getPrincipal()).getUsername();
		Map<String, Object> condition = new HashMap<>();
		condition.put("userName", username);
		ResultData result = userDao.queryUser(condition);
		if (result.getResponseCode() == ResponseCode.RESPONSE_OK) {
			return ((List<User>) result.getData()).get(0);
		} else {
			return null;
		}
	}


}
