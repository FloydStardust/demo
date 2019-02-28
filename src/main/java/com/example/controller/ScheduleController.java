package com.example.controller;

import com.example.entity.Schedule;
import com.example.form.ScheduleQueryParam;
import com.example.service.ScheduleService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.util.ScheduleUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 11:50 AM
 */

@RestController
@RequestMapping("api/schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;

	@PostMapping
	public ResultData create(@RequestBody Schedule schedule) {
		if (Objects.isNull(schedule.getDate()) || Objects.isNull(schedule.getStart())
				|| Objects.isNull(schedule.getEnd()) || Objects.isNull(schedule.getContent())) {
			ResultData result = new ResultData();
			result.setResponseCode(ResponseCode.RESPONSE_ERROR);
			result.setDescription("参数错误");
			return result;
		}
		if(schedule.getUid()==0)
			return scheduleService.addSchedule(schedule);
		else
			return scheduleService.updateSchedule(schedule);
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

	@GetMapping("week")
	public ResultData list() {
		return scheduleService.fetchScheduleWeekly();
	}

	@GetMapping("time_split")
	public ResultData timeSplit(){
		ResultData resultData = new ResultData();
		resultData.setResponseCode(ResponseCode.RESPONSE_OK);
		resultData.setData(ScheduleUtils.TIME_SPLIT.toMap());
		return resultData;
	}

}
