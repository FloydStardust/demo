package com.example.controller;

import com.example.form.ScheduleQueryParam;
import com.example.service.ScheduleService;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 11:50 AM
 */

@RestController
@RequestMapping("schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;

	@PostMapping
	public ResultData create() {
		return null;
	}

	@DeleteMapping("/{uid}")
	public ResultData delete(@PathVariable String uid) {
		return null;
	}

	@PutMapping()
	public ResultData update() {
		return null;
	}

	@PostMapping("list")
	public ResultData list(@RequestBody ScheduleQueryParam param) {
		return null;
	}

}
