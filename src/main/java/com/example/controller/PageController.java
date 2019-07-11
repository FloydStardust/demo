package com.example.controller;

import com.alibaba.fastjson.JSON;
import com.example.entity.User;
import com.example.service.FundService;
import com.example.service.LeadsService;
import com.example.service.PortfolioService;
import com.example.service.UserService;
import com.example.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.jws.WebParam;
import java.util.Map;

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

	@RequestMapping(method = RequestMethod.GET, value = "register")
	public String register(ModelMap model) {
		return "signup";
	}

	@GetMapping("password")
	public String update(Model model){
		return "password";
	}

	@RequestMapping(method = RequestMethod.GET, value = "login")
	public String login(ModelMap model) {
		return "login";
	}

	@GetMapping("home")
	public String home(){
//		if(currentUserHelper.currentUser() != null){
//			System.out.println(currentUserHelper.currentUser().getUserName() + "is logging");
//		}
		return "forward:/leads";
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

	@GetMapping("watchlist")
	public String watchlist(Model model){
		model.addAttribute("type", LeadsUtils.LeadsType.WATCHLIST);
		return "leads";
	}

	@GetMapping("pass")
	public String pass(Model model){
		model.addAttribute("type", LeadsUtils.LeadsType.PASS);
		return "leads";
	}

	@GetMapping("schedule")
	public String schedule(){
		return "schedule";
	}

	@GetMapping("vendor")
	public String vendor(){
		return "vendor";
	}

	@GetMapping("vendor/project/{id}")
	public String vendor(@PathVariable int id, Model model){
		model.addAttribute("projectId", id);
		return "vendor_detail";
	}

	@GetMapping("lp")
	public String lp(){
		return "lp";
	}

}
