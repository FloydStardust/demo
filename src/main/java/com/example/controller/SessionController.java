package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.entity.User;
import com.example.form.RegisterForm;
import com.example.service.UserService;
import com.example.util.Encryption;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("auth")
public class SessionController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.POST, value = "/register")
    public ResultData create(RegisterForm form) {
        ResultData result = new ResultData();
        if (!StringUtils.isEmpty(form.getUserName()) && !StringUtils.isEmpty(form.getPassword())) {
            User user = new User(form.getUserName(), form.getPhone(), form.getEmail(), Encryption.md5(form.getPassword()));
            ResultData response = userService.create(user);
            if (response.getResponseCode() == ResponseCode.RESPONSE_OK) {
                result.setResponseCode(ResponseCode.RESPONSE_OK);
                result.setDescription(new StringBuilder("user successfully created, ").append(JSON.toJSONString(response.getData())).toString());
            } else {
                result.setResponseCode(ResponseCode.RESPONSE_ERROR);
                result.setDescription(new StringBuilder("Fail to create user with info: ").append(JSON.toJSONString(user)).toString());
            }
        }
        return result;
    }
}
