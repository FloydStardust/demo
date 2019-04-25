package com.example.dao.impl;

import com.example.dao.BaseDao;
import com.example.dao.ProjectDao;
import com.example.entity.Project;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/24 15:15
 */
@Repository
public class ProjectDaoImpl extends BaseDao implements ProjectDao {
    @Override
    public ResultData select(Map<String, Object> condition) {
        ResultData result = new ResultData();
        try {
            List<Project> list = sqlSession.selectList("vkc.project.select", condition);
            if (list.isEmpty()) {
                result.setResponseCode(ResponseCode.RESPONSE_NULL);
            } else {
                result.setData(list);
            }
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData update(Project project) {
        ResultData result = new ResultData();
        try {
            sqlSession.update("vkc.project.update", project);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData insert(Project project) {
        ResultData result = new ResultData();
        try {
            sqlSession.insert("vkc.project.insert", project);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }

    @Override
    public ResultData delete(int uid) {
        ResultData result = new ResultData();
        try {
            sqlSession.delete("vkc.project.delete", uid);
        } catch (Exception e) {
            result.setResponseCode(ResponseCode.RESPONSE_ERROR);
            result.setDescription(e.getMessage());
        }
        return result;
    }
}
