
<main id="content" role="main" style="margin-top: 10%;">
	<div class="container-fluid">
		<div class="row">
			{{ partial("shared/adminleft") }}
			<div class="col-sm-9 col-xs-12" style="height:600px">
				<label>医院名称</label>
				<br>
				<label>医院科室列表</label>
				<br>
				<div>
					<table class="table">
						<tr>
							<th>科室名称</th>
							<th>包含人数</th>
							<th>所属一级科室</th>
							<th></th>
						</tr>
						<tr>
							<td>骨科</td>
							<td>12</td>
							<td>外科</td>
							<td><a href="departmentinfo.volt">修改</a></td>
						</tr>
					</table>
					<form id="admin-formgroup-table">
						<button>提交</button><button style="margin-left: 30px">返回</button>
					</form>
				</div>
			</div>
		</div>
</main>
