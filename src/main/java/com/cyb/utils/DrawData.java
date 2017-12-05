package com.cyb.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class DrawData {///chenyb/app/
	public static String ppath = "d:/data/";
	public static void main(String[] args) throws IOException {
		/*initPlan();*/
		@SuppressWarnings("unchecked")
		Map<Integer,String> data1= (Map<Integer, String>) ObjectFileUtils.readObjectFromFile(ppath+"plan.data");
		System.out.println(data1);
	  /*	initCode();*/
		Map<Integer,String> data2= (Map<Integer, String>) ObjectFileUtils.readObjectFromFile(ppath+"code.data");
		System.out.println(data2);
		//initPlanBtn();
		Map<String,String> plans = (Map<String, String>) ObjectFileUtils.readObjectFromFile(ppath+"plans.data");
		System.out.println(plans);
	}
	public static String initPlan() throws IOException{
		Document doc = Jsoup.connect("http://www.cxin88.com/Plan.aspx").get();
		Elements links = doc.select("div[class=floatdiv-item]> ul li a");
		String linkText = "";
		Map<Integer,String> plans = new LinkedHashMap<Integer,String>();
		int i=0;
		for (Element link : links) {
			linkText = link.text();
			if(linkText.contains("计划")&&!linkText.equals("在线观看计划")&&!linkText.equals("下载计划客户端")){
				plans.put(i++, linkText);
			}
		}
		ObjectFileUtils.writeObjectToFile(plans,ppath+"plan.data");
		return "";
	}
	public static String initCode() throws IOException{
		Document doc = Jsoup.connect("http://www.cxin88.com/Plan.aspx").get();
		Elements links = doc.select("input[name=radioname]");
		String linkText = "";
		Map<Integer,String> plans = new LinkedHashMap<Integer,String>();
		int i=0;
		for (Element link : links) {
			linkText = link.attr("value");
			plans.put(i++, linkText);
		}
		ObjectFileUtils.writeObjectToFile(plans,ppath+"code.data");
		return "";
	}
	public static String initPlanBtn() throws IOException{
		Document doc = Jsoup.connect("http://www.cxin88.com/Plan.aspx").get();
		Elements links = doc.select("input[onclick=PlanClick(this)]");
		String linkText = "";
		List<Map<String,String>> plans = new ArrayList<Map<String,String>>();
		Map<String,String> plan = null;
		for (Element link : links) {
			linkText = link.attr("value");
			plan = new LinkedHashMap<String,String>();
			plan.put(link.attr("name"), linkText);
			plans.add(plan);
		}
		ObjectFileUtils.writeObjectToFile(plans,ppath+"plans.data");
		return "";
	}
}
