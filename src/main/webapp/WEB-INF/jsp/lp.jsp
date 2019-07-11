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
                    <li><a href="<%=request.getContextPath()%>/schedule">Schedule</a></li>
                    <li class="current"><a href="<%=request.getContextPath()%>/lp">LP</a></li>
                    <li><a href="<%=request.getContextPath()%>/vendor">Vendor</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading clearfix" id="bigTitle">
                    <div class="panel-title pull-left"><h3 id="page_name">LP列表</h3></div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-success" id="addModalBtn" onclick="addNewModal()">添加LP信息</button>
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
                <h3 class="modal-title" id="addModalTitle">添加LP信息</h3>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <label for="addModalName" class="col-sm-2 col-form-label">LP简称*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalName" placeholder="LP Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalFullName" class="col-sm-2 col-form-label">LP全称*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalFullName" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalBase" class="col-sm-2 col-form-label">LP Base*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalBase" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalKp" class="col-sm-2 col-form-label">KP及职务*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalKp" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalKpTel" class="col-sm-2 col-form-label">KP联系电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalKpTel" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalKpEmail" class="col-sm-2 col-form-label">KP Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalKpEmail" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row" id="addModalRevenueGroup">
                        <label for="addModalConnector" class="col-sm-2 col-form-label">日常联系人*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalConnector" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row" id="addModalNetIncomeGroup">
                        <label for="addModalConnectorTel" class="col-sm-2 col-form-label">日常联系人电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalConnectorTel" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalConnectorEmail" class="col-sm-2 col-form-label">日常联系人Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalConnectorEmail" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalImportance" class="col-sm-2 col-form-label">重要等级</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalImportance" placeholder="">
                        </div>
                    </div>
                </form>
                <!-- <div class="float-right"><h3>提交前请再次检查</h3></div> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button id="addLp" type="button" class="btn btn-primary" onclick="addLp()">保存</button>
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
                        <label for="addMeetingModalUser" class="col-sm-2 col-form-label">VKC人员</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addMeetingModalUser" placeholder="逗号分隔人名">
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
    let table;

    $(document).ready(function(){
        $.ajax({
            url: basepath + '/api/lp/auth',
            type: 'GET',
            contentType:"application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            console.log(data);
            if (data.responseCode == "RESPONSE_OK"){
                loadTable();
            } else {
                $("#bigTitle").html('<div class="panel-title pull-left"><h2>对不起，你暂无此模块权限</h2></div>');
                $("#container").html('');
            }
        });


        $('.modal').on('hidden.bs.modal', function () {
            if($("#addModal").attr("data-id")){
                $(this).find("input,textarea,select")
                    .val('')
                    .end();
                $("#addModal").removeAttr("data-id");
                $("#addLp").removeClass("update");
            }
        });
    });
    
    function addNewModal() {
        $("#addModal").removeAttr("data-id");
        $('#addModal').modal('show');
    }

    /**
     *  加载lp大表格
     */
    function loadTable() {
        let url = basepath + '/api/lp';
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
                        return row.name;
                    }, className: 'font-bold', title: "LP简称" },
                { data: null, render: function (data, type, row) {
                        return row.fullName;
                    }, title: "LP全称" },
                { data: null, render: function (data, type, row) {
                        return row.base;
                    }, title: "Base" },
                { data: null, render: function (data, type, row) {
                        return row.kp;
                    }, title: "KP" },
                { data: "kpTel", title: "联系电话" },
                { data: "kpEmail", title: "Email" },
                { data: "connector", title: "日常联系人" },
                { data: "connectorTel", title: "联系电话" },
                { data: "connectorEmail", title: "Email" },
                { data: "importance", title: "重要等级" },
                { data: null, render: function (data, type, row) {
                        if(row.lastMeetDate==null)
                            return "";
                        else {
                            let date = new Date(row.lastMeetDate);
                            return date.toLocaleDateString();
                        }
                    }, title: "上次会面日期" },
                { data: "lastMeetUser", title: "参会人员" },
                { data: null, render: function (data, type, row) {
                        return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm record-upload">上传</button>&nbsp;&nbsp;' +
                            '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download record-download">下载</button>';
                    }, orderable: false, title: "会议纪要"  },
            ],
            fixedColumns: { leftColumns: 2 }, searching: true, // 可搜索
            order: [[11, 'desc']], autoWidth: false, iDisplayLength: 10,
            scrollX: true,	scrollCollapse: true
        });

        $('#dataTable tbody').on('dblclick', 'tr', function () {
            var data = table.row( this ).data();
            reloadModal(data);
            $('#addModal').modal('show');
        });

        $('#dataTable tbody').on('click', '.download', function () {
            let id = $(this).attr("data-id");
            //将名称传入后台
            window.location.href = basepath + "/file/download/lp/"+id;

        });

        $('#dataTable tbody').on('click', '.record-upload', function () {
            $("#uploadModal1").modal('show');
            let url = '/lp/' + $(this).attr("data-id");
            iniFileInput1(url);
        });

        // add meeting records
        $('#dataTable tbody').on('click', '.add-meeting', function () {
            let id = $(this).attr("data-id");
            reloadMeetingModal(id);
            $("#addMeetingModal").modal('show');
        });
    }

    function reloadMeetingModal(id) {
        var meetingTable = $('#meetingRecordsTable').DataTable({
            ajax:  {
                url: basepath + '/api/lp/records/' + id,
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
        $("#addModal").attr("data-id", rowdata.uid);
        $("#addModalName").val(rowdata.name);
        $("#addModalFullName").val(rowdata.fullName);
        $("#addModalBase").val(rowdata.base);
        $("#addModalKp").val(rowdata.kp);
        $("#addModalKpTel").val(rowdata.kpTel);
        $("#addModalKpEmail").val(rowdata.kpEmail);
        $("#addModalConnector").val(rowdata.connector);
        $("#addModalConnectorTel").val(rowdata.connectorTel);
        $("#addModalConnectorEmail").val(rowdata.connectorEmail);
        $("#addModalImportance").val(rowdata.importance);
        $("#addLp").addClass("update");
    }


    function iniFileInput1(subpath) {
        let panel = $("#input-repl-1").fileinput({
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
        let lpId = $("#addMeetingModal").attr("data-id");
        let form = {
            "lpId": lpId,
            "user": $("#addMeetingModalUser").val(),
            "date": new Date($("#addMeetingModalDate").val()).getTime(),
            "person": $("#addMeetingModalPerson").val(),
            "content": $("#addMeetingModalContent").val()
        }

        let formData = JSON.stringify(form);
        $.ajax({
            url: basepath + '/api/lp/records',
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
     *  添加一条LP记录
     */
    function addLp() {
        let message="添加成功";

        let form = {
            "name": $("#addModalName").val(),
            "fullName": $("#addModalFullName").val(),
            "base": $("#addModalBase").val(),
            "kp": $("#addModalKp").val(),
            "kpTel": $("#addModalKpTel").val(),
            "kpEmail": $("#addModalKpEmail").val(),
            "connector": $("#addModalConnector").val(),
            "connectorTel": $("#addModalConnectorTel").val(),
            "connectorEmail": $("#addModalConnectorEmail").val(),
            "importance": $("#addModalImportance").val(),
        };

        if(form["name"] =="" || form["base"] =="" || form["kp"] =="" || form["connector"]=="" ){
            swal({
                title: "带*的字段必须填写！", type: 'warning', confirmButtonText: '返回'
            });
            return;
        }

        if($("#addLp").hasClass("update")){
            form["uid"] = $("#addModal").attr("data-id");
            message = "更新成功";
        }

        let formData = JSON.stringify(form);

        $.ajax({
            url: basepath + '/api/lp',
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

</script>
</body>
</html>
