<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>医愿网</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/slider.css">
	<link rel="stylesheet" href="css/reset.css">
</head>

<body>
<header>
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0px">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">全国统一挂号平台</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">登陆</a></li>
					<li><a href="#">注册</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">网站建议</a></li>
					<li><a href="#">联系方式</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">排行榜<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">医院排行榜</a></li>
							<li class="divider"></li>
							<li><a href="#">医生排行榜</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid" style="margin-top:0px;background-color:#e1e1e1">
		<div class="container">
				<div class="row">
					<div class="col-md-2 hidden-xs hidden-sm" style="text-align: center">
						<a href="#"> <img  src="img/LOGO.jpg"/> </a>
					</div>
					<div class="col-md-10 hidden-xs hidden-sm" style="text-align: center;">
						<p class="headerLogo">全国统一挂号平台</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-default navbar-default-2 navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse-2">
				<ul class="nav navbar-nav">
					<li><a href="mainWeb.html">首页</a></li>
					<li><a href="manager-geren.html">管理个人信息</a></li>
					<li><a href="manger-shenhe.html">审核注册信息</a></li>
					<li><a href="hospitaltable.volt">维护医院信息</a></li>

					<li><a href="#">帮助中心</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right hidden-xs hidden-sm">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">请选择搜索项 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">医院</a></li>
							<li class="divider"></li>
							<li><a href="#">科室</a></li>
							<li class="divider"></li>
							<li><a href="#">疾病</a></li>
						</ul>
					</li>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="输入医院、科室或疾病">
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>
				</ul>
			</div>
		</div>
	</nav>
</header>
<main id="content" role="main">
	<div class="container">

		<h1>审核注册信息</h1>
		<hr>
		<div>
			<span>用户名：</span><span></span><br>
			<span>密码：</span><span></span><br>
			<span>姓名：</span><span></span><br>
			<span>身份证号：</span><span></span><br>
			<span>手机号码：</span><span></span><br>
			<span>电子邮箱：</span><span></span><br>
			<span>用户类别：</span><span></span><br>


		</div>

		<div>
			<button>通过</button><button>删除</button>
		</div>

	</div>
</main>
<footer role="contentinfo">
	<div class="container-fluid divFoot">
		<div class="container">
			<div class="row">
				<div class="col-md-2 hidden-xs hidden-sm">
					<a href="#" class="thumbnail"> <img  src="img/footlogo.png"/> </a>
				</div>
				<div class="col-md-2 col-sm-8" style="padding-top: 15px">
					<br>
					<a href="#" style="font-size: 14px">关于我们</a>
					<br>
					<a href="#" style="font-size: 14px">使用须知</a>
					<br>
					<a href="#" style="font-size: 14px">版权说明</a>
				</div>
				<div class="col-md-8 hidden-xs hidden-sm">
					<div class="col-sm-4">
						<a href="#" class="thumbnail">
							<img src="img/穹妹1.jpg" alt="...">
						</a>
					</div>
					<div class="col-sm-4">
						<a href="#" class="thumbnail">
							<img src="img/穹妹2.jpg" alt="...">
						</a>
					</div>
					<div class="col-sm-4">
						<a href="#" class="thumbnail">
							<img src="img/穹妹3.jpg" alt="...">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/power-slider.js"></script>
<script type="text/javascript">

	$(function(){
		$("#_ul1").find("a").click(function(){
			$("#FastdropdownMenu1").html($(this).html());
		})
		$("#_ul2").find("a").click(function(){
			$("#FastdropdownMenu2").html($(this).html());
		})
		$("#_ul3").find("a").click(function(){
			$("#FastdropdownMenu3").html($(this).html());
		})
		$("#_ul4").find("a").click(function(){
			$("#FastdropdownMenu4").html($(this).html());
		})
	});

</script>
<script type="text/javascript">
	$(function(){
		$("#slider").powerSlider({handle:"fadeTo"});
		//$("#text").powerSlider();
		//$("#img").powerSlider({picNum:4,handle:"hide"});
		$(".code h3 span").each(function(i){
			$(this).click(function(){
				$(this).addClass("active").siblings().removeClass("active");
				$(".code pre").eq(i).show().siblings("pre").hide();
			})
		})
	});
</script>
</body>
</html>
