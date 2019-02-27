package com.example.demo;

import org.junit.Test;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.time.temporal.ChronoUnit;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by IntelliJ IDEA.
 * User: xxh
 * Date: 2019/1/29
 * Time: 11:22 PM
 */
public class DemoTest {
	public static Map<Object, Object> IPO_STATUS = new HashMap<Object, Object>(){
		{
			put(0, "未上市");
			put(1, "HY");
			put(2, "NYSE");
		}
	};

	@Test
	public void test1() {
		File file = new File("D:\\crm_files\\record\\1");
		for (File file1 : file.listFiles()){
			System.out.println(file1.getName());
			System.out.println(file1.getPath());
			System.out.println(file1.getAbsolutePath());
		}
	}

	@Test
	public void test2(){
		System.out.println(IPO_STATUS);
		EnumSet<InvestType> types = EnumSet.allOf(InvestType.class);
		System.out.println( types.stream().collect(Collectors.toMap(InvestType::getIndex, InvestType::getName)) );

		for(InvestType item: types){
			System.out.println(item);
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
