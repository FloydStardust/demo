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
	  <link href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <!-- styles -->
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">


    <!-- <link href="vendors/datatables/dataTables.bootstrap.css" rel="stylesheet" media="screen"> -->

    <!-- datatable-css引入-Floyd -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" type="text/css"/>
	  <link rel="stylesheet" href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" type="text/css"/>
	  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/editor.bootstrap.min.css" type="text/css"/>
      <link rel="stylesheet" href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" type="text/css"/>
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
        /*th, td { white-space: nowrap; }*/
 
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
	                 <h1><a href="#">VKC-CRM管理系统</a></h1>
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
								<li><a href="<%=request.getContextPath()%>/password">密码修改</a></li>
								<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
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
                    <li><a href="<%=request.getContextPath()%>/lp">LP</a></li>
                    <li><a href="<%=request.getContextPath()%>/vendor">Vendor</a></li>
                </ul>
             </div>
		  </div>
		  <div class="col-md-10">
  			<div class="content-box-large">
  				<div class="panel-heading clearfix" id="bigTitle">
					<div class="panel-title pull-left"><h3 id="scheduleDate">VKC日程安排-按用户名筛选</h3></div>
					<div class="pull-right">
						<button type="button" class="btn btn-warning" id="addOthersModalBtn" onclick="addOthersModalShow()">录入他人日程</button>
						<button type="button" class="btn btn-primary" id="addModalBtn" data-toggle="modal" data-target="#addModal">录入日程</button>
					</div>
				</div>
  				<div class="panel-body" id="container">
  					<!-- 已投项目表格 -->
                    <div class="form-group row">
                        <div class="col-md-3 col-sm-3">
                            <label for="selectPerson" class="col-sm-4 col-md-4 col-form-label"><h4 class="text-center">姓名</h4></label>
                            <div class="col-sm-8 col-md-8">
                                <select class="form-control" id="selectPerson"></select>
                            </div>

                        </div>

                        <div class="col-md-4 col-sm-4">
                            <label for="selectStartDate" class="col-sm-4 col-md-4 col-form-label"><h4 class="text-center">开始日期</h4></label>
                            <div class="form-group">
                                <div class='input-group date' id='selectStartDate'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <%--<div class="input-group date form_date col-sm-8 col-md-8" data-date="" data-date-format="yyyy MM dd"--%>
                                 <%--data-link-field="addModalDate" data-link-format="yyyy-mm-dd">--%>
                                <%--<input class="form-control" size="16" type="text" value="" readonly>--%>
                                <%--<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>--%>
                                <%--<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>--%>
                            <%--</div>--%>
                            <%--<input type="hidden" id="selectStartDate" value="" />--%>
                        </div>

                        <%--<span class="col-sm-1 col-md-1"></span>--%>

                        <div class="col-md-4 col-sm-4">
                            <label for="selectEndDate" class="col-sm-4 col-md-4 col-form-label"><h4 class="text-center">结束日期</h4></label>
                            <div class="form-group">
                                <div class='input-group date' id='selectEndDate'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <%--<div class="input-group date form_date col-sm-8 col-md-8" data-date="" data-date-format="yyyy MM dd"--%>
                                 <%--data-link-field="addModalDate" data-link-format="yyyy-mm-dd">--%>
                                <%--<input class="form-control" size="16" type="text" value="" readonly>--%>
                                <%--<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>--%>
                                <%--<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>--%>
                            <%--</div>--%>
                            <%--<input type="hidden" id="selectEndDate" value="" /><br/>--%>
                        </div>

                        <div class="col-md-1 col-sm-1">
                            <button type="button" class="btn btn-success pull-right" id="selectBtn"
                                    onclick="loadIndividualSchedule()">查询</button>
                        </div>
                    </div>
  					<table class="table table-hover table-striped table-bordered" id="scheduleTable" style="width: 100%;">
						<thead>
							<tr>
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
							<label for="addModalDate" class="col-sm-2 col-md-2 col-form-label">日期</label>
                            <div class="form-group">
                                <div class='input-group date col-sm-5 col-md-5' id='addModalDate'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
						</div>

						<div class="form-group row">
							<label for="addModalStart" class="col-sm-2 col-md-2 col-form-label">开始时间</label>
                            <div class="form-group">
                                <div class='input-group date col-sm-5 col-md-5' id='addModalStart'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                </div>
                            </div>
						</div>

						<div class="form-group row">
							<label for="addModalEnd" class="col-sm-2 col-md-2 col-form-label">结束时间</label>
                            <div class="form-group">
                                <div class='input-group date col-sm-5 col-md-5' id='addModalEnd'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                </div>
                            </div>
						</div>

						<div class="form-group row">
							<label for="addModalVenue" class="col-sm-2 col-md-2 col-form-label">地点</label>
							<div class="col-sm-5 col-md-5 input-group">
								<input type="text" class="form-control" id="addModalVenue" placeholder="">
							</div>
						</div>

						<div class="form-group row">
							<label for="addModalContent" class="col-sm-2 col-md-2 col-form-label">事件</label>
							<div class="col-sm-9 col-md-9 input-group">
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


    <!-- Add Others' Schedule Modal -->
    <div class="modal fade" id="addOthersModal" tabindex="-1" role="dialog" aria-labelledby="addOthersModalTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="addOthersModalTitle">添加日程信息</h3>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group row">
                            <label for="addOthersModalPerson" class="col-sm-2 col-md-2 col-form-label">人员</label>
                            <div class="col-sm-5 col-md-5 input-group">
                                <select class="form-control" id="addOthersModalPerson">
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="addOthersModalDate" class="col-sm-2 col-md-2 col-form-label">日期</label>
                            <div class="form-group">
                                <div class='input-group date col-sm-5 col-md-5' id='addOthersModalDate'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="addOthersModalStart" class="col-sm-2 col-md-2 col-form-label">开始时间</label>
                            <div class="form-group">
                                <div class='input-group date col-sm-5 col-md-5' id='addOthersModalStart'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="addOthersModalEnd" class="col-sm-2 col-md-2 col-form-label">结束时间</label>
                            <div class="form-group">
                                <div class='input-group date col-sm-5 col-md-5' id='addOthersModalEnd'>
                                    <input type='text' class="form-control" />
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-time"></span>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="addOthersModalVenue" class="col-sm-2 col-md-2 col-form-label">地点</label>
                            <div class="col-sm-5 col-md-5 input-group">
                                <input type="text" class="form-control" id="addOthersModalVenue" placeholder="">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="addOthersModalContent" class="col-sm-2 col-md-2 col-form-label">事件</label>
                            <div class="col-sm-9 col-md-9 input-group">
                                <textarea class="form-control" id="addOthersModalContent" rows="3"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <div class="float-right"><h3>提交前请再次检查</h3></div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                    <button id="addOthersSchedule" type="button" class="btn btn-primary" onclick="addOthersSchedule()">保存</button>
                </div>
            </div>
        </div>
    </div>

    <footer>
         <div class="container">
         
            <div class="copy text-center">
                Copyright <a href="http://www.vkc-partners.com/">VKC</a>, 2019
            </div>
            
         </div>
    </footer>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <!-- jQuery UI -->
    <!-- <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/es6-promise/dist/es6-promise.auto.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/moment.min.js" charset="UTF-8"></script>
    <!-- datables-js引入-Floyd -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTables.rowsGroup.js" charset="UTF-8"></script>

	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/locales/zh-cn.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.min.js"></script>


    <script src="<%=request.getContextPath()%>/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
    <script type="text/javascript">
		var basepath = "<%=request.getContextPath()%>";
		var token = getCookie("access_token");
		var currentUser = null;
		var allUser = null;
		var myauth = null;
		var table = null;

		$(document).ready( function () {
            $('#selectStartDate').datetimepicker({ format: 'l', locale: 'zh-cn' });
            $('#selectEndDate').datetimepicker({ format: 'l', locale: 'zh-cn' });
            $('#addModalDate').datetimepicker({ format: 'l', locale: 'zh-cn' });
            $('#addModalStart').datetimepicker({ format: 'LT', locale: 'zh-cn' });
            $('#addModalEnd').datetimepicker({ format: 'LT', locale: 'zh-cn' });
            $('#addOthersModalDate').datetimepicker({ format: 'l', locale: 'zh-cn' });
            $('#addOthersModalStart').datetimepicker({ format: 'LT', locale: 'zh-cn' });
            $('#addOthersModalEnd').datetimepicker({ format: 'LT', locale: 'zh-cn' });

			$.ajax({
				url: basepath + 'api/user/all',
				type: "GET",
				contentType : 'application/json;charset=utf-8',
				beforeSend: function (xhr) {
					xhr.setRequestHeader("authorization", "Bearer " + token);
				}
			}).done(function (data) {
				if(data.responseCode == "RESPONSE_OK"){
                    currentUser = data.data.current;
                    allUser = data.data.all;
                    loadSelectPerson(allUser);
                    $("#selectPerson").val(currentUser.id);
                    $('#selectStartDate').data("DateTimePicker").date(getFirstDayOfWeek(new Date()));
                    $('#selectEndDate').data("DateTimePicker").date(getLastDayOfWeek(new Date()));
                    $.ajax({
                        url: basepath + 'api/user/authorization',
                        type: "GET",
                        contentType : 'application/json;charset=utf-8',
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader("authorization", "Bearer " + token);
                        }
                    }).done(function (data) {
						if(data.responseCode == "RESPONSE_OK"){
                            myauth = [];
                            $.each(data.data, function (index, value) {
                                myauth.push(parseInt(index));
                            });
                            loadAddOthersModalFields(data.data);
						}
                    });
                    loadIndividualSchedule();
				}
			});

			$('#addModal').on('hidden.bs.modal', function () {
			    if($("#addModal").attr("data-id")){
                    $(this).find("input,textarea,select")
                        .val('')
                        .end();
                    $("#addModal").removeAttr("data-id");
                    $("#addSchedule").removeClass("update");
                }
			});

			$('#addOthersModal').on('hidden.bs.modal', function () {
				if($("#addOthersModal").attr("data-id")){
					$(this).find("input,textarea,select")
							.val('')
							.end();
					$("#addOthersModal").removeAttr("data-id");
					$("#addOthersSchedule").removeClass("update");
				}
			});
		});
		
		function addOthersModalShow() {
			if(myauth == null){
				swal({
					title: '你暂时没有他人的授权哦 (つд⊂)', type: 'warning', confirmButtonText: '返回'
				});
			} else {
				$('#addOthersModal').modal('show');
			}
		}

        /**
         * 加载单人日程表
         */
        function loadIndividualSchedule() {
            let start = $("#selectStartDate").find("input").val();
            let end = $("#selectEndDate").find("input").val();
            let user = $("#selectPerson").val();
            $.ajax({
                url: basepath + '/api/schedule/query',
                type: "GET",
                data: { "start": start, "end": end, "user": user },
                contentType : 'application/json;charset=utf-8',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authorization", "Bearer " + token);
                }
            }).done(function (data) {
                if(table == null){
                    table = $('#scheduleTable').DataTable({
                        data: data.data, order : [[0, "asc"]],
                        columns:  [
                            { title: "日期", data: "date", width: "20%"},
                            { title: "时间", data: null, width: "15%", render: function (data, type, row) {
                                    return row.start + " - " + row.end
                                }},
                            { title: "地点", data: "venue", width: "15%"},
                            { title: "事件", data: "event", width: "50%"} ],
                        // columnDefs: [{ "targets": [ 0 ], "visible": false, "searchable": false}],
                        autoWidth: false, paging: false,  rowsGroup: [0], searching: false, // 可搜索
                    });
                    $('#scheduleTable tbody').on('dblclick', 'tr', function () {
                        var data = table.row( this ).data();
                        let oldDate = data.date.split(' ')[0];
                        let selectedId = parseInt($("#selectPerson").val());
                        if(currentUser.id === selectedId) {
                            $("#addModal").attr("data-id", data.id);
                            $("#addModalTitle").html('修改日程信息（如果不修改时间，无需重选）');
                            $('#addModalDate').data("DateTimePicker").date(new Date(oldDate));
                            $('#addModalStart').data("DateTimePicker").date(data.start);
                            $('#addModalEnd').data("DateTimePicker").date(data.end);
                            $("#addModalVenue").val(data.venue);
                            $("#addModalContent").val(data.event);
                            $("#addSchedule").addClass("update");
                            $('#addModalBtn').click();
                        } else if( myauth.indexOf(selectedId)!=-1 ){
                            $("#addOthersModal").attr("data-id", data.id);
                            $("#addOthersModalTitle").html('修改日程信息（如果不修改时间，无需重选）');
                            $("#addOthersModalPerson").val(data.pid);
                            $('#addOthersModalDate').data("DateTimePicker").date(new Date(oldDate));
                            $('#addOthersModalStart').data("DateTimePicker").date(data.start);
                            $('#addOthersModalEnd').data("DateTimePicker").date(data.end);
                            $("#addOthersModalVenue").val(data.venue);
                            $("#addOthersModalContent").val(data.event);
                            $("#addOthersSchedule").addClass("update");
                            $('#addOthersModalBtn').click();
                        } else {
                            swal({
                                title: '只能修改自己的日程！', type: 'warning', confirmButtonText: '返回'
                            });
                        }
                    });
                } else {
                    if(data.responseCode == "RESPONSE_OK") {
                        table.clear().rows.add(data.data).draw();
                    } else {
                        table.clear().draw();
                    }
                }
            });
        }

		/**
		 * 加载双周日程表
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
                "sPaginationType": "full_numbers",
                paging: true, "aaSorting": [[0, 'asc']], rowsGroup: [0,1],
				aoColumns: [
					{ data: "username", width:"10%"},
					{ data: "date", width:"15%" },
					{ data: null, render: function (data, type, row) {
							return row.start + " - " + row.end;
						}, width:"15%" },
					{ data: "venue", width:"10%" },
					{ data: "event", width:"50%" }
				],
				searching: true, // 可搜索
				autoWidth: false, iDisplayLength: 25,
			});
			$('#scheduleTable tbody').on('dblclick', 'tr', function () {
				var data = table.row( this ).data();
				if(currentUser.userName == data.username) {
					var oldDate = data.date.split(' ')[0];
					$("#addModal").attr("data-id", data.id);
					$("#addModalTitle").html('修改日程信息（如果不修改时间，无需重选）')
					$("#addModalDate").val(oldDate);
					$("#addModalStart").val(data.start);
					$("#addModalEnd").val(data.end);
					$("#addModalVenue").val(data.venue);
					$("#addModalContent").val(data.event);
					$("#addSchedule").addClass("update");
					$('#addModalBtn').click();
				} else if( myauth.indexOf(data.username)!=-1 ){
					var oldDate = data.date.split(' ')[0];
					$("#addOthersModal").attr("data-id", data.id);
					$("#addOthersModalTitle").html('修改日程信息（如果不修改时间，无需重选）');
					$("#addOthersModalPerson").val(data.pid);
					$("#addOthersModalDate").val(oldDate);
					$("#addOthersModalStart").val(data.start);
					$("#addOthersModalEnd").val(data.end);
					$("#addOthersModalVenue").val(data.venue);
					$("#addOthersModalContent").val(data.event);
					$("#addOthersSchedule").addClass("update");
					$('#addOthersModalBtn').click();
				} else {
                    swal({
                        title: '只能修改自己的日程！', type: 'warning', confirmButtonText: '返回'
                    });
				}
			});
		}

		function addOthersSchedule() {
            let date = $("#addOthersModalDate").find("input").val();
            let start = $("#addOthersModalStart").find("input").val();
            let end = $("#addOthersModalEnd").find("input").val();
			let form = {
				"date": new Date(date),
				"start": start,
				"end": end,
				"creatorId": currentUser.id,
				"person": $("#addOthersModalPerson").val(),
				"content": $("#addOthersModalContent").val(),
				"venue": $("#addOthersModalVenue").val(),
			};
			if($("#addOthersSchedule").hasClass("update")){
				form["uid"] = $("#addOthersModal").attr("data-id")
			}
			scheduleAjax(form);
        }

		/**
		 *  添加一条日程
		 */
		function addSchedule(person) {
            let date = $("#addModalDate").find("input").val();
            let start = $("#addModalStart").find("input").val();
            let end = $("#addModalEnd").find("input").val();
			let form = {
				"date": new Date(date),
				"start": start,
				"end": end,
				"creatorId": currentUser.id,
                "person": currentUser.id,
				"content": $("#addModalContent").val(),
				"venue": $("#addModalVenue").val(),
			};
			if($("#addSchedule").hasClass("update")){
				form["uid"] = $("#addModal").attr("data-id")
			}
			scheduleAjax(form);
		}

		function scheduleAjax(form){
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
					swal({
						title: '更新成功', text: "页面不会自动刷新，若需查看请手动更新", type: 'success', confirmButtonText: 'OK'
					}).then(function(result){
                        $('#addOthersModal input').val("");
                        $('#addOthersModal textarea').val("");
                        $('#addOthersModal').modal('hide');
                        $('#addModal input').val("");
                        $('#addModal textarea').val("");
                        $('#addModal').modal('hide');
					});
				} else {
					swal({
						title: '参数错误', text: data.description, type: 'error', confirmButtonText: '返回'
					});
				}
			});
		}

		/**
		 * 加载add others schedule modal 中的各个<select>字段, 表示当前用户拥有哪些用户的授权
		 */
		function loadAddOthersModalFields(authorizers) {
			let options = []
			$.each(authorizers, function (k, v) {
				options.push("<option value='" + k + "'>" + v + "</option>");
			});
			$("#addOthersModalPerson").html(options.join(''));
		}

        /**
         * 加载查询输入页面中选择人员的<select>字段
         */
        function loadSelectPerson(allUser) {
            let options = []
            $.each(allUser, function (k, v) {
                options.push("<option value='" + v.id + "'>" + v.userName + "</option>");
            });
            $("#selectPerson").html(options.join(''));
        }

        /**
         * 获取这周的周一
         */
        function getFirstDayOfWeek (date) {
            var weekday = date.getDay()||7; //获取星期几,getDay()返回值是 0（周日） 到 6（周六） 之间的一个整数。0||7为7，即weekday的值为1-7
            date.setDate(date.getDate() - weekday + 1);//往前算（weekday-1）天，年份、月份会自动变化
            return date;
        }

        /**
         * 获取这周的周日
         */
        function getLastDayOfWeek (date) {
            var weekday = date.getDay()||7; //获取星期几,getDay()返回值是 0（周日） 到 6（周六） 之间的一个整数。0||7为7，即weekday的值为1-7
            date.setDate(date.getDate() + (7 - weekday));//往前算（weekday-1）天，年份、月份会自动变化
            return date;
        }
    </script>
  </body>
</html>