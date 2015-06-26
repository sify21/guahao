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
                <a class="navbar-brand" href="/index/index">全国统一挂号平台</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                {% if loginfo == false %}
                <ul class="nav navbar-nav">
                    <li><a href="#" class="theme-login">登陆</a></li>
                    <li><a href="/login/registermain">注册</a></li>
                </ul>
                {% elseif loginfo == true %}
                <ul class="nav navbar-nav">
                    <li><a>你好,{{ username }}!</a></li>
                    <li><a href="/home/myhome">个人中心</a></li>
                    <li><a href="/login/exit">退出</a></li>
                </ul>
                {% endif %}
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
                    <a href="/index/index"> <img  src="/img/LOGO.jpg"/> </a>
                </div>
                <div class="col-md-10 hidden-xs hidden-sm" style="text-align: center;">
                    <p class="headerLogo">全国统一挂号平台</p>
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
                    <li><a href="/index">首页</a></li>
                    <li><a href="/reserve/hosreserve/cityid=0&&pagenumber=1">按医院预约</a></li>
                    <li><a href="#">按科室预约</a></li>
                    <li><a href="#">按疾病预约</a></li>
                    <li><a href="#">预约指南</a></li>
                    <li><a href="#">帮助中心</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right hidden-xs hidden-sm">
                    <li class="dropdown">
                        <a id="searchtype" href="#" class="dropdown-toggle" data-toggle="dropdown">请选择搜索项 <span class="caret"></span></a>
                        <ul id="searchtype-list" class="dropdown-menu" role="menu">
                            <li>医院</li>
                            <li class="divider"></li>
                            <li>科室</li>
                            <li class="divider"></li>
                            <li>疾病</li>
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

{#登陆窗口#}
<div class="theme-popover" style="padding:10px 0;">
    <div class="theme-poptit">
        <img src="/img/footlogo.png" width="30" height="30" alt="无"/>
        医愿网<a href="#"  title="关闭" class="close" style="color: red">×</a>
    </div>
    <div id="div-logintable" class="col-xs-12" >
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="div-inputvname" class="col-sm-3 control-label">用户名：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="div-input-name" placeholder="用户名">
                </div>
            </div>
            <div class="form-group">
                <label for="div-input-password" class="col-sm-3 control-label">密　码：</label>
                <div class="col-sm-9">
                    <input type="password" class="form-control" id="div-input-password" placeholder="密码">
                </div>
            </div>
            <div class="form-group">
                <label for="div-input-code" class="col-sm-3 control-label">验证码：</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="div-input-code" placeholder="验证码">
                </div>
            </div>
            <div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2"><img src="/login/code" class="img-responsive" id="div-check-img"></div>
                    <div class="col-sm-4" style="text-align: right"><a href="javascript:changesrc()" id="div-check-a" >换一张</a></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2"><a id="loginbutton" onclick="login()" class="btn btn-default" role="button">登陆</a></div>
                    <div class="col-sm-4" style="text-align: right"><a href="/login/registermain" class="btn btn-default" role="button">注册</a></div>
                </div>
            </div>

        </form>
    </div>
</div>
<div class="theme-popover-mask"></div>