package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.service.LeadsService;
import com.example.service.PortfolioService;
import com.example.service.UserService;
import com.example.util.LeadsUtils;
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

/**
 * Created by IntelliJ IDEA.
 * User: Floyd
 * Date: 2019/1/29
 * Time: 6:43 PM
 */

@Controller
public class PageController {

	@Autowired
	private PortfolioService portfolioService;
	@Autowired
	private LeadsService leadsService;
	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET, value = "register")
	public String register(ModelMap model) {
		return "signup";
	}

	@RequestMapping(method = RequestMethod.GET, value = "login")
	public String login(ModelMap model) {
		return "login";
	}

	@GetMapping("home")
	public String home(){
		return "forward:/schedule";
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

	@GetMapping("portfolio/{id}")
	public String projectDetail(@PathVariable String id, Model model) {
		model.addAttribute("projectId", id);
		return "portfolio_detail";
	}

	@GetMapping("pipeline")
	public String pipeline(Model model){
		model.addAttribute("type", LeadsUtils.LeadsType.PIPELINE);
		return "leads";
	}

	@GetMapping("leads")
	public String leads(Model model){
		model.addAttribute("type", LeadsUtils.LeadsType.LEADS);
		return "leads";
	}

}
