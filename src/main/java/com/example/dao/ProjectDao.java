package com.example.dao;

import com.example.entity.Project;
import com.example.entity.Vendor;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/24 15:14
 */
public interface ProjectDao {
    ResultData select(Map<String, Object> condition);

    ResultData update(Project project);

    ResultData insert(Project project);

    ResultData delete(int uid);
}
