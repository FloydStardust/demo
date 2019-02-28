package com.example.service.impl;

import com.example.service.UserService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
	    List<SimpleGrantedAuthority> authorities = new LinkedList<>();
	    ResultData result = userService.findByName(userName);
	    if (result.getResponseCode() == ResponseCode.RESPONSE_OK) {
		    com.example.entity.User user = ((List<com.example.entity.User>) result.getData()).get(0);
		    return new User(user.getUserName(), user.getPassword(), authorities);
	    } else {
	    	throw new UsernameNotFoundException("用户名或密码错误");
	    }
    }
}
