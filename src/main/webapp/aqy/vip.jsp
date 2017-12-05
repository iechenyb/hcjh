<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String name=request.getParameter("name");%>
<html>
<head>
<title>全网vip视频播放器</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<style>
<link href="common.css" rel='stylesheet' type='text/css' />
frame
{
	border-width:thin medium thick;background-color: green;
}
a{
text-decoration:none;
display:block;
position:absolute;
left:12px;
}
a:hover{
color:#4828C7;
font-weight:bold;
background:#DBD5F7;
 border: 2px solid #4D2BD5;
 -moz-border-radius: 15px; 
 -webkit-border-radius: 15px; 
}
</style>
</head>
<frameset rows="10%,*,10%">
<frame name="top" src="header.jsp" frameborder=0/>
<frameset cols="20%,*,20%">
<frame name="list" src="list.jsp" frameborder=0/>
<frame name="center" src="https://api.47ks.com/webcloud/?v=" frameborder=0>
<frame name="comment" src="comment.jsp" frameborder=0/>
</frameset>
<frame name="footer" src="footer.jsp" frameborder=0/>
<noframes>
<body>
<p>不支持</p>
</body>
</noframes>
</frameset>
</html>