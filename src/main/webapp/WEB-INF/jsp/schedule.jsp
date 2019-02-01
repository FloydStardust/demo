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
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.2.6/css/fixedColumns.bootstrap.min.css" type="text/css"/>
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
                    <li><a href="portfolio.html"> Portfolio</a></li>
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
					<div class="panel-title pull-left"><h3>2019/01/28-2019/02/01 VKC日程安排</h3></div>
					<div class="pull-right">
						<button type="button" class="btn btn-primary" id="addModalBtn" data-toggle="modal" data-target="#addModal">录入下周日程</button>
					</div>
				</div>
  				<div class="panel-body" id="container">
  					<!-- 已投项目表格 -->
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-striped table-bordered" id="scheduleTable" style="width: 100%;">

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
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

    <!-- <script src="vendors/datatables/js/jquery.dataTables.min.js"></script> -->
    <!-- <script src="vendors/datatables/dataTables.bootstrap.js"></script> -->

    <!-- datables-js引入-Floyd -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/buttons.bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/editor.bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTables.editor.min.js"></script>

    <script src="<%=request.getContextPath()%>/js/custom.js"></script>
    <script type="text/javascript">

    </script>
  </body>
</html>