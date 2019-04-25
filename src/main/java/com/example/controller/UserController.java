package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.entity.User;
import com.example.service.UserService;
import com.example.util.CurrentUserHelper;
import com.example.util.Encryption;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * Description: demo
 * Created by Floyd on 2019/2/28 13:33
 */
@RestController
@RequestMapping("api/user")
public class UserController {
    @Autowired
    private CurrentUserHelper currentUserHelper;
    @Autowired
    private UserService userService;

    @GetMapping
    public ResultData getAll() {
        return userService.findAll();
    }

    @GetMapping("/current")
    public ResultData getCurrent() {
        ResultData resultData = new ResultData();
        if (currentUserHelper.currentUser() == null) {
            resultData.setResponseCode(ResponseCode.RESPONSE_NULL);
        } else {
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
            resultData.setData(currentUserHelper.currentUser());
        }
        return resultData;
    }

    @GetMapping("/all")
    public ResultData getAllUser() {
        ResultData resultData = new ResultData();
        if (currentUserHelper.currentUser() == null) {
            resultData.setResponseCode(ResponseCode.RESPONSE_NULL);
        } else {
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
            Map<String, Object> data = new HashMap<>();
            data.put("current", currentUserHelper.currentUser());
            data.put("all", userService.findAll().getData());
            resultData.setData(data);
        }
        return resultData;
    }

    @GetMapping("/authorization")
    public ResultData getAuthorization() {
        ResultData resultData = new ResultData();
        if (currentUserHelper.currentUser() != null) {
            return userService.getAuthorization(currentUserHelper.currentUser().getId());
        }
        return resultData;
    }

    @PutMapping
    public ResultData update(@RequestBody User user) {
        ResultData resultData = new ResultData();
        if (user.getPassword() != null) {
            user.setId(currentUserHelper.currentUser().getId());
            user.setPassword(Encryption.md5(user.getPassword()));
            return userService.update(user);
        }else {
            resultData.setResponseCode(ResponseCode.RESPONSE_ERROR);
            resultData.setDescription("Update user error");
        }
        return resultData;
    }
}
