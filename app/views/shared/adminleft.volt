<style type="text/css">
.listhead{
    font-size: 24px
}
.listdd{
    font-size: 18px
}
</style>
<div id="admin-leftlist" class="col-sm-3 col-xs-12" style="background-color: #f9f2f4; text-align: center;height:600px"">
    <label style="font-size: 32px">维护医院信息</label><br>
    <ul>
        <li>
            <a class="listhead" href="javascript:ul1open()">医院信息</a><br>
            <ul id="ul1">
                <li class="listdd"><a href="/hadmin/hospitalinfo?hospitalid={{ hospital.id }}">修改医院信息</a></li>
                <li class="listdd"><a href="/hadmin/departmenttable?hospitalid={{ hospitalid }}">显示医院科室列表</a></li>
                <li class="listdd"><a href="/hadmin/hospitaldoctable?hospitalid={{ hospitalid }}">显示医院医生列表</a></li>
            </ul>
        </li>
        <li>
            <a class="listhead" href="javascript:ul2open()">科室信息</a><br>
            <ul id="ul2">
                <li class="listdd"><a href="/hadmin/departmentinfo?departmentid={{ department.id }}">修改科室信息</a></li>
                <li class="listdd"><a href="/hadmin/departmenttable?departmentid={{ department.id }}">显示医院医生列表</a></li>
            </ul>
        </li>
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(
            function(){
                $("#ul2").fadeOut(0);
            }
    )
    function ul1open(){
        $("#ul1").fadeToggle(800);
    }
    function ul2open(){
        $("#ul2").fadeToggle(800);
    }
</script>