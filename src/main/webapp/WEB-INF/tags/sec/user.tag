<%@tag import="com.jfinal.plugin.ehcache.CacheKit"%>
<%@tag import="org.apache.shiro.SecurityUtils"%>
<%@tag import="net.wincn.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ tag language="java" pageEncoding="utf-8" body-content="empty"%>
<%@ attribute name="property" type="java.lang.String"%>

<%
	User user = null;
	user = CacheKit.get("user", "currentUser");
	if(user == null){
		user = User.findUserByUsername(SecurityUtils.getSubject().getPrincipal().toString());
		CacheKit.put("user", "currentUser", user);
	}
%>
<%= user.get(property) %>
