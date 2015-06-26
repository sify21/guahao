{{ partial("shared/header") }}
<main>
    <div class="container">
        <div class="row"><!--路径导航-->
            <div class="div-route col-xs-12">
                <a href="/index/index">首页</a>
                >
                <span>个人中心</span>
            </div>
        </div>
        <!--路径导航-->

        <div class="row">
            <div id="div-myhome-left" class="col-sm-3 col-xs-12 normalBorder">
                <div class="media col-sm-6 hidden-xs" style="padding: 0px">
                    <img class="img-responsive" src="{{ user.img }}"/>
                </div>
                <div class="col-sm-6 col-xs-12" style="padding:0px;color:#ac2925">
                    <p class="media-heading"><span id="myhome-name">{{ user.name }},</span>你好!</p>

                    <p>欢迎来到医愿网.</p>
                </div>
                <div class="col-xs-12">
                    <ul id="div-myhome-MyTab" class="nav nav-pills nav-stacked" style="margin-top: 20px;text-align: center">
                        <li><a href="#YY" data-toggle="tab"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;我的预约单</a></li>
                        <li><a href="#ZX" data-toggle="tab"><span class="glyphicon glyphicon-phone-alt"></span>&nbsp;我的咨询</a></li>
                        <li><a href="#sc" data-toggle="tab"><span class="glyphicon glyphicon-briefcase"></span>&nbsp;我的收藏</a></li>
                        <li><a href="#gl" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span>&nbsp;账号管理</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- end left div -->
            <div id="MyTabContent" class="tab-content col-sm-9">
                <!--预约单-->
                <div class="row tab-pane fade col-sm-12" id="YY">
                    <div>
                        <span class="glyphicon glyphicon-list-alt"></span> <strong>管理预约单</strong>
                    </div>
                    <hr/>
                    <div class="check g-left">
                        <form  action="" method="post" id="0101"></form>
                        <label><strong>按状态筛选</strong></label>
                        <select  form="0101">
                            <option class="active">全部</option>
                            <option>待就诊</option>
                            <option>已就诊</option>
                        </select>
                    </div>
                    <div class="picker g-left">
                        <label>
                            预约时间：
                        </label>
                        <span class="g-datepicker">
                            <input type="text"  id="startTime" name="DateBegin" class="text" value="2010-01-01"/>
                        </span>
                        <span>-</span>
                        <span id="endtime" class="g-datepicker">
                            <input type="text"  id="endTime" name="DateEnd" class="text"  value="2014-12-21"/>
                        </span>
                    </div>
                    <div class="action g-left">
                        <a class="gb gb-grey2" href="#" id="sureBt">
                            <span class="gb-right">
                                <button class="gb-text">确定</button>>
                            </span>
                        </a>
                    </div>
                    <table border="0" class="table table-hover" align="center" cellspacing="1" cellpadding="0">
                        <tr>
                            <th>就诊日期</th>
                            <th>医生</th>
                            <th>就诊人</th>
                            <th>挂号费</th>
                            <th>订单状态</th>
                            <th>取消预约单</th>
                        </tr>
                        {% for item in all %}
                            <tr style="margin-top: 10px" align="center" >
                            <td>{{ item["reservationdate"] }}</td>
                            <td>
                                <a href="">{{ item["doctorname"] }}</a><br>
                                <a href="">{{ item["departmentname"] }}</a><br>
                                <a href="">{{ item["hospitalname"] }}</a>
                            </td>
                            <td>{{ user.name }}</td>
                            <td class="red-word">{{ item["doctorfee"] }}</td>
                            <td>{{ item["reservationstatus"] }}<br><a href="/reserve/showsuccess?availableid={{ item["availableid"] }}" >详情</a></td>
                            <td><a href="javascript:deletereservation({{ item["reservationid"]}})">取消</a>
                        </tr>
                        {% endfor %}
                    </table>
                </div>
                <!--预约单-->



                <!-- 咨询 -->
                <div class="tab-pane fade col-sm-12" id="ZX">
                    <div>
                        <span class="glyphicon glyphicon-phone-alt"></span> <strong>管理我的资讯</strong>
                    </div>
                    <hr/>
                    <div>
                        <ul class="nav nav-pills">
                            <li class="active"><a href="#">我的咨询</a></li>
                        </ul>
                        <hr/>
                    </div>
                </div>
                <!-- 咨询 -->

                <!--收藏 -->
                <div class="tab-pane fade col-sm-12" id="sc" >
                    <div>
                        <span class="glyphicon glyphicon-briefcase"></span> <strong>查看相关收藏</strong>
                    </div>
                    <hr/>
                    <div>
                        <input id=a type="button" value="医生">
                        <input id=b type="button" value="科室">
                        <input id=c type="button" value="医院">
                        <hr>
                    </div>
                    <div id="1" style="display: none">
                        <table border="0" class="table" align="center" cellspacing="1" cellpadding="0">
                            <tr>
                                <td><a href="">王五</a></td>
                                <td><a href="">北京第一医院</a></td>
                                <td><a href="">精神科</a></td>
                                <td><a href="">取消收藏</a></td>
                            </tr>
                            <tr>
                                <td><a href="">赵六</a></td>
                                <td><a href="">上海第二医院</a></td>
                                <td><a href="">生殖科</a></td>
                                <td><a href="">取消收藏</a></td>
                            </tr>
                        </table>
                    </div>
                    <div id="2" style="display: none">
                        <table border="0" class="table" align="center" cellspacing="1" cellpadding="0">
                            <tr>
                                <td><a href="">骨科</a></td>
                                <td><a href="">北京第一医院</a></td>
                                <td><a href="">取消收藏</a></td>
                            </tr>
                            <tr>
                                <td><a href="">眼科</a></td>
                                <td><a href="">北京第四医院</a></td>
                                <td><a href="">取消收藏</a></td>
                            </tr>
                        </table>
                    </div>
                    <div id="3" style="display: none">
                        <table border="0" class="table" align="center" cellspacing="1" cellpadding="0">
                            <tr>
                                <td><a href="">北医三院</a></td>
                                <td><a href="">北京市海淀区</a></td>
                                <td><a href="">取消收藏</a></td>
                            </tr>
                            <tr>
                                <td><a href="">浙江人民医院</a></td>
                                <td><a href="">浙江省杭州市</a></td>
                                <td><a href="">取消收藏</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <script type="text/javascript">
                    $("#a").click(function () {
                        $("#1").css("display", "block");
                        $("#2").css("display", "none");
                        $("#3").css("display", "none");
                    });
                    $("#b").click(function () {
                        $("#1").css("display", "none");
                        $("#2").css("display", "block");
                        $("#3").css("display", "none");
                    });
                    $("#c").click(function () {
                        $("#1").css("display", "none");
                        $("#2").css("display", "none");
                        $("#3").css("display", "block");
                    });
                </script>
                <!--收藏 -->

                <!-- 个人信息管理 -->
                <div class="tab-pane fade col-sm-12" id="gl">
                    <div>
                        <span class="glyphicon glyphicon-cog"></span> <strong>修改个人信息</strong>
                        <div>
                            <button id="info" type="button1">个人信息</button>
                            <button id="psw" type="button1">修改密码</button>
                            <button id="tx" type="button1">头像设置</button>
                        </div>

                        <div id="xx" style="display: none">
                            登录名:<br> 昵称:(未设置昵称,点此设置)<br>真实姓名:<br> 身份证号:<br> 详细地址:(点此设置)<br> 医保卡:(点此设置)<br> 邮箱:<br>
                            注册时间:<br>手机认证:（修改手机号）<br>邮箱认证:（修改邮箱号）
                        </div>

                        <div id="mm" style="display: none">
                            <form id="myForm" action="" method="get">
                                *原密码：<input type="password" name="last" size=""><br/>
                                *新密码：<input type="password" name="new" size=""><br/>
                                *确认新密码：<input type="password" name="new1" size=""><br/>
                                <input type="button" onclick="formSubmit()" value="确认">
                            </form>
                            <script type="text/javascript">
                                function formSubmit() {
                                    document.getElementById("myForm").submit()
                                }
                            </script>
                        </div>


                        <div id="nn" style="display: none">
                            <div>
                                <p><strong>添加或更改你的头像</strong><br>
                                    从电脑中选择一项你喜欢的照片上传，仅支持JPEG、GIF或PNG图片文件，且大小不超过2M。</p><br/>
                                <input type="file" hidden="hidden">
                                <button id=123 class="btn btn-primary">上传</button>
                            </div>
                            <script>
                                $(function () {
                                    $("#123").click(function () {
                                        $('input[type=file]').click();
                                    });
                                });
                            </script>
                        </div>
                        <script type="text/javascript">
                            $("#info").click(function () {
                                $("#xx").css("display", "block");
                                $("#mm").css("display", "none");
                                $("#nn").css("display", "none");
                            });
                            $("#psw").click(function () {
                                $("#xx").css("display", "none");
                                $("#mm").css("display", "block");
                                $("#nn").css("display", "none");
                            });
                            $("#tx").click(function () {
                                $("#xx").css("display", "none");
                                $("#mm").css("display", "none");
                                $("#nn").css("display", "block");
                            });
                        </script>
                    </div>
                </div>
                <!-- 个人信息管理 -->
                <hr/>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript">
    function deletereservation(id){
        $.post(
                "/home/delete",
                {"reservationid":id},
                function (data){ifdeletesuccess(data)}
        );
    }
    function ifdeletesuccess(data){
        if (data=="预约单取消成功"){
            alert(data);
            window.location.href="/home/myhome";
        }
        else{
            alert(data);
        }
    }
    $(document).ready(
        function(){
            $("#YY").addClass("active");
            $("#YY").addClass("in");
        }
    )
</script>
{{ partial("shared/footer") }}