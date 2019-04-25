package com.example.service.impl;

import com.example.dao.FundDao;
import com.example.dao.ProjectDao;
import com.example.dao.VendorDao;
import com.example.entity.Fund;
import com.example.entity.Project;
import com.example.entity.Vendor;
import com.example.service.VendorService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.util.VendorUtils;
import com.example.vo.VendorListVo;
import com.example.vo.VendorVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:
 * Created by Floyd on 2019/4/24 15:37
 */
@Service
public class VendorServiceImpl implements VendorService {

    @Autowired
    private ProjectDao projectDao;
    @Autowired
    private VendorDao vendorDao;
    @Autowired
    private FundDao fundDao;

    @Override
    public ResultData addProject(Project project) {
        return projectDao.insert(project);
    }

    @Override
    public ResultData getAllProjects() {
        Map<String, Object> condition = new HashMap<>();
        return projectDao.select(condition);
    }

    @Override
    public ResultData addVendor(Vendor vendor) {
        return vendorDao.insert(vendor);
    }

    @Override
    public ResultData getVendorListVo() {
        ResultData result = new ResultData();
        List<VendorListVo> list = new ArrayList<>();

        ResultData resultData = getAllProjects();

        if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
            List<Project> projects = (List<Project>) resultData.getData();
            for(Project project : projects){
                resultData = getVendorVo(project.getUid());
                VendorVo vendorVo = (VendorVo) resultData.getData();
                VendorListVo vendorListVo = new VendorListVo();
                vendorListVo.setUid(vendorVo.getUid());
                vendorListVo.setProject(vendorVo.getName());
                if(vendorVo.getVendors() == null){
                    vendorListVo.setLawVendor(null);
                    vendorListVo.setFinancialVendor(null);
                }else{
                    for(Vendor vendor : vendorVo.getVendors()){
                        if(vendor.getType() == VendorUtils.FINANCE){
                            vendorListVo.setFinancialVendor(vendor);
                        }else if(vendor.getType() == VendorUtils.LAW){
                            vendorListVo.setLawVendor(vendor);
                        }
                    }
                }
                list.add(vendorListVo);
            }
            result.setResponseCode(ResponseCode.RESPONSE_OK);
            result.setData(list);
        }
        return result;
    }

    @Override
    public ResultData getVendorVo(int projectId) {
        ResultData result = new ResultData();
        VendorVo vendorVo = new VendorVo();
        Map<String, Object> condition = new HashMap<>();
        condition.put("uid", projectId);
        ResultData resultData = projectDao.select(condition);
        if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
            Project project = ((List<Project>) resultData.getData()).get(0);
            vendorVo.setUid(projectId);
            vendorVo.setName(project.getName());
            vendorVo.setManager(project.getManager());
            vendorVo.setFund(((Fund)fundDao.selectByUid(project.getFund()).getData()).getName());

            condition = new HashMap<>();
            condition.put("project", projectId);
            resultData = vendorDao.select(condition);
            if(resultData.getResponseCode() == ResponseCode.RESPONSE_OK){
                List<Vendor> vendors = (List<Vendor>) resultData.getData();
                vendorVo.setVendors(vendors);
            }
            result.setData(vendorVo);
            result.setResponseCode(ResponseCode.RESPONSE_OK);
        }
        return result;
    }

    @Override
    public ResultData updateVendor(Vendor vendor) {
        return vendorDao.update(vendor);
    }
}
