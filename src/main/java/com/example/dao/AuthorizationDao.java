package com.example.dao;

import com.example.entity.Authorization;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/4 12:22
 */
public interface AuthorizationDao {

    ResultData select(Map<String, Object> condition);

    ResultData selectByUid(int uid);

    ResultData insert(Authorization authorization);

    ResultData update(Authorization authorization);

    ResultData delete(int uid);
}
