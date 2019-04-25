package com.example.controller;

import com.example.entity.Project;
import com.example.entity.Vendor;
import com.example.service.VendorService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.util.VendorUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Description:
 * Created by Floyd on 2019/4/24 11:39
 */
@RestController
@RequestMapping("api/vendor")
public class VendorController {
    @Autowired
    private VendorService vendorService;

    @GetMapping
    public ResultData vendorList(){
        return vendorService.getVendorListVo();
    }

    @PostMapping()
    public ResultData addVendor(@RequestBody Vendor vendor){
        if(vendor.getUid()==0)
            return vendorService.addVendor(vendor);
        else
            return vendorService.updateVendor(vendor);
    }

    @GetMapping("/project")
    public ResultData allProject(){
        return vendorService.getAllProjects();
    }

    @GetMapping("/project/{id}")
    public ResultData project(@PathVariable int id){
        return vendorService.getVendorVo(id);
    }

    @PostMapping("/project")
    public ResultData addProject(@RequestBody Project project){
        return vendorService.addProject(project);
    }

    @GetMapping("/type")
    public ResultData vendorType(){
        ResultData resultData = new ResultData();
        resultData.setResponseCode(ResponseCode.RESPONSE_OK);
        resultData.setData(VendorUtils.toMap());
        return resultData;
    }

}
