<%--
  Created by IntelliJ IDEA.
  User: Floyd
  Date: 2019/1/29
  Time: 21:43
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
        th, td { word-wrap:break-word; }

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
                    <li><a href="index"> Dashboard</a></li>
                    <li><a href="<%=request.getContextPath()%>/portfolio"> Portfolio</a></li>
                    <li class="submenu open">
                        <a href="#">
                            <i class="glyphicon glyphicon-list"></i> PLW
                            <span class="caret pull-right"></span>
                        </a>
                        <!-- Sub menu -->
                        <ul>
                            <li><a id="pipeline_link" href="<%=request.getContextPath()%>/leads">Leads</a></li>
                            <li><a id="leads_link" href="<%=request.getContextPath()%>/pipeline">Pipeline</a></li>
                            <li><a id="watch_link" href="<%=request.getContextPath()%>/watchlist">Watchlist</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/schedule">Schedule</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading clearfix">
                    <div class="panel-title pull-left"><h3>Pipeline List</h3></div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-primary" id="addModalBtn" data-toggle="modal" data-target="#addModal">添加 Pipeline</button>
                        <button type="button" class="btn btn-success">批量导入</button>
                    </div>
                </div>
                <div class="panel-body" id="container">
                    <!-- 已投项目表格 -->
                    <table cellpadding="0" cellspacing="0" class="table table-hover table-striped table-bordered" id="dataTable" style="width: 100%;">
                        <thead>
                        <tr>
                            <!-- <th>#</th> -->
                            <th>项目名称</th>
                            <th>项目来源</th>
                            <th>负责合伙人</th>
                            <th>投资经理</th>
                            <th>公司名称</th>
                            <th>所属行业</th>
                            <th>公司地点</th>
                            <th>公司简介</th>
                            <th>目前进展</th>
                            <th>最新更新时间</th>
                            <th>下一步行动</th>
                            <th>推荐原因</th>
                            <th>会议纪要</th>
                            <th>BP文件</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <!-- <td></td> -->
                            <td><a href="#">500万彩票</a></td>
                            <td>Rachel</td>
                            <td>朱海龙</td>
                            <td>朱海龙</td>
                            <td>500.com</td>
                            <td>博彩</td>
                            <td>上海</td>
                            <td>中国用户规模最大、唯一具备合法资质的民营互联网体彩销售服务平台。</td>
                            <td>见过高管</td>
                            <td>2018/12/23</td>
                            <td>约见合伙人</td>
                            <td>春节期间博彩行业迎来业务增长高峰</td>
                            <td>
                                <button class="btn btn-danger">上传</button>
                                <button class="btn btn-primary">下载</button>
                            </td>
                            <td>
                                <button class="btn btn-danger">上传</button>
                                <button class="btn btn-primary">下载</button>
                            </td>
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
                <h3 class="modal-title" id="addModalTitle">添加Pipeline信息</h3>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <label for="addModalName" class="col-sm-2 col-form-label">项目名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalName" placeholder="Project Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalSource" class="col-sm-2 col-form-label">项目来源</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalSource" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalPartner" class="col-sm-2 col-form-label">负责合伙人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalPartner" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalManager" class="col-sm-2 col-form-label">投资经理</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalManager" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalCompany" class="col-sm-2 col-form-label">公司名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalCompany" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalIndustry" class="col-sm-2 col-form-label">所属行业</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalIndustry" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalLocation" class="col-sm-2 col-form-label">公司地点</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalLocation" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalSummary" class="col-sm-2 col-form-label">公司简介</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalSummary" rows="1"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalDescription" class="col-sm-2 col-form-label">详细介绍</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalDescription" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalStatus" class="col-sm-2 col-form-label">目前进展</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalStatus">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalNext" class="col-sm-2 col-form-label">下一步计划</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalNext">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalReason" class="col-sm-2 col-form-label">推荐/pass原因</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalReason" rows="3"
                                      placeholder="如果要将此项目转入watchlist，此项请填写pass原因..."></textarea>
                        </div>
                    </div>
                </form>
                <!-- <div class="float-right"><h3>提交前请再次检查</h3></div> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button type="button" class="btn btn-primary" onclick="addLeads()">保存</button>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container">

        <div class="copy text-center">
            Copyright <a href='#'> Floyd, 2019 </a>
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

    let basepath = "<%=request.getContextPath()%>";
    let token = getCookie("access_token");
    let type = ${type};
    let table;

    $(document).ready(function(){
        let url;
        if(type == 0){
            $("#leads_link").addClass("current");
            url = basepath + '/api/leads';

            $.ajax({
                url: basepath + '/auth',
                type: "GET",
                contentType : 'application/json;charset=utf-8',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authorization", "Bearer " + token);
                }
            }).done(function (data) {
                console.log(data);
            });
            $.ajax({
                url: basepath + '/auth',
                type: "GET",
                contentType : 'application/json;charset=utf-8',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authorization", "Bearer " + token);
                }
            }).done(function (data) {
                console.log(data);
            });
            console.log(users);
            console.log(fields);
        }else if(type == 1){
            $("#pipeline_link").addClass("current");
            url = basepath + '/api/leads/pipeline'
        }else if(type == 2){
            $("#watch_link").addClass("current");
            url = basepath + '/api/leads/watchlist'
        }
        $.ajax({
            url: url,
            type: "GET",
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            console.log(data);
        })
        // loadTable();
        loadAddModalFields();


        // t.on( 'order.dt search.dt', function () {
        //     t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        //         cell.innerHTML = i+1;
        //     } );
        // } ).draw();

        $('#dataTable tbody').on('dblclick', 'tr', function () {
            var data = table.row( this ).data();
            $('#addModalBtn').click();
            // alert( 'You clicked on '+data[0]+'\'s row' );
        });
    });

    /**
     *  加载leads大表格
     */
    function loadTable() {
        let url;
        if(type == 0){
            url = basepath + '/api/leads';
        }else if(type == 1){
            url = basepath + '/api/leads/pipeline'
        }else if(type == 2){
            url = basepath + '/api/leads/watchlist'
        }
        table = $('#dataTable').DataTable({
            ajax:  {
                url: url,
                type: "GET",
                contentType : 'application/json;charset=utf-8',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authorization", "Bearer " + token);
                }
            },
            columns: [
                {   data: null ,
                    render: function(data, type, row){
                        return '<a href="'+basepath+'/portfolio/' + row.uid + '">'+ row.name+ '</a>';
                    },
                    width: '80%'
                },
                { data: "fundName" }, { data: "date" }, { data: "shareType" }, { data: "investType" },
                { data: "boardNum" }, { data: "round" }, { data: "partner" }, { data: "moneyType" }, { data: "investNum" },
                { data: "investRatio" }, { data: "currentRatio" }, { data: "source" }, { data: "partner" }, { data: "manager" },
                { data: "boarder" }, { data: "industry" }, { data: "sector" }, { data: "location" }, { data: "registerLocation" },
                { data: "exitStatus" }, { data: "exitType" }, { data: "exitTime" }, { data: "valueAchieved" }, { data: "valueAchieving" },
                { data: "totalValue" }, { data: "returnMultiple" }, { data: "irr" }, { data: "valueEvidence" }
            ],
            fixedColumns: true,
            searching: true, // 可搜索
            order: [[2, 'asc']], scrollX: true,	// 水平滚动条
            scrollCollapse: true, autoWidth: false,
        });
        // 在第一列添加序号
        // t.on( 'order.dt search.dt', function () {
        //     t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        //         cell.innerHTML = i+1;
        //     } );
        // } ).draw();

        $('#portfolioTable tbody').on('dblclick', 'tr', function () {
            var data = table.row( this ).data();
            $('#addModalBtn').click();
            // alert( 'You clicked on '+data[0]+'\'s row' );
        });
    }

    /**
     *  添加一条leads记录
     */
    function addLeads() {
        let form = {
            "name": $("#addModalName").val(),
            "source": $("#addModalSource").val(),
            "partner": $("#addModalPartner").val(),
            "manager": $("#addModalManager").val(),
            "company": $("#addModalCompany").val(),
            "industry": $("#addModalIndustry").val(),
            "location": $("#addModalLocation").val(),
            "summary": $("#addModalSummary").val(),
            "description": $("#addModalDescription").val(),
            "status": $("#addModalStatus").val(),
            "lastChange": new Date().getTime(),
            "next": $("#addModalNext").val(),
        };
        if($("#addModalStatus").val() == -1){
            form["passReason"] = $("#addModalReason").val();
        } else {
            form["sourceReason"] = $("#addModalReason").val();
        }
        let formData = JSON.stringify(form);

        $.ajax({
            url: basepath + '/api/leads',
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
                alert(data.desciption);
            }
        });
    }

    /**
     * 加载add leads modal 中的各个<select>字段
     */
    function loadAddModalFields() {
        let options = []
    }

</script>
</body>
</html>
