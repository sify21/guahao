<div class="row" style="margin-top: 20px">
    <div class="col-xs-8 col-xs-offset-2" style="background-color: #E7E4E2">
        <p style="font-size: 24px">预约成功！</p>
        <a href="#" style="color:#0000ff">发送一份保险给医生，</a>
        <p style="color:#CD7F32">小心意让医者无大忧</p>
        <p>预约成功短信已发送到手机<span style="padding-left:15px;color:#32CD32">{{ user.phone }}</span></p>
        <p>请关注以下内容:</p>
        <hr/>
        <div>
            <p>就诊人： </p>
            <p style="color:#A8A8A8">>{{ user.truename }}</p>
            <br/>
            <p>身份证号:</p>
            <p style="color:#A8A8A8">>{{ user.idcard }}</p>
            <br/>
            <p>邮箱:</p>
            <p style="color:#A8A8A8">>{{ user.email }}</p>
            <br/>
            <p>就诊医生:</p>
            <p style="color:#A8A8A8">>{{ doctor.name }}({{ doctor.post }})</p>
            <br/>
            <p>预约时间:</p>
            <p style="color:#A8A8A8">>{{ reservation.borntime }}</p>
            <br/>
            <p>就诊时间:</p>
            <p style="color:#A8A8A8">>{{ available.date }}({{available.starttime}}到{{available.endtime}})</p>
            <br/>
            <p>门诊类型:
                <span>{{ department.type }}({{ department.name }})</span>
            </p>
            <br/>
            <p>挂号费:
                <span style="color:#CD7F32">{{ doctor.fee }}元</span>
            </p>
        </div>
        <br/>
    </div>
</div>
<script>
    $(document).ready(window.print());
</script>