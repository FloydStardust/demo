package com.example.dao;

import com.example.entity.Vendor;
import com.example.util.ResultData;

import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/24 10:35
 */
public interface VendorDao {

    ResultData select(Map<String, Object> condition);

    ResultData update(Vendor vendor);

    ResultData insert(Vendor vendor);

    ResultData delete(int uid);
}
