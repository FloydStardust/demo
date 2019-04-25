package com.example.controller;

import com.example.entity.Schedule;
import com.example.form.ScheduleQueryParam;
import com.example.service.ScheduleService;
import com.example.util.CurrentUserHelper;
import com.example.util.ResponseCode;
import com.example.util.ResultData;
import com.example.util.ScheduleUtils;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
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
			result.setDescription("日程内容和时间不能为空！");
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
		return scheduleService.fetchSchedule(null);
	}

	@GetMapping("week")
	public ResultData list() {
		return scheduleService.fetchScheduleWeekly();
	}

	@GetMapping("query")
	public ResultData queryByParam(HttpServletRequest request){
		Map<String, Object> condition = new HashMap<>();

		String[] tempStart = request.getParameter("start").split("/");
		String[] tempEnd = request.getParameter("end").split("/");
		LocalDate start = LocalDate.of(Integer.valueOf(tempStart[0]), Integer.valueOf(tempStart[1]),
				Integer.valueOf(tempStart[2]));
		LocalDate end = LocalDate.of(Integer.valueOf(tempEnd[0]), Integer.valueOf(tempEnd[1]),
				Integer.valueOf(tempEnd[2]));
		condition.put("startDate", start);
		condition.put("endDate", end);
		condition.put("person", Integer.valueOf(request.getParameter("user")));
		return scheduleService.fetchSchedule(condition);
	}

	@GetMapping("time_split")
	public ResultData timeSplit(){
		ResultData resultData = new ResultData();
		resultData.setResponseCode(ResponseCode.RESPONSE_OK);
		resultData.setData(ScheduleUtils.TIME_SPLIT.toMap());
		return resultData;
	}

}
