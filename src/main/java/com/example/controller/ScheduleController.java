package com.example.controller;

import com.example.entity.Schedule;
import com.example.form.ScheduleQueryParam;
import com.example.service.ScheduleService;
import com.example.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
	public ResultData create(@RequestBody Schedule schedule) {
		return scheduleService.addSchedule(schedule);
	}

	@DeleteMapping("/{uid}")
	public ResultData delete(@PathVariable int uid) {
		return scheduleService.deleteSchedule(uid);
	}

	@PutMapping()
	public ResultData update(@RequestBody Schedule schedule) {
		return scheduleService.updateSchedule(schedule);
	}

	@PostMapping("list")
	public ResultData list(@RequestBody ScheduleQueryParam param) {
		return scheduleService.fetchSchedule(param);
	}

}
