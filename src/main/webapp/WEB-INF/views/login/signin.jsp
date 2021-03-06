<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/tags.jsp"%>
<layout:container>
	<jsp:body>
		<div class="row margin50-t">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h1 class="text-center margin30-b">
					${siteTitle}
				</h1>
				<form role="form" method="post" action="/login">
					<legend>
						<span class="glyphicon glyphicon-user"></span> 用户登录</legend>
					<div class="form-group">
						<input type="text" class="form-control" id="username" name="username" placeholder="输入用户名">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password" name="password" placeholder="输入密码">
					</div>
					<button type="submit" class="btn btn-primary btn-block form-control" id="btnLogin">登录</button>

					<div class="checkbox pull-left">
						<label> 
							<input type="checkbox" name="rememberMe" id="rememberMe"> 记住我
						</label>
					</div>
					<div class=" pull-right margin10-t">
						<a href="/signup">注册账号</a>
					</div>
				</form>
			</div>
		</div>
	</jsp:body>
</layout:container>
<layout:js>
<script type="text/javascript">
(function(){
	$('form').ajaxForm({
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.result == 'true'){
				location.href=data.url;
			}else{
				alert('登录失败！');
			}
		}
	});
})();
</script>
</layout:js>