package com.example.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/24 16:02
 */
public class VendorUtils {

    public static int FINANCE = 1;
    public static int LAW = 2;

    public static Map<Integer, String> toMap(){
        Map<Integer, String> map = new HashMap<>();
        map.put(FINANCE, "会计事务所");
        map.put(LAW, "律师事务所");
        return map;
    }
}
