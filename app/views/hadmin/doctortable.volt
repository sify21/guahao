<main id="content" role="main" style="margin-top: 10%;">
	<div class="container-fluid">
		{{ partial("shared/adminleft") }}
		<div class="col-sm-9 col-xs-12" style="height:600px">
			<label>维护医院信息</label>
			<br>
			<label>医生信息</label>
			<table class="table">
				<tr>
					<th>医生名称</th>
					<th>所属科室</th>
					<th>剩余挂号数目</th>
					<th>医生特长</th>
					<th>详细修改</th>
				</tr>
				<tr>
					<td>孙涛</td>
					<td>内科</td>
					<td>0</td>
					<td>all</td>
					<td><a href="/hadmin/doctorinfo">修改</a></td>
				</tr>
			</table>
			<form id="admin-formgroup-table">
				<button>提交</button><button style="margin-left: 30px">返回</button>
			</form>
		</div>
	</div>
</main>