package com.example.service;

import com.example.entity.User;
import com.example.util.ResultData;

public interface UserService {
    ResultData findByName(String name);

    ResultData findByEmail(String email);

    ResultData create(User user);
}
