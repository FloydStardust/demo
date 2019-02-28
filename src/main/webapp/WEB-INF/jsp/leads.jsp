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
        th, td { word-wrap:break-word; }

        div.container {
            width: 80%;
        }
        .font-bold {
            font-weight: bold;
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
                        </ul>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/schedule">Schedule</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading clearfix">
                    <div class="panel-title pull-left"><h3 id="page_name">Pipeline List</h3></div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-primary hidden" id="addModalBtn" data-toggle="modal" data-target="#addModal">添加 Leads</button>
                        <button type="button" class="btn btn-success">批量导入</button>
                    </div>
                </div>
                <div class="panel-body" id="container">
                    <!-- 已投项目表格 -->
                    <table cellpadding="0" cellspacing="0" class="table table-hover table-striped table-bordered" id="dataTable" style="width: 100%;">
                        <thead>
                        <tr>
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
                        <tbody></tbody>
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
                        <label for="addModalName" class="col-sm-2 col-form-label">项目名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalName" placeholder="Project Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalSource" class="col-sm-2 col-form-label">项目来源</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalSource">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalPartner" class="col-sm-2 col-form-label">负责合伙人</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalPartner">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalManager" class="col-sm-2 col-form-label">投资经理</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalManager">
                            </select>
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
                <button id="addLeads" type="button" class="btn btn-primary" onclick="addLeads()">保存</button>
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
            Copyright <a href='#'> Floyd, 2019 </a>
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
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>

<script src="<%=request.getContextPath()%>/js/fileinput.min.js"></script>
<script src="<%=request.getContextPath()%>/js/locales/zh.js"></script>
<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
<script type="text/javascript">

    let basepath = "<%=request.getContextPath()%>";
    let token = getCookie("access_token");
    let type = ${type};
    let table;

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
        }

        let users={}, status = {};
        $.ajax({
            url: basepath + '/api/leads/status',
            type: "GET",
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            if(data.responseCode == "RESPONSE_OK"){
                status = data.data;
                $.ajax({
                    url: basepath + '/api/user',
                    type: "GET",
                    contentType : 'application/json;charset=utf-8',
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("authorization", "Bearer " + token);
                    }
                }).done(function (data) {
                    if(data.responseCode == "RESPONSE_OK"){
                        $.each(data.data, function (index, value) {
                           users[value.id] = value.userName;
                        });
                        loadAddModalFields(users, status);
                        loadTable(users, status);
                    }
                });
            }
        });

        $('.modal').on('hidden.bs.modal', function () {
            $(this).find("input,textarea,select")
                .val('')
                .end();
            $(this).removeAttr("data-id");
            $("#addLeads").removeClass("update");
        });
    });

    /**
     *  加载leads大表格
     */
    function loadTable(users, status) {
        let url;
        if(type == 0){
            url = basepath + '/api/leads';
            $("#addModalBtn").removeClass("hidden");
        }else if(type == 1){
            url = basepath + '/api/leads/pipeline';
        }else if(type == 2){
            url = basepath + '/api/leads/watchlist';
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
                {   data: null, render: function(data, type, row){
                        return '<a href="#" data-id="' +  row.uid + '">'+ row.name+ '</a>';
                    }, className: 'font-bold' },
                { data: null, render: function (data, type, row) {
                        return users[row.source]
                    } },
                { data: null, render: function (data, type, row) {
                        return users[row.partner]
                    } },
                { data: null, render: function (data, type, row) {
                        return users[row.manager]
                    } },
                { data: "company" },
                { data: "industry" }, { data: "location" }, { data: "summary" },
                { data: null, render: function (data, type, row) {
                        return status[row.status]
                    } },
                { data: null, render: function (data, type, row) {
                    let date = new Date(row.lastChange);
                        return date.toLocaleDateString();
                    } },
                { data: null, render: function (data, type, row) {
                        return status[row.next]
                    } },
                { data: null, render: function (data, type, row) {
                        if(row.status == -1)    return row.passReason;
                        else    return row.sourceReason;
                    }, orderable: false },
                { data: null, render: function (data, type, row) {
                        return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm record-upload">上传</button>&nbsp;&nbsp;' +
                            '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download record-download">下载</button>';
                    }, orderable: false },
                { data: null, render: function (data, type, row) {
                        return '<button data-id="'+ row.uid + '" type="button" class="btn btn-danger btn-sm bp-upload">上传</button>&nbsp;&nbsp;' +
                            '<button data-id="'+ row.uid + '" type="button" class="btn btn-primary btn-sm download bp-download">下载</button>';
                    }, orderable: false }
            ],
            searching: true, // 可搜索
            order: [[9, 'desc']], autoWidth: false,
        });

        $('#dataTable tbody').on('dblclick', 'tr', function () {
            var data = table.row( this ).data();
            $('#addModalBtn').click();
            console.log(data);
            $("#addModal").attr("data-id", data.uid);
            $("#addModalName").val(data.name);
            $("#addModalSource").val(data.source);
            $("#addModalPartner").val(data.investPartner);
            $("#addModalManager").val(data.manager);
            $("#addModalCompany").val(data.company);
            $("#addModalIndustry").val(data.industry);
            $("#addModalLocation").val(data.location);
            $("#addModalSummary").val(data.summary);
            $("#addModalDescription").val(data.description);
            $("#addModalStatus").val(data.status);
            $("#addModalNext").val(data.next);
            $("#addModalReason").val(data.sourceReason);
            $("#addLeads").addClass("update");
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
    }

    function iniFileInput1(subpath) {
        let panel = $("#input-repl-1").fileinput({
            uploadUrl: basepath + '/file' + subpath,
            autoReplace: true,
            maxFileCount: 1,
            allowedFileExtensions: ["doc", "docx", "xls", "xlsx", "ppt", "pptx", "txt", "jpg", "jpeg", "png"]
        });
    }

    function iniFileInput2(subpath) {
        let panel = $("#input-repl-2").fileinput({
            uploadUrl: basepath + '/file' + subpath,
            autoReplace: true,
            maxFileCount: 1,
            allowedFileExtensions: ["doc", "docx", "xls", "xlsx", "ppt", "pptx", "txt", "jpg", "jpeg", "png"]
        });
    }


    /**
     *  添加一条leads记录
     */
    function addLeads() {
        let form = {
            "name": $("#addModalName").val(),
            "source": $("#addModalSource").val(),
            "investPartner": $("#addModalPartner").val(),
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
        if($("#addLeads").hasClass("update")){
            form["uid"] = $("#addModal").attr("data-id")
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
    function loadAddModalFields(users, status) {
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
        $("#addModalNext").html(options.join(''));
    }

</script>
</body>
</html>
