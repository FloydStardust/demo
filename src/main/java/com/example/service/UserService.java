package com.example.service;

import com.example.entity.User;
import com.example.util.ResultData;

import java.util.List;

public interface UserService {
    ResultData findByName(String name);

    ResultData findByIds(List<Integer> ids);

    ResultData findByEmail(String email);

    ResultData create(User user);

    ResultData update(User user);

    ResultData findAll();

    ResultData getAuthorization(int userId);
}
