package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 6:43 PM
 */

@Controller
public class PageController {

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
		return "schedule";
	}

}
