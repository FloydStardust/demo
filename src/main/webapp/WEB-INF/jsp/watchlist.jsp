<%--
  Created by IntelliJ IDEA.
  User: Floyd
  Date: 2019/1/29
  Time: 22:24
--%>
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
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- <link href="vendors/datatables/dataTables.bootstrap.css" rel="stylesheet" media="screen"> -->

    <!-- datatable-css引入-Floyd -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.2.6/css/fixedColumns.bootstrap.min.css" type="text/css"/>
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
                    <li class="submenu open">
                        <a href="#">
                            <i class="glyphicon glyphicon-list"></i> PLW
                            <span class="caret pull-right"></span>
                        </a>
                        <!-- Sub menu -->
                        <ul>
                            <li><a href="pipeline.html">Pipeline</a></li>
                            <li><a href="leads.html">Leads</a></li>
                            <li class="current"><a href="watchlist.html">Watchlist</a></li>
                        </ul>
                    </li>
                    <li><a href="schedule.html">Schedule</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading clearfix">
                    <div class="panel-title pull-left"><h3>Leads List</h3></div>
                    <div class="pull-right">
                        <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加 Leads</button> -->
                        <button type="button" class="btn btn-success">批量导入</button>
                    </div>
                </div>
                <div class="panel-body" id="container">
                    <!-- 已投项目表格 -->
                    <table cellpadding="0" cellspacing="0" border="0" class="table hover table-striped table-bordered" id="watchlistTable" style="width: 100%;">
                        <thead>
                        <tr>
                            <!-- <th>#</th> -->
                            <th>项目名称</th>
                            <th>项目来源</th>
                            <!-- <th>项目leader</th> -->
                            <th>公司名称</th>
                            <th>所属行业</th>
                            <th>公司地点</th>
                            <!-- <th>公司介绍</th> -->
                            <!-- <th>目前进展</th> -->
                            <th>pass时间</th>
                            <!-- <th>下一步行动</th> -->
                            <th>pass原因</th>
                            <!-- <th>会议纪要</th> -->
                            <!-- <th>BP</th> -->
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <!-- <td></td> -->
                            <td><a href="#">500万彩票</a></td>
                            <td>Rachel</td>
                            <!-- <td>朱海龙</td> -->
                            <td>500.com</td>
                            <td>博彩</td>
                            <td>上海</td>
                            <!-- <td>中国用户规模最大、唯一具备合法资质的民营互联网体彩销售服务平台。</td> -->
                            <!-- <td>行业研究</td> -->
                            <td>2018/12/23</td>
                            <!-- <td>组内汇报</td> -->
                            <td>博彩行业市场规模天花板较低</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Pipeline Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="addModalTitle">添加Leads信息</h3>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <label for="addModalProjectName" class="col-sm-2 col-form-label">项目名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalProjectName" placeholder="Project Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalSource" class="col-sm-2 col-form-label">项目来源</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalSource" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalLeader" class="col-sm-2 col-form-label">项目leader</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalLeader" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalCompanyName" class="col-sm-2 col-form-label">公司名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalCompanyName" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalIndustry" class="col-sm-2 col-form-label">所属行业</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalIndustry" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalProjectLocation" class="col-sm-2 col-form-label">公司地点</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalProjectLocation">
                                <option>北京</option>
                                <option>上海</option>
                                <option>广州</option>
                                <option>深圳</option>
                                <option>成都</option>
                                <option>重庆</option>
                                <option>武汉</option>
                                <option>南京</option>
                                <option>杭州</option>
                                <option>郑州</option>
                                <option>济南</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalCompanyIntro" class="col-sm-2 col-form-label">公司介绍</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalCompanyIntro" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalStatus" class="col-sm-2 col-form-label">目前进展</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalStatus">
                                <option>行业研究</option>
                                <option>组内汇报</option>
                                <option>周会汇报</option>
                                <option>转入pipeline</option>
                                <option>pass</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalLastChangeTime" class="col-sm-2 col-form-label">当前时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalLastChangeTime" placeholder="YYYY/MM/DD">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalNextStep" class="col-sm-2 col-form-label">下一步：</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalNextStep">
                                <option>行业研究</option>
                                <option>组内汇报</option>
                                <option>周会汇报</option>
                                <option>转入pipeline</option>
                                <option>pass</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalReason" class="col-sm-2 col-form-label">推荐原因</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalReason" rows="3" placeholder="请尽量简洁"></textarea>
                        </div>
                    </div>
                </form>
                <!-- <div class="float-right"><h3>提交前请再次检查</h3></div> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button type="button" class="btn btn-primary">保存</button>
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
<script src="bootstrap/js/bootstrap.min.js"></script>

<!-- <script src="vendors/datatables/js/jquery.dataTables.min.js"></script> -->
<!-- <script src="vendors/datatables/dataTables.bootstrap.js"></script> -->

<!-- datables-js引入-Floyd -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>

<script src="js/custom.js"></script>
<script type="text/javascript">

    $(document).ready(function(){

        var table = $('#watchlistTable').DataTable({
            // 以下列不可搜索
            // "columnDefs": [ {
            //     "orderable": false,
            //     "targets": [0,1,2,4,5,6,7,8,9,13,14,15,16,17,18,19,20,21,22,29]
            // } ],
            "columnDefs": [{
                "orderable": false,
                "targets": [0,1,2,3,4,6]
            },
                { width: '20%', targets: 0 } ],
            'fixedColumns': true,
            'searching': true, // 可搜索
            'order': [[5, 'asc']],
            'scrollX': true,	// 水平滚动条
            'scrollCollapse': true,
            'autoWidth': true,
            'fixedColumns': true,
        });

        // t.on( 'order.dt search.dt', function () {
        //     t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        //         cell.innerHTML = i+1;
        //     } );
        // } ).draw();
    });
</script>
</body>
</html>
