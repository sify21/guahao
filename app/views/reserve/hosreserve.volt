{{ partial("shared/header") }}
<main id="hrcontent" role="main">
    <div class="container div-mainMain">
        <div class="row">
{#主页左半部分#}
            <div id="div-hrMainLeft" class="col-md-9 col-sm-12">
{#包含头部的label标签、切换地区按钮、医院计数span#}
                <div class="row" id="div-areaHead">
                    <div class="col-xs-6 col-sm-3 col-md-3">
                        <span class="glyphicon glyphicon-map-marker" style="font-size: 22px;color: #29B4F0"></span>
                        <label id="hr-label1">{{ province }}<small style="margin-left: 20px">{{ city }}</small></label>
                    </div>
                    <div class="col-xs-6 col-sm-9 col-md-9 div-changecity">
                        <div class="dropdown " style="margin-top: 5px; float:left">
                            <button id="hrHeadProvinceMenu" class="btn btn-default dropdown-toggle" type="button"  data-toggle="dropdown">
                                切换省份
                            </button>
                            <ul id="provinceList" class="dropdown-menu dropdownList" aria-labelledby="hrHeadProvinceMenu" role="menu">
                                {% for item in provinces %}
                                <li id="provinceli" onclick="getcitylist(this)">{{ item }}</li>
                                {% endfor %}
                            </ul>
                        </div>
                        <div class="dropdown " style="margin-top: 5px; float:left">
                            <button id="hrHeadCityMenu" class="btn btn-default dropdown-toggle" type="button"  data-toggle="dropdown">
                                切换城市
                            </button>
                            <ul id="cityList" class="dropdown-menu dropdownList" aria-labelledby="hrHeadCityMenu" role="menu">
                                {% for item in cities %}
                                <li id="cityli"><a href="/reserve/hosreserve?cityid={{ item.id }}&pagenumber=1">{{ item.name }}</a></li>
                                {% endfor %}
                            </ul>
                        </div>
                    </div>
                </div>
                <hr/>
                <div class="row" id="div-hosCount">
                    <div class="col-xs-12">
                        共找到{{ hoscount }}家医院
                    </div>
                </div>
                <hr/>
{#包含按等级和类型搜索医院表,排序按钮#}
                <div class="row" id="div-hosTable">
                    <div id="hrTableLeft"  class="normalBorder">
                        <table class="table" style="margin-bottom: 0px">
                            <tr>
                                <td class="hrTableLeft-title">医院等级</td>
                                <td><a href="#">三级甲等</a></td>
                                <td><a href="#">三级医院</a></td>
                                <td><a href="#">二级医院</a></td>
                                <td><a href="#">一级医院</a></td>
                            </tr>
                            <tr style="border-top-style: solid;border-top-color:#e7e7e7;border-top-width: thin;">
                                <td class="hrTableLeft-title">医院类型</td>
                                <td><a href="#">综合医院</a></td>
                                <td><a href="#">对外专科</a></td>
                                <td><a href="#">妇产科医院</a></td>
                                <td><a href="#">皮肤科医院</a></td>
                                <td><a href="#">不孕不育医院</a></td>
                                <td><a href="#">中医医院</a></td>
                                <td><a href="#">儿科医院</a></td>
                                <td><select  form="0101">
                                        <option class="active">其他</option>
                                        <option>精神科医院</option>
                                        <option>耳科医院</option>
                                    </select></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row" id="div-hosSort">
                    <div class="col-xs-12">
                        <div class="dropdown" style="margin-top: 15px">排序方式：
                            <button class="btn btn-default dropdown-toggle" type="button" id="hrHeadSortMenu" data-toggle="dropdown">
                                请选择排序方式<span class="glyphicon glyphicon-chevron-down"></span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><button id="sortbyeva">按评价度排序</button>></li>
                                <li><button id="sortbylastnum">按号源数排序</button>></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div id="div-hrhoslist" class="div-hrHosMain col-xs-12">
                        {% for hospital in hospitals %}
                            <div class="row div-singleHospital" >
                                <div class="col-sm-2 div-hr-hosImg hidden-xs normalBorder" style="border-left-width: 0">
                                    <img class="img-responsive" src="{{ hospital.img }}"/>
                                </div>
                                <div class="col-sm-5 col-xs-6 div-hr-hosInfo normalBorder" style="border-left-width: 0">
                                    <a href="/reserve/hospital?hospitalid={{ hospital.id }}">{{ hospital.name }}<span style="margin-left: 40px">{{ hospital.level }}</span></a>
                                    <p><span class="glyphicon glyphicon-earphone" style="margin-right: 10px"></span>暂无</p>
                                    <p><span class="glyphicon glyphicon-map-marker" style="margin-right: 10px"></span>{{ hospital.street }}</p>
                                </div>
                                <div class="col-sm-3 col-xs-4 div-hr-hosEva normalBorder" style="border-left-width: 0">
                                    <p><span class="glyphicon glyphicon-heart-empty"></span></p>
                                    {#医院评价分数#}
                                    <p>评价分数:9.9</p>
                                    {#剩余号源数量#}
                                    <p>剩余号源数量:99</p>
                                </div>
                                <div class="col-sm-2 hidden-xs div-hr-Button" style="border-left-width:0px; border-right-style: none">
                                    <a href="/reserve/hospital?hospitalid={{ hospital.id }}" class="btn btn-default btn-lg hosButton" role="button">挂号</a>
                                </div>
                                <div class="col-xs-2 hidden-sm hidden-md hidden-lg div-hr-Button" style="border-left-width:0px; border-right-style: none">
                                    <a href="/reserve/hospital?hospitalid={{ hospital.id }}" class="btn btn-default btn-xs hosButton" role="button">挂号</a>
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                </div>
         {#分页#}
                <div class="row">
                    <div id="div-hrchangepage" class="col-xs-12">
                        <nav style="text-align: center">
                            <ul class="pagination">
                                {% if pagecount <=1 %}
                                    <li class="active"><a href="/reserve/hosreserve?cityid={{ cityid }}&pagenumber=1">1</a></li>
                                {% elseif pagecount <= 5 %}
                                    {% for index in 1..pagecount %}
                                        {% if index == pagenumber %}
                                        <li class="active"><a href="/reserve/hosreserve?cityid={{ cityid }}&pagenumber={{ index }}">{{ index }}</a></li>
                                        {% else %}
                                        <li><a href="/reserve/hosreserve?cityid={{ cityid }}&pagenumber={{ index }}">{{ index }}</a></li>
                                        {% endif %}
                                    {% endfor %}
                                {% else %}
                                    {% if pagenumber < 3 %}
                                        {% for index in 1..5 %}
                                            {% if index == pagenumber %}
                                                <li class="active"><a href="/reserve/hosreserve?cityid={{ cityid }}&pagenumber={{ index }}">{{ index }}</a></li>
                                            {% else %}
                                                <li><a href="/reserve/hosreserve?cityid={{ cityid }}&pagenumber={{ index }}">{{ index }}</a></li>
                                            {% endif %}
                                        {% endfor %}
                                    {% else %}
                                        <li><a href="#">&laquo;</a></li>
                                        <li style="float:left">......</li>
                                        {% for index in pagenumber-2..pagenumber+2 %}
                                            {% if index < pagecount %}
                                                {% if index==pagenumber %}
                                                    <li class="active"><a href="/reserve/hosreserve?cityid={{ cityid }}&pagenumber={ index }}">{{ index }}</a></li>
                                                {% else %}
                                                    <li class="active"><a href="/reserve/hosreserve?cityid={{ cityid }}&pagenumber={ index }}">{{ index }}</a></li>
                                                {% endif %}
                                            {% endif %}
                                        {% endfor %}
                                        {% if pagecount-pagenumber>2 %}
                                            <li style="float:left">......</li>
                                            <li><a href="#">&raquo;</a></li>
                                        {% endif %}
                                    {% endif %}
                                {% endif %}
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div id="div-hrMainRight" class="col-md-3 hidden-xs hidden-sm">
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
                    <div class="hrRightImg"><img class="img-responsive" src="/img/穹妹7.jpg" alt=""/></div>
                    <div class="hrRightImg"><img class="img-responsive" src="/img/穹妹8.jpg" alt=""/></div>
                    <div class="hrRightImg"><img class="img-responsive" src="/img/穹妹9.jpg" alt=""/></div>
                    <div class="hrRightImg"><img class="img-responsive" src="/img/穹妹10.jpg" alt=""/></div>
                    <div class="hrRightImg"><img class="img-responsive" src="/img/穹妹11.jpg" alt=""/></div>
                </div>
        </div>
    </div>
</main>
<script type="text/javascript">
    function getcitylist(data1){
        $("#hrHeadProvinceMenu").html($(data1).html());
        $.post("/reserve/province",{"province":$(data1).html()},function(data3){changecitylist(data3);},"JSON");
    }
    function changecitylist(data){
        $("#cityList li").unbind();
        $("#cityList").empty();
        for(i in data.cities){
            console.log(i);
            $("#cityList").append("<li id='cityli'><a href='/reserve/hosreserve?cityid="+i+"&pagenumber=1'>"+data.cities[i]+"</a></li>");
        }
    }
</script>
{{ partial("shared/footer") }}