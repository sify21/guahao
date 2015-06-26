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
							<th>医生姓名</th>
							<th>所属一级科室</th>
							<th>所属二级科室</th>
							<th>医生联系电话</th>
							<th>医生所剩号源数</th>
							<th>修改</th>
						</tr>
						<tr>
							<td>左海</td>
							<td>外科</td>
							<td>骨科</td>
							<td>18888888888</td>
							<td>15</td>
							<td><a>修改</a></td>
						</tr>
					</table>
					<form id="admin-formgroup-table">
						<button>提交</button><button style="margin-left: 30px">返回</button>
					</form>
				</div>
			</div>
		</div>

</main>
