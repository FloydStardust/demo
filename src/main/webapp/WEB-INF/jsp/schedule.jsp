<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>VKC CRM v1.1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery UI -->
    <link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">

    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">

    <!-- <link href="vendors/datatables/dataTables.bootstrap.css" rel="stylesheet" media="screen"> -->

    <!-- datatable-css引入-Floyd -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" type="text/css"/>
	  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" type="text/css"/>
	  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/editor.bootstrap.min.css" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

	<style type="text/css">
        body {
            font-family: "Microsoft YaHei";
        }
        th, td { white-space: nowrap; }
	    div.dataTables_wrapper {
	        margin: 0 auto;
	    }
 
	    div.container {
	        width: 80%;
	    }
    </style>
  </head>
  <body>
  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="index.html">VKC-CRM管理系统</a></h1>
	              </div>
	           </div>
	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12">
	                  <div class="input-group form">
	                       <input type="text" class="form-control" placeholder="Search...">
	                       <span class="input-group-btn">
	                         <button class="btn btn-primary" type="button">Search</button>
	                       </span>
	                  </div>
	                </div>
	              </div>
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                    <ul class="nav navbar-nav">
	                      <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                          <li><a href="profile.html">Profile</a></li>
	                          <li><a href="logout">Logout</a></li>
	                        </ul>
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>
    <div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <%--<li><a href="index"> Dashboard</a></li>--%>
					<li><a href="<%=request.getContextPath()%>/portfolio"> Portfolio</a></li>
					<li class="submenu">
						<a href="#">
							<i class="glyphicon glyphicon-list"></i> PLW
							<span class="caret pull-right"></span>
						</a>
						<!-- Sub menu -->
						<ul>
							<li id="leads_link"><a href="<%=request.getContextPath()%>/leads">Leads</a></li>
							<li id="pipeline_link"><a href="<%=request.getContextPath()%>/pipeline">Pipeline</a></li>
							<li id="watch_link"><a href="<%=request.getContextPath()%>/watchlist">Watchlist</a></li>
							<li id="pass_link"><a href="<%=request.getContextPath()%>/pass">Pass</a></li>
						</ul>
					</li>
					<li class="current"><a href="<%=request.getContextPath()%>/schedule">Schedule</a></li>
                </ul>
             </div>
		  </div>
		  <div class="col-md-10">
  			<div class="content-box-large">
  				<div class="panel-heading clearfix">
					<div class="panel-title pull-left"><h3 id="scheduleDate">VKC日程安排</h3></div>
					<div class="pull-right">
						<button type="button" class="btn btn-primary" id="addModalBtn" data-toggle="modal" data-target="#addModal">录入日程</button>
					</div>
				</div>
  				<div class="panel-body" id="container">
  					<!-- 已投项目表格 -->
  					<table class="table table-hover table-striped table-bordered" id="scheduleTable" style="width: 100%;">
						<thead>
							<tr>
								<th>姓名</th>
								<th>日期</th>
								<th>时间</th>
								<th>地点</th>
								<th>事件</th>
							</tr>
						</thead>
					</table>
  				</div>
  			</div>
		  </div>
		</div>
    </div>

	<!-- Add Schedule Modal -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="addModalTitle">添加日程信息</h3>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group row">
							<label for="addModalDate" class="col-sm-2 col-form-label">日期</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="addModalDate" placeholder="yyyy-MM-dd(如：2019/1/1，无需添加0)">
							</div>
						</div>

						<div class="form-group row">
							<label for="addModalStart" class="col-sm-2 col-form-label">开始时间</label>
							<div class="col-sm-10">
								<select class="form-control" id="addModalStart">
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label for="addModalEnd" class="col-sm-2 col-form-label">结束时间</label>
							<div class="col-sm-10">
								<select class="form-control" id="addModalEnd">
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label for="addModalVenue" class="col-sm-2 col-form-label">地点</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="addModalVenue" placeholder="">
							</div>
						</div>

						<div class="form-group row">
							<label for="addModalContent" class="col-sm-2 col-form-label">事件</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="addModalContent" rows="3"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div class="float-right"><h3>提交前请再次检查</h3></div>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
					<button id="addSchedule" type="button" class="btn btn-primary" onclick="addSchedule()">保存</button>
				</div>
			</div>
		</div>
	</div>

    <footer>
         <div class="container">
         
            <div class="copy text-center">
               Copyright 2014 <a href='#'>Website</a>
            </div>
            
         </div>
    </footer>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <!-- jQuery UI -->
    <!-- <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- datables-js引入-Floyd -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/buttons.bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>


    <script src="<%=request.getContextPath()%>/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
    <script type="text/javascript">
		var basepath = "<%=request.getContextPath()%>";
		var token = getCookie("access_token");
		var currentUser = null;
		var time_split = null;

		$(document).ready( function () {
			$.ajax({
				url: basepath + 'api/user/current',
				type: "GET",
				contentType : 'application/json;charset=utf-8',
				beforeSend: function (xhr) {
					xhr.setRequestHeader("authorization", "Bearer " + token);
				}
			}).done(function (data) {
				if(data.responseCode == "RESPONSE_OK"){
					currentUser = data.data;
					console.log("currentUser:", currentUser)
					$.ajax({
						url: basepath + 'api/schedule/time_split',
						type: "GET",
						contentType : 'application/json;charset=utf-8',
						beforeSend: function (xhr) {
							xhr.setRequestHeader("authorization", "Bearer " + token);
						}
					}).done(function (data) {
						if(data.responseCode == "RESPONSE_OK"){
							let options = [];
							time_split = data.data;
							$.each(time_split, function (k, v) {
								options.push("<option value='" + k + "'>" + v + "</option>");
							});
							$("#addModalStart").html(options.join(''));
							$("#addModalEnd").html(options.join(''));
							loadWeekSchedule();
						}
					});
				}
			});

			$('#addModal').on('hidden.bs.modal', function () {
				$(this).find("input,textarea,select")
						.val('')
						.end();
				$("#addModal").removeAttr("data-id");
				$("#addSchedule").removeClass("update");
			});
		});

		/**
		 * 加载日程表
		 */
		function loadWeekSchedule() {
			table = $('#scheduleTable').DataTable({
				ajax:  {
					url: basepath + '/api/schedule/week',
					type: "GET",
					contentType : 'application/json;charset=utf-8',
					beforeSend: function (xhr) {
						xhr.setRequestHeader("authorization", "Bearer " + token);
					}
				},
				columns: [
					{ data: "username" },
					{ data: "date" },
					{ data: null, render: function (data, type, row) {
							return time_split[row.start] + " - " + time_split[row.end];
						} },
					{ data: "venue" },
					{ data: "event" }
				],
				searching: true, // 可搜索
				order: [[0, 'asc']],
				autoWidth: false,
			});
			$('#scheduleTable tbody').on('dblclick', 'tr', function () {
				console.log(currentUser);
				var data = table.row( this ).data();
				if(currentUser.userName == data.username) {
					$('#addModalBtn').click();
					$("#addModal").attr("data-id", data.id);
					$("#addModalDate").val(data.date.split(' ')[0]);
					$("#addModalStart").val(data.start);
					$("#addModalEnd").val(data.end);
					$("#addModalVenue").val(data.venue);
					$("#addModalContent").val(data.event);
					$("#addSchedule").addClass("update");
				} else {
					window.alert("只能修改自己的日程！");
				}
			});
		}

		/**
		 *  添加一条日程
		 */
		function addSchedule() {
			let form = {
				"date": new Date($("#addModalDate").val()).getTime(),
				"start": $("#addModalStart").val(),
				"end": $("#addModalEnd").val(),
				"creatorId": currentUser.id,
				"content": $("#addModalContent").val(),
				"venue": $("#addModalVenue").val(),
			};
			if($("#addSchedule").hasClass("update")){
				form["uid"] = $("#addModal").attr("data-id")
			}

			let formData = JSON.stringify(form);

			$.ajax({
				url: basepath + '/api/schedule',
				type: 'POST',
				data: formData,
				dataType: 'json',
				contentType:"application/json",
				beforeSend: function (xhr) {
					xhr.setRequestHeader("authorization", "Bearer " + token);
				}
			}).done(function (data) {
				if (data.responseCode == "RESPONSE_OK"){
					alert("添加成功！");
					window.location.reload();
				} else {
					alert(data.description);
				}
			});
		}

    </script>
  </body>
</html>