package com.example.demo;

import org.junit.Test;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 11:22 PM
 */
public class DemoTest {

	@Test
	public void test1() {
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String week = LocalDate.now().getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.CHINA);

		System.out.println(LocalDate.now().format(dateFormat) + " " +  week);
	}
}
