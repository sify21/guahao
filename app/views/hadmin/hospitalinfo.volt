<main id="content" role="main" style="margin-top: 10%;">
	<div class="container-fluid">
		{{ partial("shared/adminleft") }}
		<div class="col-sm-9 col-xs-12" style="height:600px">
			<label>医院名称</label>
			<br>
			<h1>维护医院信息</h1>
			<hr>
			<div id="input-group">
				<label>医院名称：</label><input type="text" class="admin-inputtext"/><br>
				<label>医院地点：</label><input type="text" class="admin-inputtext"/><br>
				<label>等级：</label><input type="text" class="admin-inputtext"/><br>
				<label>开放科室：</label><input type="text" class="admin-inputtext"/><br>
				<label>医院图片：</label><input type="text" class="admin-inputtext"/><br>
				<label>预约规则：</label><input type="text" class="admin-inputtext"/><br>
			</div>
			<div id="admin-formgroup">
				<button>提交</button>
				<button style="margin-left: 30px">返回</button>
			</div>
		</div>
	</div>
</main>