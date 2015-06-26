{{ partial("shared/header") }}
<main>
    <div class="container">
        <div class="row">
            <div class="row norprint">
                <div id="div-successheader" class="col-xs-8 col-xs-offset-2" style="text-align: center">
                    <p style="font-size: 40px;color: lightseagreen">预约挂号 <img src="/img/yuyuesuccess.png"/></p>
                </div>
            </div>
            <div class="row" style="margin-top: 20px">
                <div class="col-xs-8 col-xs-offset-2" style="background-color: #E7E4E2">
                    <p style="font-size: 24px">预约成功！</p>
                    <a href="#" style="color:#0000ff">发送一份保险给医生，</a>
                    <p style="color:#CD7F32">小心意让医者无大忧</p>
                    <p style="color:000000>">预约成功短信已发送到手机<span style="padding-left:15px;color:#32CD32">{{ user.tele }}</span></p>
                    <p style="color:000000>">请关注以下内容:<a href="/other/doprint?reservationid={{ reservationid }}"><span class="glyphicon glyphicon-print" style="margin-left: 50px"></span>打印该预约单</a></p>
                    <hr/>
                    <div>
                        <p style="color:000000>">就诊人：</p>
                        <p style="color:#A8A8A8">>>{{ user.name }}</p>
                        <br/>
                        <p style="color:000000>">就诊医生:</p>
                        <p style="color:#A8A8A8">>>{{ doctor.name }}({{ hospital.name }})({{ doctor.post }})</p>
                        <br/>
                        <p style="color:000000>">就诊时间:</p>
                        <p style="color:#A8A8A8">>>{{ available.starttime }}--{{ available.endtime }}</p>
                        <br/>
                        <p style="color:000000>">门诊类型:
                            <span>{{ department.type }}({{ department.name }})</span>
                        </p>
                        <br/>
                        <p style="color:000000>">挂号费:
                            <span style="color:#CD7F32">{{ doctor.fee }}元</span>
                        </p>
                    </div>
                    <br/>
                </div>
            </div>
            <div class="row" style="margin-top: 10px">
                <div class="col-xs-8 col-xs-offset-2">
                    <div style= background:#fff;">
                        <p style="color:#A8A8A8">>注意事项:</p>
                        <p style="color:#A8A8A8">>1、您可以在<a href="/reserve/myhome?userid=={{ user.id }}" style="color:#0000FF">>我的预约单</a>内查看订单详情;</p>
                        <p style="color:#A8A8A8">>2、如果您预约成功，由于个人原因不能就诊，请及时<a href="/reserve/myhome?userid=={{ user.id }}" style="color:#0000FF">>取消订单;</a></p>
                        <p style="color:#A8A8A8">>3、如遇专家停诊，您的订单会被取消，我们会以短信通知到您，请保持手机畅通。</p>
                        <p style="color:#A8A8A8">>4、每个账号每月下单和取消订单数量有上限，请按需预约，若超出上限当月将不能再次预约。</p>
                    </div>
                </div>
            </div>
            <!--endprint-->
        </div>
    </div>
</main>
{{ partial("shared/footer") }}
