<main id="content" role="main" style="margin-top: 10%;">
	<div class="container-fluid">
		{{ partial("shared/adminleft") }}
		<div class="col-sm-9 col-xs-12" style="height:600px">
			<label>医院名称</label>
			<br>
			<label>管理员个人信息</label>
			<hr>
			<div id="input-group">
				<label>用户名：</label><input type="text" class="admin-inputtext"/><br>
				<label>密码：</label><input type="text" class="admin-inputtext"/><br>
				<label>姓名：</label><input type="text" class="admin-inputtext"/><br>
				<label>身份证号：</label><input type="text" class="admin-inputtext"/><br>
				<label>手机号码：</label><input type="text" class="admin-inputtext"/><br>
				<label>电子邮箱：</label><input type="text" class="admin-inputtext"/><br>
				<label>用户类别：</label><input type="text" class="admin-inputtext"/><br>
				<label>所属医院：</label><input type="text" class="admin-inputtext"/><br>
			</div>
			<div id="admin-formgroup">
				<button>提交</button><button style="margin-left: 30px">返回</button>
			</div>
		</div>
	</div>
</main>