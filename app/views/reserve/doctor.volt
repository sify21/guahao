{{ partial("shared/header") }}
<main>
    <div class="container">
        <div class="row">
            <div class="div-route col-xs-12">
                <a href="#">首页</a>
                >
                <a href="/reserve/hosreserve?cityid=0&pagenumber=1">{{city.province}}</a>
                >
                <a href="/reserve/hosreserve?cityid={{ city.id }}&pagenumber=1">{{city.name}}</a>
                >
                <a href="/reserve/hospital?hospitalid={{ hospital.id }}">{{hospital.name}}</a>
                >
                <a href="/reserve/department?departmentid={{ department.id }}">{{ department.name }}</a>
                >
                <span>{{doctor.name}}</span>
            </div>
        </div>
        <div id="div-doctorHead" class="row">
            <div id="div-doctorName" class="col-md-9 col-xs-12">
                <h1>{{doctor.name}}<span>{{doctor.post}}</span></h1>
                <p>医院：<a href="/reserve/hospital?hospitalid={{ hospital.id }}">{{hospital.name}}</a></p>
                <p>科室：<a href="/reserve/department?departmentid={{ department.id }}">{{ department.name }}</a></p>
            </div>
            <div id="div-departHead-hosEva" class="col-md-3 hidden-xs hidden-sm">
                <a href="#" class="">
                    评价分数：<span id="div-hosEva-grade">9.9</span><br><span>就医经验</span>
                </a>
            </div>
        </div>
        <div id="div-doctorMain"class="row div-mainMain">
            <div id="div-doctorMainLeft"class="col-md-9 col-xs-12">
                <div id="div-doctorinfo" class="row">
                    <div id="div-doctorMainLeft-img" class="col-sm-3 hidden-xs div-mainLeft-img">
                        <img class="img-rounded img-responsive" src="{{ doctor.img }}">
                    </div>
                    <div id="div-doctorMainLeft-info" class="col-sm-9 col-xs-12">
                        <p><span>擅长：</span>{{doctor.specialty}}</p>
                        <p><span>简介：</span>{{doctor.intro}}. </p>
                        <br/>
                        <button class="btn btn-sm btn-default"><span class="glyphicon glyphicon-heart-empty"></span>加入收藏</button>
                    </div>
                </div>
                <div id="div-doctorMainLeft-table" class="row">
                    <div id="div-doctorMainLeft-tableHead" class="col-xs-12">
                        <span><a id="div-doctorMainLeft-tableHead-a" href="#">登陆</a>查看最新号源情况</span>
                    </div>
                    <div id="div-doctorMainLeft-tableMain" class="table col-xs-12">
                        <table id="doctortable" class="table" style="margin-bottom: 0">
                            <tr id="datehead">
                                <th>&nbsp;</th>
                            </tr>
                            <tr id="0">
                                <th>上午</th>
                            </tr>
                            <tr id="1">
                                <th>下午</th>
                            </tr>
                            <tr id="2">
                                <th>晚上</th>
                            </tr>
                        </table>
                        <hr style="margin: 0"/>
                    </div>
                </div>
                <div id="div-doctorMainLeft-needToKnow" class="row col-xs-12">
                    <h1><预约须知></预约须知></h1>
                    <p>医院规则：<p>
                    <p>{{ hospital.notice }}</p>
                    <p>温馨提示：</p>
                </div>
            </div>
            <div id="div-doctorMainRight" class="col-md-3 hidden-xs hidden-sm">
                <div id="div-departOtherDoctor" class="normalBorder" style="padding: 10px">
                    <label>同科室其他医生</label><a href="#"><span style="float: right">更多</span></a>
                    <hr/>
                    <ul id="navigation">
                        {% for item in doctors %}
                            <li><a href="/reserve/doctor?doctorid={{ doctor.id }}">{{ doctor.name }}</a><span>{{doctor.post}}</span></li>
                        {% endfor %}
                    </ul>
                </div>
                <div class="fastHelp normalBorder">
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
    $(document).ready(function(){
        addTable();
    })
    function addTable(){
        var i=1;
        {% for name1,value1 in date %}
                $("#datehead").append("<th>{{ name1 }}</th>")
                {% for name,value in value1 %}
                    {% if !(value == 0) %}
                    $("tr#{{ name }}").append("<td><a onclick='iflogin({{ value }})'>预约</a></td>")
                    {% elseif value == 0 %}
                    $("tr#{{ name }}").append("<td>&nbsp;</td>")
                    {% endif %}
                {% endfor %}
        {% endfor%}
    }
    function iflogin(value){
        {% if loginfo == false %}
            alert("请登录之后再预约.");
        {% elseif loginfo == true %}
            $.post("/reserve/success",{"availableid":value},function(data){
            if (data.string=="预约成功"){
                alert(data.string);
                window.location.href="/reserve/showsuccess?availableid="+data.availableid;
            }else{
            alert(data.string);
            }},"JSON");
        {% endif %}
    }
</script>
{{ partial("shared/footer") }}