package com.example.controller;

import com.example.service.UserService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public ResultData getAll(){
        return userService.findAll();
    }

    @GetMapping("/current")
    public ResultData getCurrent(){
        ResultData resultData = new ResultData();
        if(currentUserHelper.currentUser() == null){
            resultData.setResponseCode(ResponseCode.RESPONSE_NULL);
        }else {
            resultData.setResponseCode(ResponseCode.RESPONSE_OK);
            resultData.setData(currentUserHelper.currentUser());
        }
        return resultData;
    }
}
