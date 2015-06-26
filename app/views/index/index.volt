{{ partial("shared/header") }}
<main id="content" role="main">
    <div class="container">
        <div class="row">
            <div id="Fastregister" class="col-md-3 normalBorder">
                <label style="font-size: 17px;width: auto">快 速 预 约</label><hr/>
                <div class="dropdown">
                    <label>地 区：</label>
                    <button xid="-1" class="btn btn-default dropdown-toggle" type="button" id="FastdropdownMenu1" data-toggle="dropdown">请选择<span class="caret"></span></button>
                    <ul id="_ul1" class="dropdown-menu dropdownList" role="menu" aria-labelledby="FastdropdownMenu1">
                        <li role="menuitem">请选择</li>
                        {% for province in provinces %}
                        <li role="menuitem">{{ province }}</li>
                        {% endfor %}
                    </ul>
                </div>
                <br/>
                <div class="dropdown">
                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <button xid="-1" class="btn btn-default dropdown-toggle disabled" type="button" id="FastdropdownMenu2" data-toggle="dropdown">
                        请选择
                        <span class="caret"></span>
                    </button>
                    <ul id="_ul2" class="dropdown-menu dropdownList" role="menu" aria-labelledby="FastdropdownMenu2">
                    </ul>
                </div>
                <hr/>
                <div class="dropdown">
                    <label>医 院：</label>
                    <button xid="-1" class="btn btn-default dropdown-toggle disabled" type="button" id="FastdropdownMenu3" data-toggle="dropdown">
                        请选择
                        <span class="caret"></span>
                    </button>
                    <ul id="_ul3" class="dropdown-menu dropdownList" role="menu" aria-labelledby="FastdropdownMenu3">
                    </ul>
                </div>
                <hr/>
                <div class="dropdown">
                    <label>科 室：</label>
                    <button xid="-1" class="btn btn-default dropdown-toggle disabled" type="button" id="FastdropdownMenu4" data-toggle="dropdown">
                        请选择
                        <span class="caret"></span>
                    </button>
                    <ul id="_ul4" class="dropdown-menu dropdownList" role="menu" aria-labelledby="FastdropdownMenu4">
                        <li role="menuitem">请选择</li>
                    </ul>
                </div>
                {#<button id="index-submit" style="margin-top: 10px" class="btn btn-default btn-md" onclick="ifchangepage($('#FastdropdownMenu1').html())">预约挂号</button>#}
                <form action="/index/reserve" onsubmit="return ifchangepage($('#FastdropdownMenu1').html())">
                    <input id="submit2" type="text" name="cityid" style="display: none" value="-1"/>
                    <input id="submit3" type="text" name="hospitalid" style="display: none" value="-1"/>
                    <input id="submit4" type="text" name="departmentid" style="display: none" value="-1"/>
                    <input id="index-submit" style="margin-top:10px" type="submit" class="btn btn-default btn-md" value="预约挂号"/>
                </form>
            </div>
            <div id="rollPhoto" class="col-md-6 hidden-xs hidden-sm">
                <div class="slider" id="slider">
                    <ul class="sliderbox">
                        <li>
                            <a href=""><img class="img-responsive" style="width:100%;" src="/img/穹妹4.jpg"/></a>
                        </li>
                        <li>
                            <a href=""><img class="img-responsive" src="/img/穹妹5.jpg"/></a>
                        </li>
                        <li>
                            <a href=""><img class="img-responsive" src="/img/穹妹6.jpg"/></a>
                        </li>
                    </ul>
                    <ul class="slidernav"></ul>
                    <ul class="slidertext">
                        <li><a href="">Lorem ipsum dolor sit1.</a></li>
                        <li><a href="">Lorem ipsum dolor sit2.</a></li>
                        <li><a href="">Lorem ipsum dolor sit3.</a></li>
                    </ul>
                    <div class="prev"></div>
                    <div class="next"></div>
                </div>
            </div>
            <div id="announcement" class="col-md-3 normalBorder">
                <label style="font-size: 17px">最 新 公 告</label><hr/>
                <ol class="decimal" style="text-align: left">
                    <li><a>者释公告</a></li>
                    <li><a>邺释公告</a></li>
                    <li><a>宥释公告</a></li>
                    <li><a>海释公告</a></li>
                </ol>
            </div>
        </div>
    </div>
</main>
{{ partial("shared/footer") }}
<script type="text/javascript">
    $(function(){
        $("#slider").powerSlider({handle:"fadeTo"});
        $(".code h3 span").each(function(i){
            $(this).click(function(){
                $(this).addClass("active").siblings().removeClass("active");
                $(".code pre").eq(i).show().siblings("pre").hide();
            })
        })
    });
    function ifchangepage(data){
        if(data == '请选择<span class="caret"></span>'){
            alert("请选择省份.");
            return false;
    }
        else{
            $("#submit2").val($("#FastdropdownMenu2").attr("xid"));
            $("#submit3").val($("#FastdropdownMenu3").attr("xid"));
            $("#submit4").val($("#FastdropdownMenu4").attr("xid"));
            return true;
        }
    }
    $(document).ready(function(){
        ul1click();
    })
</script>