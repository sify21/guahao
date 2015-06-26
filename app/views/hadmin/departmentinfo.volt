<main id="content" role="main" style="margin-top: 10%; top:600px" >
	<div class="container-fluid">
		<div class="row">
			{{ partial("shared/adminleft") }}
			<div class="col-sm-9 col-xs-12" style="height:600px">
				<label>医院名称</label>
				<br>
				<label>维护科室信息</label>
				<hr>
				<div id="input-group">
					<label>科室名称：</label><input class="admin-input" value="123"/><br>
					<label>科室简介：</label><input class="admin-input" value="123"/><br>
				</div>
				<form id="admin-formgroup" class="form-group" style="margin-left: 10%">
					<button>提交</button>
					<button style="margin-left: 30px">返回</button>
				</form>
			</div>
		</div>
	</div>
</main>
