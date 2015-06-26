{{ partial("shared/header") }}
<main>
    <div class="container">
        <div class="row">
            <div class="row">
                <div class="col-xs-12 div-route">
                    <a href="/index/index">首页</a>
                    >
                    <a href="/reserve/hosreserve?cityid=0&pagenumber=1">{{ city.province }}</a>
                    >
                    <a href="/reserve/hosreserve?cityid={{ city.id }}&pagenumber=1">{{ city.name }}</a>
                    >
                    <a href="/reserve/hospital?hospitalid={{ hospital.id }}">{{ hospital.name }}</a>
                    >
                    <span>{{ department.name }}</span>
                </div>
            </div>
        </div>
        <div id="div-departHead"class="row">
            <div id="div-departName" class="col-md-9 col-xs-12">
                <h1>{{ depart.name }}<a href="/reserve/hospital/{{ hospital.id }}">{{ hospital.name }}</a></h1>
                <button class="btn btn-md btn-default addtodictory"><span class="glyphicon glyphicon-heart-empty"></span>加入收藏</button>
            </div>
            <div class="col-md-3 hidden-xs hidden-sm div-hosEva">
                <a href="#" class="">
                    评价分数：<span id="div-hosEva-grade">8.4</span><br><span>就医经验</span>
                </a>
            </div>
        </div>
        <div id="div-departMain"class="row div-mainMain">
            <div id="div-departMainLeft"class="col-md-9 col-xs-12">
                <div class="row">
                    <div id="div-depart-Doctor"class="col-xs-12 normalBorder">
                        <label>选择科室医生</label>
                        <hr>
                        {% for doctor in doctors %}
                        <div class="col-xs-6 div-singleDoctor">
                            <div class="col-sm-5 div-mainLeft-img hidden-xs">
                                <img class="img-responsive" src="{{ doctor.img }}"/>
                            </div>
                            <div class="col-sm-7 col-xs-12 div-singleDoctor-info">
                                <a href="/reserve/doctor?doctorid={{ doctor.id }}">{{ doctor.name }}</a><span>{{ doctor.post }}</span><br>
                                <small>擅长：{{ doctor.specialty }}</small>
                            </div>
                        </div>
                        {% endfor %}
                    </div>
                </div>
            </div>
            <div id="div-departMainRight" class="col-md-3 hidden-xs hidden-sm">
                <div id="div-inHosSearch" class="normalBorder">
                    <label>院内搜索</label>
                    <div class="input-group">
                        <input class="form-control" type="email" placeholder="科室/医生/疾病">
                        <div class="btn input-group-addon">@</div>
                    </div>
                </div>
                <div class="fastHelp normalBorder">
                    <label>快速帮助</label>
                    <a href="/other/fasthelp"><span>更多</span></a>
                    <hr/>
                    <ul>
                        <li><a href="/other/fasthelp">预约的具体步骤？</a></li>
                        <li><a href="/other/fasthelp">预约是否收费？</a></li>
                        <li><a href="/other/fasthelp">什么时候更新号源？</a></li>
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
{{ partial("shared/footer") }}