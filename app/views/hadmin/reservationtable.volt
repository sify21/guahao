<main id="content" role="main" style="margin-top: 10%;">
	<div class="container-fluid">
		<div class="row">
			{{ partial("shared/adminleft") }}
			<div class="col-sm-9 col-xs-12" style="height:600px">
				<label>医院名称</label>
				<br>
				<label>查看院方预约单</label>
				<br>
				<div>
					<table class="table">
						<tr>
							<th>订单号：</th>
							<th>姓名：</th>
							<th>预约医生：</th>
							<th>查看</th>
						</tr>
					</table>
				</div>
				<div id="admin-formgroup-table">
					<button>提交</button><button style="margin-left: 30px">返回</button>
				</div>
			</div>
		</div>
	</div>
</main>