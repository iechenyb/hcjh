package com.cyb.rest;
import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
/** 
 *  
 * @author pavithra 
 *  
 */  
  
// 这里@Path定义了类的层次路径。  
// 指定了资源类提供服务的URI路径。  
/*http://localhost:8088/springmvc/rest/UserInfoService/name/iechenyb
http://localhost:8088/springmvc/rest/UserInfoService/age/20*/
@Path("API/User/")  
public class UserInfo {  
    // @GET表示方法会处理HTTP GET请求  
    @GET  
    // 这里@Path定义了类的层次路径。指定了资源类提供服务的URI路径。  
    @Path("/name/{i}")  
    // @Produces定义了资源类方法会生成的媒体类型。  
    @Produces(MediaType.TEXT_XML)  
    // @PathParam向@Path定义的表达式注入URI参数值。  
    public String userName(@PathParam("i")  
    String i) {  
        String name = i;  
        return "<User>" + "<Name>" + name + "</Name>" + "</User>";  
    }  
  
    @GET  
    @Path("/age/{j}")  
    @Produces(MediaType.TEXT_XML)  
    public String userAge(@PathParam("j")  
    int j) {  
        int age = j;  
        return "<User>" + "<Age>" + age + "</Age>" + "</User>";  
    }  
    @GET  
    @Path("/json/{j}")  
    @Produces(MediaType.APPLICATION_JSON)  
    public String userJson(@PathParam("j")  
    int j) {  
        int age = j;  
        Map<String, Integer> map= new HashMap<String, Integer>();
        map.put("age",age);
        return JSONObject.fromObject(map).toString();  
    }  
}  
