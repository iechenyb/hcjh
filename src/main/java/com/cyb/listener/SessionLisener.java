package com.cyb.listener;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 作者 : iechenyb<br>
 * 类描述: 说点啥<br>
 * 创建时间: 2017年12月5日
 */
public class SessionLisener implements HttpSessionListener {
	static Log log = LogFactory.getLog(SessionLisener.class);

	/**
	 * 
	 * 作者 : iechenyb<br>
	 * 方法描述: 登陆的时候调用<br>
	 * 创建时间: 2017年7月15日hj12
	 * 
	 * @param request
	 * @param user
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static synchronized void increase(HttpServletRequest request, String name) {
		HttpSession session = request.getSession();
		ServletContext ctx = session.getServletContext();
		String sessionId = session.getId();
		/*
		 * OnlineUser ou = new OnlineUser(); if (user == null) { return; }
		 */

		/*
		 * ou.setUserName(user.getLogin()); ou.setName(user.getUserName());
		 * ou.setIp(request.getRemoteAddr());
		 */

		Object obj = ctx.getAttribute("session.snoop");
		@SuppressWarnings("rawtypes")
		Map sess = null;
		if ((obj != null) && ((obj instanceof Map))) {
			sess = (Map) obj;
			if (!sess.containsKey(sessionId)) {
				sess.put(sessionId, name);
			}
		} else {
			sess = Collections.synchronizedMap(new HashMap());
			sess.put(sessionId, name);
		}

		log.info("session.snoop.count " + sess.size());
		ctx.setAttribute("session.snoop", sess);
	}

	@SuppressWarnings("rawtypes")
	public static synchronized void decrease(HttpSession session) {
		ServletContext ctx = session.getServletContext();
		String sessionId = session.getId();
		Object obj = ctx.getAttribute("session.snoop");
		@SuppressWarnings("rawtypes")
		Map sess = null;
		if ((obj != null) && ((obj instanceof Map))) {
			sess = (Map) obj;
			if (sess.containsKey(sessionId))
				sess.remove(sessionId);
		}
	}

	public void sessionCreated(HttpSessionEvent e) {

	}

	@SuppressWarnings("rawtypes")
	public void sessionDestroyed(HttpSessionEvent e) {
		HttpSession session = e.getSession();
		ServletContext ctx = session.getServletContext();
		decrease(session);
		Map sess = null;
		Object obj = ctx.getAttribute("session.snoop");
		if ((obj != null) && ((obj instanceof Map))) {
			sess = (Map) obj;
		}
		log.info("session.snoop.count " + sess.size());
	}

	@SuppressWarnings("rawtypes")
	public static synchronized Map getSessions(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ServletContext ctx = session.getServletContext();
		Map sess = null;
		Object obj = ctx.getAttribute("session.snoop");
		if ((obj != null) && ((obj instanceof Map))) {
			sess = (Map) obj;
		}
		return sess;
	}
}
