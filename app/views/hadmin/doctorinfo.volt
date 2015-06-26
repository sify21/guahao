<main id="content" role="main" style="margin-top: 10%;">
	<div class="container-fluid">
		{{ partial("shared/adminleft") }}
		<div class="col-sm-9 col-xs-12" style="height:600px">
			<label>医院名称</label>
			<br>
			<label>维护医院信息</label>
			<hr>
			<div id="input-group">
				<label>医生姓名：</label><input class="admin-inputtext" value="123"/><br>
				<label>医生职位：</label><input class="admin-inputtext" value="123"/><br>
				<label>挂号费用：</label><input class="admin-inputtext" value="123"/><br>
				<label>医生特长：</label><input class="admin-inputtext" value="123"/><br>
				<label>所属科室：</label>
				<select>
					<option class="active">一级科室</option>
					<option>精神科医院</option>
					<option>耳科医院</option>
				</select>
				<select>
					<option class="active">二级科室</option>
					<option>精神科医院</option>
					<option>耳科医院</option>
				</select>
			</div>
			<form id="admin-formgroup">
				<button>提交</button>
				<button style="margin-left: 30px">返回</button>
			</form>
		</div>
	</div>
</main>