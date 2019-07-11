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
    <link rel="stylesheet" href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fileinput.min.css"/>
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

        div.container {
            width: 80%;
        }
        .font-bold {
            font-weight: bold;
        }
        .text-wrap {
            white-space: normal;
        }
        .width-250 {
            width: 250px;
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

<div class="page-content container-fluid">
    <div class="row">
        <div class="col-md-2">
            <div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <%--<li><a href="index"> Dashboard</a></li>--%>
                    <li><a href="<%=request.getContextPath()%>/portfolio"> Portfolio</a></li>
                    <li class="submenu open">
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
                    <li><a href="<%=request.getContextPath()%>/schedule">Schedule</a></li>
                    <li><a href="<%=request.getContextPath()%>/lp">LP</a></li>
                    <li><a href="<%=request.getContextPath()%>/vendor">Vendor</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading clearfix" id="bigTitle">
                    <div class="panel-title pull-left"><h3 id="page_name">Pipeline List</h3></div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-primary hidden" id="addModalBtn" onclick="addNewModal()">添加 Leads</button>
                        <button type="button" class="btn btn-success">批量导入</button>
                    </div>
                </div>
                <div class="panel-body" id="container">
                    <!-- 已投项目表格 -->
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-striped table-bordered nowrap"
                           id="dataTable" style="width: 100%;">
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
                        <label for="addModalName" class="col-sm-2 col-form-label">项目名称*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalName" placeholder="Project Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalSource" class="col-sm-2 col-form-label">项目来源*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalSource" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalPartner" class="col-sm-2 col-form-label">项目Leader*</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalPartner">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalManager" class="col-sm-2 col-form-label">项目执行人*</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalManager">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalCompany" class="col-sm-2 col-form-label">公司名称*</label>
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

                    <div class="form-group row" id="addModalRevenueGroup">
                        <label for="addModalRevenue" class="col-sm-2 col-form-label">收入规模</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalRevenue" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row" id="addModalNetIncomeGroup">
                        <label for="addModalNetIncome" class="col-sm-2 col-form-label">净利规模</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalNetIncome" placeholder="">
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
                            <input type="text" class="form-control" id="addModalSummary" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalFounder" class="col-sm-2 col-form-label">创始人信息</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalFounder" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalKp" class="col-sm-2 col-form-label">Key Person</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalKp" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalDescription" class="col-sm-2 col-form-label">详细介绍</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalDescription" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalStatus" class="col-sm-2 col-form-label">目前进展*</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalStatus">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalConsulting" class="col-sm-2 col-form-label">咨询进展</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalConsulting">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalNext" class="col-sm-2 col-form-label">下一步计划</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalNext" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalReason" class="col-sm-2 col-form-label">推荐原因/特别关注/park原因/pass原因</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalReason" rows="3"
                                      placeholder="如果要将此项目转入pipeline，此项请填写特别关注..."></textarea>
                        </div>
                    </div>
                </form>
                <!-- <div class="float-right"><h3>提交前请再次检查</h3></div> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button id="addLeads" type="button" class="btn btn-primary" onclick="addLeads()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- Add Meeting Record Modal -->
<div class="modal fade" id="addMeetingModal" tabindex="-1" role="dialog" aria-labelledby="addMeetingTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="addMeetingTitle">添加会见记录</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-condensed"
                       id="meetingRecordsTable" style="width: 100%;">
                </table>
                <form>
                    <div class="form-group row">
                        <label for="addMeetingModalPerson" class="col-sm-2 col-form-label">会见人员</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addMeetingModalPerson" placeholder="如：CEO王卫总">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addMeetingModalDate" class="col-sm-2 col-form-label">会见时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addMeetingModalDate" placeholder="yyyy-MM-dd(如：2019-4-1，无需添加0)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addMeetingModalContent" class="col-sm-2 col-form-label">内容</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addMeetingModalContent" rows="3"
                                      placeholder=""></textarea>
                        </div>
                    </div>
                </form>
                <!-- <div class="float-right"><h3>提交前请再次检查</h3></div> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button id="addRecord" type="button" class="btn btn-primary" onclick="addMeetingRecords()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- Upload records Modal -->
<div class="modal fade" id="uploadModal1" tabindex="-1" role="dialog" aria-labelledby="uploadModal1Title" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="uploadModal1Title">上传文件</h3>
            </div>
            <div class="modal-body">
                <div class="file-loading">
                    <input id="input-repl-1" name="file" type="file">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- Upload records Modal -->
<div class="modal fade" id="uploadModal2" tabindex="-1" role="dialog" aria-labelledby="uploadModal2Title" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="uploadModal2Title">上传文件</h3>
            </div>
            <div class="modal-body">
                <div class="file-loading">
                    <input id="input-repl-2" name="file" type="file">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
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

<!-- datables-js引入-Floyd -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.min.js"></script>

<script src="<%=request.getContextPath()%>/js/fileinput.min.js"></script>
<script src="<%=request.getContextPath()%>/js/locales/zh.js"></script>
<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
<script type="text/javascript">

    let basepath = "<%=request.getContextPath()%>";
    let token = getCookie("access_token");
    let type = ${type};
    let table;
    let users={}, status = {}, consulting={};

    $(document).ready(function(){

        if(type == 0){
            $("#leads_link").addClass("current");
            $("#page_name").html("Leads列表");
        }else if(type == 1){
            $("#pipeline_link").addClass("current");
            $("#page_name").html("Pipeline列表");
        }else if(type == 2){
            $("#watch_link").addClass("current");
            $("#page_name").html("Watchlist列表");
        }else if(type == 3){
            $("#pass_link").addClass("current");
            $("#page_name").html("Pass项目列表");
        }

        $.ajax({
            url: basepath + '/api/leads/status/' + type,
            type: "GET",
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            console.log(data);
            if(data.responseCode == "RESPONSE_OK"){
                status = data.data;
                $.ajax({
                    url: basepath + '/api/leads/consulting',
                    type: "GET",
                    contentType : 'application/json;charset=utf-8',
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("authorization", "Bearer " + token);
                    }
                }).done(function (data) {
                    if(data.responseCode == "RESPONSE_OK") {
                        consulting = data.data;
                        $.ajax({
                            url: basepath + '/api/user',
                            type: "GET",
                            contentType: 'application/json;charset=utf-8',
                            beforeSend: function (xhr) {
                                xhr.setRequestHeader("authorization", "Bearer " + token);
                            }
                        }).done(function (data) {
                            if (data.responseCode == "RESPONSE_OK") {
                                $.each(data.data, function (index, value) {
                                    users[value.id] = value.userName;
                                });
                                $.ajax({
                                    url: basepath + '/api/leads/auth',
                                    type: 'GET',
                                    contentType:"application/json",
                                    beforeSend: function (xhr) {
                                        xhr.setRequestHeader("authorization", "Bearer " + token);
                                    }
                                }).done(function (data) {
                                    console.log(data);
                                    if (data.responseCode == "RESPONSE_OK"){
                                        loadAddModalFields(users, status, consulting);
                                        loadTable(users, status, consulting);
                                    } else {
                                        $("#bigTitle").html('<div class="panel-title pull-left"><h2>对不起，你暂无此模块权限</h2></div>');
                                        $("#container").html('');
                                    }
                                });
                            }
                        });
                    }
                });
            }
        });

        $('.modal').on('hidden.bs.modal', function () {
            if($("#addModal").attr("data-id")){
                $(this).find("input,textarea,select")
                    .val('')
                    .end();
                $("#addModal").removeAttr("data-id");
                $("#addLeads").removeClass("update");
            }
        });
    });
    
    function addNewModal() {
        loadAddModalFields(users, status, consulting);
        $("#addModal").removeAttr("data-id");
        $('#addModal').modal('show');
    }

    /**
     *  加载leads大表格
     */
    function loadTable(users, status, consulting) {
        let url;
        if(type == 0){
            url = basepath + '/api/leads';
            $("#addModalBtn").removeClass("hidden");
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
                    { data: null, render: function (data, type, row) {
                            return '<button type="button" class="btn btn-primary btn-sm add-meeting" data-id="' +
                                row.uid + '"aria-label="Left Align"> ' +
                                '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>'
                        }, orderable: false},
                    { data: null, render: function(data, type, row){
                            return '<a href="#" data-id="' +  row.uid + '">'+ row.name+ '</a>';
                        }, className: 'font-bold', title: "项目名称", width: '80%' },
                    { data: null, render: function (data, type, row) {
                            return row.source
                        }, title: "项目来源" },
                    { data: null, render: function (data, type, row) {
                            return users[row.partner]
                        }, title: "项目Leader" },
                    { data: null, render: function (data, type, row) {
                            return users[row.manager]
                        }, title: "项目执行人" },
                    { data: "revenue", title: "收入规模" },
                    { data: "netIncome", title: "净利规模" },
                    { data: "company", title: "公司名称" },
                    { data: "industry", title: "所属行业" },
                    { data: "location", title: "公司地点" },
                    { data: "summary", title: "公司简介" },
                    { data: "founder", title: "创始人" },
                    { data: "kp", title: "Key Person" },
                    { data: null, render: function (data, type, row) {
                            return status[row.status]
                        }, title: "目前进展" },
                    { data: null, render: function (data, type, row) {
                            return consulting[row.consulting]
                        }, title: "咨询进展" },
                    { data: null, render: function (data, type, row) {
                            let date = new Date(row.lastChange);
                            return date.toLocaleDateString();
                        }, title: "最新更新时间" },
                    { data: null, render: function (data, type, row) {
                            return row.next
                        }, title: "下一步行动" },
                    { data: null, render: function (data, type, row) {
                            return row.sourceReason;
                        }, orderable: false, title: "推荐原因" },
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm record-upload">上传</button>&nbsp;&nbsp;' +
                                '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download record-download">下载</button>';
                        }, orderable: false, title: "会议纪要"  },
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm bp-upload">上传</button>&nbsp;&nbsp;' +
                                '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download bp-download">下载</button>';
                        }, orderable: false, title: "BP"   }
                ],
                fixedColumns: { leftColumns: 2 }, searching: true, // 可搜索
                order: [[15, 'desc']], autoWidth: false, iDisplayLength: 10,
                scrollX: true,	scrollCollapse: true
            });
        }else if(type == 1){
            url = basepath + '/api/leads/pipeline';
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
                    { data: null, render: function (data, type, row) {
                            return '<button type="button" class="btn btn-primary btn-sm add-meeting" data-id="' +
                                row.uid + '"aria-label="Left Align"> ' +
                                '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>'
                        }, orderable: false},
                    { data: null, render: function(data, type, row){
                            return '<a href="#" data-id="' +  row.uid + '">'+ row.name+ '</a>';
                        }, className: 'font-bold', title: "项目名称" },
                    { data: null, render: function (data, type, row) {
                            return row.source
                        }, title: "项目来源" },
                    { data: null, render: function (data, type, row) {
                            return users[row.partner]
                        }, title: "项目Leader" },
                    { data: null, render: function (data, type, row) {
                            return users[row.manager]
                        }, title: "项目执行人" },
                    { data: "company", title: "公司名称" },
                    { data: "industry", title: "所属行业" },
                    { data: "location", title: "公司地点" },
                    { data: "summary", title: "公司简介" },
                    { data: "founder", title: "创始人" },
                    { data: "kp", title: "Key Person" },
                    { data: null, render: function (data, type, row) {
                            return status[row.status]
                        }, title: "目前进展" },
                    { data: null, render: function (data, type, row) {
                            return consulting[row.consulting]
                        }, title: "咨询进展" },
                    { data: null, render: function (data, type, row) {
                            let date = new Date(row.lastChange);
                            return date.toLocaleDateString();
                        }, title: "最新更新时间" },
                    { data: null, render: function (data, type, row) {
                            return row.next
                        }, title: "下一步行动" },
                    { data: null, render: function (data, type, row) {
                            return row.specialConcern;
                        }, orderable: false, title: "特别关注" },
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm record-upload">上传</button>&nbsp;&nbsp;' +
                                '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download record-download">下载</button>';
                        }, orderable: false, title: "会议纪要" },
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm bp-upload">上传</button>&nbsp;&nbsp;' +
                                '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download bp-download">下载</button>';
                        }, orderable: false, title: "BP" }
                ],
                fixedColumns: { leftColumns: 2 }, searching: true, // 可搜索
                order: [[13, 'desc']], autoWidth: false, iDisplayLength: 25,
                scrollX: true,	scrollCollapse: true
            });
        }else if(type == 2){
            url = basepath + '/api/leads/watchlist';
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
                    { data: null, render: function (data, type, row) {
                            return '<button type="button" class="btn btn-primary btn-sm add-meeting" data-id="' +
                                row.uid + '"aria-label="Left Align"> ' +
                                '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>'
                        }, orderable: false},
                    { data: null, render: function(data, type, row){
                            return '<a href="#" data-id="' +  row.uid + '">'+ row.name+ '</a>';
                        }, className: 'font-bold', title: "项目名称" },
                    { data: null, render: function (data, type, row) {
                            return row.source
                        }, title: "项目来源" },
                    { data: null, render: function (data, type, row) {
                            return users[row.partner]
                        }, title: "项目Leader" },
                    { data: null, render: function (data, type, row) {
                            return users[row.manager]
                        }, title: "项目执行人" },
                    { data: "revenue", title: "收入规模" },
                    { data: "netIncome", title: "净利规模" },
                    { data: "company", title: "公司名称" },
                    { data: "industry", title: "所属行业" },
                    { data: "location", title: "公司地点" },
                    { data: "summary", title: "公司简介" },
                    { data: "founder", title: "创始人" },
                    { data: "kp", title: "Key Person" },
                    { data: null, render: function (data, type, row) {
                            return status[row.status]
                        }, title: "目前进展" },
                    { data: null, render: function (data, type, row) {
                            return consulting[row.consulting]
                        }, title: "咨询进展" },
                    { data: null, render: function (data, type, row) {
                            let date = new Date(row.lastChange);
                            return date.toLocaleDateString();
                        }, title: "最新更新时间" },
                    { data: null, render: function (data, type, row) {
                            return row.next
                        }, title: "下一步行动" },
                    { data: null, render: function (data, type, row) {
                            return row.parkReason;
                        }, orderable: false, title: "PARK原因" },
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm record-upload">上传</button>&nbsp;&nbsp;' +
                                '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download record-download">下载</button>';
                        }, orderable: false, title: "会议纪要"},
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm bp-upload">上传</button>&nbsp;&nbsp;' +
                                '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download bp-download">下载</button>';
                        }, orderable: false, title: "BP" }
                ],
                fixedColumns: { leftColumns: 2 }, searching: true, // 可搜索
                order: [[15, 'desc']], autoWidth: false, iDisplayLength: 25,
                scrollX: true,	scrollCollapse: true
            });
        }else if(type == 3){
            url = basepath + '/api/leads/pass';
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
                    { data: null, render: function (data, type, row) {
                            return '<button type="button" class="btn btn-primary btn-sm add-meeting" data-id="' +
                                row.uid + '"aria-label="Left Align"> ' +
                                '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>'
                        }, orderable: false},
                    { data: null, render: function(data, type, row){
                            return '<a href="#" data-id="' +  row.uid + '">'+ row.name+ '</a>';
                        }, className: 'font-bold', title: "项目名称" },
                    { data: null, render: function (data, type, row) {
                            return row.source
                        }, title: "项目来源" },
                    { data: null, render: function (data, type, row) {
                            return users[row.partner]
                        }, title: "项目Leader" },
                    { data: null, render: function (data, type, row) {
                            return users[row.manager]
                        }, title: "项目执行人" },
                    { data: "revenue", title: "收入规模" },
                    { data: "netIncome", title: "净利规模" },
                    { data: "company", title: "公司名称" },
                    { data: "industry", title: "所属行业" },
                    { data: "location", title: "公司地点" },
                    { data: "summary", title: "公司简介" },
                    { data: "founder", title: "创始人" },
                    { data: "kp", title: "Key Person" },
                    { data: null, render: function (data, type, row) {
                            let date = new Date(row.lastChange);
                            return date.toLocaleDateString();
                        }, title: "最新更新时间" },
                    { data: null, render: function (data, type, row) {
                            return row.passReason;
                        }, orderable: false, title: "PASS原因" },
                    { data: null, render: function (data, type, row) {
                            return consulting[row.consulting]
                        }, title: "咨询进展" },
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download record-download">下载</button>';
                        }, orderable: false, title: "会议纪要" },
                    { data: null, render: function (data, type, row) {
                            return '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download bp-download">下载</button>';
                        }, orderable: false, title: "BP" }
                ],
                fixedColumns: { leftColumns: 2 }, searching: true, // 可搜索
                order: [[13, 'desc']], autoWidth: false, iDisplayLength: 25,
                scrollX: true,	scrollCollapse: true
            });
        }

        $('#dataTable tbody').on('dblclick', 'tr', function () {
            var data = table.row( this ).data();
            reloadModal(data);
            $('#addModal').modal('show');
        });

        $('#dataTable tbody').on('click', '.download', function () {
            let id = $(this).attr("data-id");
            console.log(id);
            //将名称传入后台
            if($(this).hasClass("record-download")){
                window.location.href = basepath + "/file/download/record/"+id;
            }else if($(this).hasClass("bp-download")){
                window.location.href = basepath + "/file/download/bp/"+id;
            }
        });

        $('#dataTable tbody').on('click', '.record-upload', function () {
            $("#uploadModal1").modal('show');
            let url = '/record/' + $(this).attr("data-id");
            iniFileInput1(url);
        });

        $('#dataTable tbody').on('click', '.bp-upload', function () {
            $("#uploadModal2").modal('show');
            let url = '/bp/' + $(this).attr("data-id");
            iniFileInput2(url);
        });

        // add meeting records
        $('#dataTable tbody').on('click', '.add-meeting', function () {
            let id = $(this).attr("data-id");
            if(type!=3){
                reloadMeetingModal(id);
                $("#addMeetingModal").modal('show');
            }
        });
    }

    function reloadMeetingModal(id) {
        var meetingTable = $('#meetingRecordsTable').DataTable({
            ajax:  {
                url: basepath + '/api/leads/records/' + id,
                type: "GET",
                contentType : 'application/json;charset=utf-8',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authorization", "Bearer " + token);
                }
            },
            columns: [
                { data: null, render: function (data, type, row) {
                        return row.date;
                    }, title: "日期"},
                { data: null, render: function(data, type, row){
                        return row.user;
                    }, title: "VKC" },
                { data: null, render: function (data, type, row) {
                        return row.person;
                    }, title: "会见人员" },
                { data: null, render: function (data, type, row) {
                        return row.content;
                    }, title: "会见内容" }
            ],
            columnDefs: [
                {
                    render: function (data, type, full, meta) {
                        return "<div class='text-wrap'>" + data + "</div>";
                    }, targets: 3
                }
            ],
            deferRender: true, searching: false, destroy: true, info: false,
            // order: [[10, 'desc']], autoWidth: false,
            // scrollX: true,	scrollCollapse: true, autoWidth: false,
        });
        $("#addMeetingModal").attr("data-id", id);
    }

    function reloadModal(rowdata) {
        $.ajax({
            url: basepath + '/api/leads/status/' + rowdata.status,
            type: "GET",
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            let thisStatus = data.data;
            let options = []
            $.each(thisStatus, function (k, v) {
                options.push("<option value='" + k + "'>" + v + "</option>");
            });
            $("#addModalStatus").html(options.join(''));
            $("#addModal").attr("data-id", rowdata.uid);
            $("#addModalName").val(rowdata.name);
            $("#addModalSource").val(rowdata.source);
            $("#addModalPartner").val(rowdata.partner);
            $("#addModalManager").val(rowdata.manager);
            if(type == 0 || type==2){
                $("#addModalRevenue").val(rowdata.revenue);
                $("#addModalNetIncome").val(rowdata.netIncome);
            }else{
                $("#addModalRevenueGroup").addClass("hidden");
                $("#addModalNetIncomeGroup").addClass("hidden");
            }
            $("#addModalCompany").val(rowdata.company);
            $("#addModalIndustry").val(rowdata.industry);
            $("#addModalLocation").val(rowdata.location);
            $("#addModalSummary").val(rowdata.summary);
            $("#addModalFounder").val(rowdata.founder);
            $("#addModalKp").val(rowdata.kp);
            $("#addModalDescription").val(rowdata.description);
            $("#addModalStatus").val(rowdata.status);
            $("#addModalConsulting").val(rowdata.consulting);
            $("#addModalNext").val(rowdata.next);
            if(type==0){
                $("#addModalReason").val(rowdata.sourceReason);
            }else if(type==1){
                $("#addModalReason").val(rowdata.specialConcern);
            }else if(type==2){
                $("#addModalReason").val(rowdata.parkReason);
            }else if(type==3){
                $("#addModalReason").val(rowdata.passReason);
            }

            $("#addLeads").addClass("update");
        });
    }


    function iniFileInput1(subpath) {
        let panel = $("#input-repl-1").fileinput({
            uploadUrl: basepath + '/file' + subpath,
            autoReplace: true,
            maxFileCount: 1,
            allowedFileExtensions: ["doc", "docx", "xls", "xlsx", "ppt", "pptx", "txt", "jpg", "jpeg", "png", "pdf"]
        });
    }

    function iniFileInput2(subpath) {
        let panel = $("#input-repl-2").fileinput({
            uploadUrl: basepath + '/file' + subpath,
            autoReplace: true,
            maxFileCount: 1,
            allowedFileExtensions: ["doc", "docx", "xls", "xlsx", "ppt", "pptx", "txt", "jpg", "jpeg", "png", "pdf"]
        });
    }

    /**
     *  添加一条会见记录
     */
    function addMeetingRecords() {
        let leadsId = $("#addMeetingModal").attr("data-id");
        let form = {
            "leadsId": leadsId,
            "date": new Date($("#addMeetingModalDate").val()).getTime(),
            "person": $("#addMeetingModalPerson").val(),
            "content": $("#addMeetingModalContent").val()
        }

        let formData = JSON.stringify(form);
        $.ajax({
            url: basepath + '/api/leads/records/' + leadsId,
            type: 'POST',
            data: formData,
            dataType: 'json',
            contentType:"application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            console.log(data);
            if (data.responseCode == "RESPONSE_OK"){
                swal({
                    title: '添加成功', type: 'success', confirmButtonText: 'OK'
                }).then(function(result){
                    window.location.reload();
                });
            } else {
                swal({
                    title: '参数错误', text: data.description, type: 'error', confirmButtonText: '返回'
                });
            }
        });
    }

    /**
     *  添加一条leads记录
     */
    function addLeads() {
        if(type == 3){
            return;
        }

        let message="添加成功";

        let form = {
            "name": $("#addModalName").val(),
            "source": $("#addModalSource").val(),
            "partner": $("#addModalPartner").val(),
            "manager": $("#addModalManager").val(),
            "company": $("#addModalCompany").val(),
            "industry": $("#addModalIndustry").val(),
            "location": $("#addModalLocation").val(),
            "summary": $("#addModalSummary").val(),
            "founder": $("#addModalFounder").val(),
            "kp": $("#addModalKp").val(),
            "description": $("#addModalDescription").val(),
            "status": $("#addModalStatus").val(),
            "consulting": $("#addModalConsulting").val(),
            "lastChange": new Date().getTime(),
            "next": $("#addModalNext").val(),
        };

        if(form["name"] =="" || form["source"] =="" || form["partner"] ==0 || form["manager"]==0 || form["company"]==""
            || form["status"]==0){
            swal({
                title: "带*的字段必须填写！", type: 'warning', confirmButtonText: '返回'
            });
            return;
        }
        if(type == 0 || type == 2){
            form["revenue"] = $("#addModalRevenue").val();
            form["netIncome"] = $("#addModalNetIncome").val();
        }

        let nextStatus = $("#addModalStatus").val();
        if( nextStatus < 10){
            form["sourceReason"] = $("#addModalReason").val();
        } else if( nextStatus >= 10 && nextStatus < 14){
            form["specialConcern"] = $("#addModalReason").val();
        } else if(nextStatus >= 14 && nextStatus <18) {
            form["parkReason"] = $("#addModalReason").val();
        } else if(nextStatus == 18) {
            form["passReason"] = $("#addModalReason").val();
        }
        if($("#addLeads").hasClass("update")){
            form["uid"] = $("#addModal").attr("data-id");
            message = "更新成功";
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
                swal({
                    title: message, type: 'success', confirmButtonText: 'OK'
                }).then(function(result){
                    window.location.reload();
                });
            } else {
                swal({
                    title: '参数错误', text: data.description, type: 'error', confirmButtonText: '返回'
                });
            }
        });
    }

    /**
     * 加载add leads modal 中的各个<select>字段
     */
    function loadAddModalFields(users, status, consulting) {
        let options = []
        $.each(users, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalSource").html(options.join(''));
        $("#addModalPartner").html(options.join(''));
        $("#addModalManager").html(options.join(''));
        options = []
        $.each(status, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalStatus").html(options.join(''));
        options = []
        $.each(consulting, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalConsulting").html(options.join(''));
    }

</script>
</body>
</html>
