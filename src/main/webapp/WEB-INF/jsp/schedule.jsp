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
	                          <li><a href="login.html">Logout</a></li>
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
                    <li><a href="index.html"> Dashboard</a></li>
                    <li><a href="<%=request.getContextPath()%>/portfolio"> Portfolio</a></li>
                    <li>
                         <a href="#" id="PLW"> PLW
                            <span class="glyphicon glyphicon-triangle-bottom pull-right"></span>
                         </a>
                     </li>
                     <!-- Sub menu -->
                    <li><a href="pipeline.html">&emsp;&emsp;Pipeline</a></li>
                    <li><a href="leads.html">&emsp;&emsp;Leads</a></li>
                    <li><a href="watchlist.html">&emsp;&emsp;Watchlist</a></li>

                    <li class="current"><a href="schedule.html">Schedule</a></li>
                </ul>
             </div>
		  </div>
		  <div class="col-md-10">
  			<div class="content-box-large">
  				<div class="panel-heading clearfix">
					<div class="panel-title pull-left"><h3 id="scheduleDate">VKC日程安排</h3></div>
					<div class="pull-right">
						<button type="button" class="btn btn-primary" id="addModalBtn" data-toggle="modal" data-target="#addModal">录入下周日程</button>
					</div>
				</div>
  				<div class="panel-body" id="container">
  					<!-- 已投项目表格 -->
  					<table class="table table-striped table-bordered" id="scheduleTable" style="width: 100%;">
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
	<%--一定要按顺序引入！！！--%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTables.editor.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/editor.bootstrap.min.js"></script>


    <script src="<%=request.getContextPath()%>/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
    <script type="text/javascript">
		var editor;
		var basepath = "<%=request.getContextPath()%>";
		var token = getCookie("access_token");

		$(document).ready( function () {

			editor = new $.fn.dataTable.Editor( {
				ajax: {
					url: basepath + '/api/schedule/week',
					type: "GET",
					contentType : 'application/json;charset=utf-8',
					beforeSend: function (xhr) {
						xhr.setRequestHeader("authorization", "Bearer " + token);
					}
				},
				table: "#scheduleTable",
				idSrc: 'id',
				fields: [ {
					label: "姓名:",
					name: "username"
				}, {
					label: "日期:",
					name: "date"
				}, {
					label: "开始时间:",
					name: "start"
				}, {
					label: "结束时间:",
					name: "end"
				}, {
					label: "地点:",
					name: "venue"
				}, {
					label: "事件:",
					name: "event"
				}
				]
			} );

			var table = $('#scheduleTable').DataTable( {
				lengthChange: false,
				ajax: {
					url: basepath + '/api/schedule/week',
					type: "GET",
					contentType : 'application/json;charset=utf-8',
					beforeSend: function (xhr) {
						xhr.setRequestHeader("authorization", "Bearer " + token);
					}
				},
				columns: [
					{ data: "username"},
					{ data: "date" },
					{ data:  null, render: function ( data, type, row ) {
							return data.start+' - '+data.end;
						} } ,
					{ data: "venue" },
					{ data: "event" },
					// { data: "salary", render: $.fn.dataTable.render.number( ',', '.', 0, '$' ) }
				],
				select: true
			} );

			// Display the buttons
			new $.fn.dataTable.Buttons( table, [
				{ extend: "create", editor: editor },
				{ extend: "edit",   editor: editor },
				{ extend: "remove", editor: editor }
			] );

			table.buttons().container()
					.appendTo( $('.col-sm-6:eq(0)', table.table().container() ) );
		})

    </script>
  </body>
</html>