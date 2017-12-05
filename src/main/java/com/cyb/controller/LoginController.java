package com.cyb.controller;
import java.util.HashMap;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cyb.listener.SessionLisener;
/**
 *作者 : iechenyb<br>
 *类描述: 说点啥<br>
 *创建时间: 2017年12月5日
 */
@RestController
public class LoginController {
	Log log = LogFactory.getLog(LoginController.class);
	@ResponseBody
	@RequestMapping("login")
	public String login(String username,HttpServletRequest request){
		SessionLisener.increase(request, username);
		request.getSession().setAttribute("name", username);
		return "success";
	}
	@ResponseBody
	@RequestMapping("exit")
	public String exit(String username,HttpServletRequest request){
		SessionLisener.decrease(request.getSession());
		return "success";
	}
	@ResponseBody
	@RequestMapping("online")
	public Map online(HttpServletRequest request){
		Map rs = SessionLisener.getSessions(request);
		if(rs==null){
			return new HashMap();
		}
		return rs;
	}
}
