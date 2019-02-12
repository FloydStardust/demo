package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.entity.Fund;
import com.example.service.FundService;
import com.example.service.PortfolioService;
import com.example.service.ScheduleService;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 6:43 PM
 */

@Controller
public class PageController {

	@Autowired
	private PortfolioService portfolioService;

	@RequestMapping(method = RequestMethod.GET, value = "register")
	public String register(ModelMap model) {
		return "signup";
	}

	@RequestMapping(method = RequestMethod.GET, value = "login")
	public String login(ModelMap model) {
		return "login";
	}

	@RequestMapping(method = RequestMethod.GET, value = "schedule")
	public String schedule(ModelMap model) {
//		ResultData result = scheduleService.fetchScheduleWeekly();
//		model.put("schedules", result.getData());
		return "schedule";
	}

	@GetMapping("portfolio")
	public String portfolio(Model model){
		ResultData result = portfolioService.getAddPortfolioFields();
		if(result.getResponseCode() ==  ResponseCode.RESPONSE_OK){
			model.addAttribute("fields", JSON.toJSONString(result.getData()));
		} else {
			model.addAttribute("fields", null);
		}
//		System.out.println(JSON.toJSONString(result.getData()));
		return "portfolio";
	}

	@GetMapping("/project_detail/{projectId}")
	public String projectDetail(@PathVariable String projectId, Model model) {
		model.addAttribute("projectId", projectId);
		return "project_detail";
	}

}
