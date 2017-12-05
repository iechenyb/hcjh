package com.cyb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cyb.po.Plan;
import com.cyb.utils.DrawData;
import com.cyb.utils.ObjectFileUtils;

@RestController("hcjh") 
public class HcjhController {
	 @SuppressWarnings({ "deprecation", "resource" })
	 @RequestMapping("/getData")
	 @ResponseBody
     public Map<String,String> get(Plan plan) {  
		 String result = "";
		 Map<String,String> res = new HashMap<String,String>();
			try {
				//http://www.52013141.com/PlanApi/PostPlan.ashx?Color=%E9%87%8D%E5%BA%86%E6%97%B6%E6%97%B6%E5%BD%A9&Name=%E8%93%9D%E5%A4%A9&Play=%E4%BA%8C%E6%98%9F%E7%9B%B4%E9%80%89&Position=%E5%89%8D%E4%BA%8C&Cycle=2&CodeNumber=6
				@SuppressWarnings("unchecked")
				Map<Integer,String> planType= (Map<Integer, String>) ObjectFileUtils.readObjectFromFile(DrawData.ppath+"plan.data");
				@SuppressWarnings("unchecked")
				Map<Integer,String> code= (Map<Integer, String>) ObjectFileUtils.readObjectFromFile(DrawData.ppath+"code.data");
				@SuppressWarnings("unchecked")
				Map<String,String> plans = (Map<String, String>) ObjectFileUtils.readObjectFromFile(DrawData.ppath+"plans.data");
				String url = "http://www.cxin88.com/HandlerAjax.ashx";
				HttpPost httpRequst = new HttpPost(url);
				List<NameValuePair> params = new ArrayList<NameValuePair>();
				params.add(new BasicNameValuePair("Color", "官方重庆计划"));
				params.add(new BasicNameValuePair("MethodId",plan.getMethodId()));
				params.add(new BasicNameValuePair("MethodName", plans.get(plan.getMethodId())));
				params.add(new BasicNameValuePair("Radio", code.get(plan.getRadio())));
				params.add(new BasicNameValuePair("CodeNumber", plan.getCodeNumber()));
				params.add(new BasicNameValuePair("PlanCycle", plan.getPlanCycle()));
				httpRequst.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
				@SuppressWarnings("deprecation")
				org.apache.http.HttpResponse httpResponse = new DefaultHttpClient()
						.execute(httpRequst);
				if (httpResponse.getStatusLine().getStatusCode() == 200) {}else{}
				HttpEntity httpEntity = httpResponse.getEntity();
				result = EntityUtils.toString(httpEntity);// 取出应答字符串
				res.put("rs", result);
			} catch (Exception e) {
				e.printStackTrace();
				result = e.getMessage().toString();
			}
       return res;  
   }  
	 @RequestMapping("/condition")
	 @ResponseBody
     public Map<String,Object> getPara() {  
		    @SuppressWarnings("unchecked")
		    List<Map<String,String>> planType= (List<Map<String,String>>) ObjectFileUtils.readObjectFromFile(DrawData.ppath+"planl.data");
			@SuppressWarnings("unchecked")
			List<Map<String,String>> code= (List<Map<String,String>>) ObjectFileUtils.readObjectFromFile(DrawData.ppath+"codel.data");
			@SuppressWarnings("unchecked")
			List<Map<String,String>> plans = (List<Map<String,String>>) ObjectFileUtils.readObjectFromFile(DrawData.ppath+"plansl.data");
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("planType", planType);
			data.put("code", code);
			data.put("plans", plans);
			return data;
			
	 }
}
