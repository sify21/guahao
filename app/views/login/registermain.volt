{{ partial("shared/header") }}
<main id="content" role="main">
    <div class="container">
        <div class="row">
            <div id="div-registerable" class="col-md-6 col-md-offset-3 col-xs-12">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="div-inputvname" class="col-sm-3 control-label">用户名：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="div-inputusername" placeholder="用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="div-inputpassword" class="col-sm-3 control-label">密　码：</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="div-inputpassword" placeholder="密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="div-inputname" class="col-sm-3 control-label">姓　名：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="div-inputname" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="div-input-id-number" class="col-sm-3 control-label">身份证：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="div-input-idnumber" placeholder="身份证">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="div-input-phone" class="col-sm-3 control-label">手机号：</label>
                        <div class="col-sm-9">
                            <input type="tel" class="form-control" id="div-input-phone" placeholder="手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="div-input-phone" class="col-sm-3 control-label">邮　箱：</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" id="div-input-email" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="div-input-phonecheck" class="col-sm-3 control-label">验证码：</label>
                        <img src="/login/code" class="col-sm-3 img-responsive" id="div-check-img2" />
                        <input type="text" class="col-sm-3 form-control" id="div-input-checkcode" style="width:auto" placeholder="验证码">
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 col-sm-offset-3 col-xs-6"><a href="javascript:register()" role="button" class="btn btn-default">注册</a></div>
                        <div class="col-sm-3 col-xs-6" style="text-align: right"><a href="javascript:changecheckcode()" class="btn btn-default">更换验证码</a></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript">
    function register(){
        $.post(
                "/login/register",
                {
                    "name":$("#div-inputusername").val(),
                    "password":$("#div-inputpassword").val(),
                    "truename":$("#div-inputname").val(),
                    "idcard":$("#div-input-idnumber").val(),
                    "phone":$("#div-input-phone").val(),
                    "email":$("#div-input-email").val(),
                    "code":$("#div-input-checkcode").val()
                },
                function(data){afterregister(data);}
        )
    }
    function afterregister(data){
        if(data=="成功")
            window.location.href="/login/rsuccess";
        else
            alert(data);
    }
    function changecheckcode(){
        $("#div-check-img2").attr("src","/login/code");
    }
</script>
{{ partial("shared/footer") }}