package com.example.demo;

import org.junit.Test;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.time.temporal.ChronoUnit;
import java.util.EnumSet;
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

	@Test
	public void test2(){
		EnumSet<InvestType> types = EnumSet.allOf(InvestType.class);
		for(InvestType item: types){
			System.out.println(item.getName());
		}
	}

	public enum InvestType {
		LEAD("领投",1), FOLLOW("跟投",2);
		private String name;
		private int index;
		private InvestType(String name, int index) {
			this.name = name;
			this.index = index;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getIndex() {
			return index;
		}

		public void setIndex(int index) {
			this.index = index;
		}
	}
}