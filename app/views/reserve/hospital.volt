{{ partial("shared/header") }}
<main role="">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 div-route">
                <a href="/index/index">首页</a>
                >
                <a href="/reserve/hosreserve?cityid=0&pagenumber=1">{{ city.province }}</a>
                >
                <a href="/reserve/hosreserve?cityid={{ city.id }}&pagenumber=1">{{ city.name }}</a>
                ><span>{{ hospital.name }}</span>
            </div>
        </div>
        <div id="div-hosMainHead"class="row">
            <div id="div-hosName" class="col-md-9 col-xs-12">
                <h1>{{ hospital.name }}<small>{{ hospital.level }}</small></h1>
                <ul id="div-hosHead-nav"class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#">医院主页</a></li>
                    <li role="presentation"><a href="#">预约规则</a></li>
                    <li role="presentation"><a href="#">就医经验</a></li>
                </ul>
            </div>
            <div class="col-md-3 hidden-xs hidden-sm div-hosEva">
                <a href="/e" class="">
                    评价分数：<span id="div-hosEva-grade">8.4分</span><br><span>就医经验</span>
                </a>
            </div>
        </div>
        <div id="div-hosMain"class="row div-mainMain">
            <div id="div-hosMainLeft" class="col-md-9 col-xs-12">
                <div id="div-hosMainLeft-index" class="col-xs-12">
                    <div id="div-hosMainInfo" class="col-xs-12">
                        <div id="div-hosMainInfo-img"class="col-xs-4">
                            <img class="img-responsive" src="{{ hospital.img }}" alt=""/>
                        </div>
                        <div id="div-hosMainInfo-other"class="col-xs-8">
                            <p><span>地址：</span>{{ hospital.street }}<a href="#">查看地图</a></p>
                            <p><span>电话：</span>{{ hospital.tele }}</p>
                            <p><span>官网：</span>暂无</p>
                            <p class="text-nowrap"><span>简介：</span>{{ hospital.intro }}</p>
                            <a class="btn btn-md btn-default" style="margin: 10px 0px;"><span class="glyphicon glyphicon-heart-empty"></span>加入收藏</a>
                        </div>
                    </div>
                    <div id="div-hosMainDepart" style="padding:15px 0;" class="col-xs-12 normalBorder">
                        <label>选择医院科室</label>
                        <hr>
                        {% for name1,value1 in departments %}
                            <div class="col-xs-12 div-singleDepart">
                                <div class="div-singleDepart-Left col-xs-2">
                                    {{ name1 }}
                                </div>
                                <div class="div-singleDepart-Right col-xs-10">
                                    {% for name,value in value1 %}
                                    <div class="col-sm-4 col-xs-6">
                                        <a href="/reserve/department?departmentid={{ value }}">{{ name }}</a><span>{{ dcount }}</span>
                                    </div>
                                    {% endfor %}
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
                <div id="div-hosMainLeft-rule" class="col-xs-12" style="display:none">
                    {{hospital.notice}}
                </div>
                <div id="div-hosMainLeft-experience" class="col-xs-12 " style="display:none">
                    就医经验
                </div>
            </div>
            <div id="div-hosMainRight" class="col-md-3 hidden-xs hidden-sm">
                <div id="div-inHosSearch" class="row">
                    <label>院内搜索</label>
                    <div class="input-group">
                        <input class="form-control" type="email" placeholder="科室/医生/疾病">
                        <div class="btn input-group-addon">@</div>
                    </div>
                </div>
                <div class="row fastHelp normalBorder">
                    <label>快速帮助</label>
                    <a href="#"><span>更多</span></a>
                    <hr/>
                    <ul>
                        <li><a href="#">预约的具体步骤？</a></li>
                        <li><a href="#">预约是否收费？</a></li>
                        <li><a href="#">什么时候更新号源？</a></li>
                    </ul>
                </div>
                <div class="row hrRightImg"><img class="img-responsive" src="/img/穹妹7.jpg" alt=""/></div>
                <div class="row hrRightImg"><img class="img-responsive" src="/img/穹妹8.jpg" alt=""/></div>
                <div class="row hrRightImg"><img class="img-responsive" src="/img/穹妹9.jpg" alt=""/></div>
                <div class="row hrRightImg"><img class="img-responsive" src="/img/穹妹10.jpg" alt=""/></div>
                <div class="row hrRightImg"><img class="img-responsive" src="/img/穹妹11.jpg" alt=""/></div>

            </div>
        </div>
    </div>
</main>
<script type="text/javascript">
    $("#div-hosHead-nav li").click(function(){
                $(this).addClass("active").siblings().removeClass("active");
                var change=$(this).children().html();
                switch(change)
                {
                    case "医院主页":
                        $("#div-hosMainLeft-index").css("display","block").siblings().css("display","none");
                        break;
                    case "预约规则":
                        $("#div-hosMainLeft-rule").css("display","block").siblings().css("display","none");
                        break;
                    case "就医经验":
                        $("#div-hosMainLeft-experience").css("display","block").siblings().css("display","none");
                        break;
                }
            }
    )
</script>
{{ partial("shared/header") }}