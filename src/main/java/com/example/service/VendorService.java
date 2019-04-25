package com.example.service;

import com.example.entity.Project;
import com.example.entity.Vendor;
import com.example.util.ResultData;

/**
 * Description:
 * Created by Floyd on 2019/4/24 15:32
 */
public interface VendorService {

    ResultData addProject(Project project);

    ResultData getAllProjects();

    ResultData addVendor(Vendor vendor);

    ResultData getVendorListVo();

    ResultData getVendorVo(int projectId);

    ResultData updateVendor(Vendor vendor);
}
