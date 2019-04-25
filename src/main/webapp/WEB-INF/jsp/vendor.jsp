<%--
  Created by IntelliJ IDEA.
  User: VKC
  Date: 2019/4/24
  Time: 10:50
  To change this template use File | Settings | File Templates.
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
                    <li><a href="<%=request.getContextPath()%>#"> Portfolio</a></li>
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
                    <li class="current"><a href="<%=request.getContextPath()%>/vendor">Vendor</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading clearfix">
                    <div class="panel-title pull-left"><h3 id="page_name">Vendor List</h3></div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-primary" id="addProjectModalBtn" onclick="addNewProjectModal()">1.添加项目</button>
                        <button type="button" class="btn btn-success" id="addVendorModalBtn" onclick="addNewVendorModal()">2.添加第三方机构</button>
                    </div>
                </div>
                <div class="panel-body" id="container">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-striped table-bordered nowrap"
                           id="dataTable" style="width: 100%;">
                        <thead>
                            <tr>
                                <th rowspan="2">项目名称</th>
                                <th colspan="6">会计师事务所</th>
                                <th colspan="6">律师事务所</th>
                            </tr>
                            <tr>
                                <th>机构名称</th>
                                <th>负责合伙人</th>
                                <th>具体经办人</th>
                                <th>业务类型</th>
                                <th>收费金额</th>
                                <th>评价</th>
                                <th>机构名称</th>
                                <th>负责合伙人</th>
                                <th>具体经办人</th>
                                <th>业务类型</th>
                                <th>收费金额</th>
                                <th>评价</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Project Modal -->
<div class="modal fade" id="addProjectModal" tabindex="-1" role="dialog" aria-labelledby="addProjectModalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="addProjectModalTitle">添加项目信息</h3>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <label for="addProjectModalName" class="col-sm-2 col-form-label">项目名称*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addProjectModalName" placeholder="Project Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addProjectModalFund" class="col-sm-2 col-form-label">所属基金*</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addProjectModalFund">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addProjectModalManager" class="col-sm-2 col-form-label">项目组联系人*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addProjectModalManager" placeholder="VKC员工名">
                        </div>
                    </div>
                </form>
                <!-- <div class="float-right"><h3>提交前请再次检查</h3></div> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button id="addProject" type="button" class="btn btn-primary" onclick="addProject()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- Add Vendor Modal -->
<div class="modal fade" id="addVendorModal" tabindex="-1" role="dialog" aria-labelledby="addVendorModalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="addVendorModalTitle">添加第三方机构信息</h3>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <label for="addVendorModalProject" class="col-sm-2 col-form-label">项目名称*</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addVendorModalProject">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalType" class="col-sm-2 col-form-label">机构类型*</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addVendorModalType">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalName" class="col-sm-2 col-form-label">第三方机构名称*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalName" placeholder="e.g.PwC">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalPartner" class="col-sm-2 col-form-label">负责合伙人*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalPartner" placeholder="Vendor Partner">
                        </div>
                    </div>

                    <div class="form-group row" id="addModalRevenueGroup">
                        <label for="addVendorModalPartnerContact" class="col-sm-2 col-form-label">联系方式</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalPartnerContact" placeholder="Vendor Partner Contact">
                        </div>
                    </div>

                    <div class="form-group row" id="addModalNetIncomeGroup">
                        <label for="addVendorModalConductor" class="col-sm-2 col-form-label">具体经办人*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalConductor" placeholder="Vendor Conductor">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalConductorContact" class="col-sm-2 col-form-label">联系方式</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalConductorContact" placeholder="Vendor Conductor Contact">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalBusinessType" class="col-sm-2 col-form-label">业务类型*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalBusinessType" placeholder="e.g.FDD">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalCharge" class="col-sm-2 col-form-label">收费金额*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalCharge" placeholder="请填写币种（e.g.USD 1000）">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalCostBearer" class="col-sm-2 col-form-label">费用承担方*</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addVendorModalCostBearer" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addVendorModalComment" class="col-sm-2 col-form-label">评价</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addVendorModalComment" rows="3"></textarea>
                        </div>
                    </div>
                </form>
                <!-- <div class="float-right"><h3>提交前请再次检查</h3></div> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button id="addVendor" type="button" class="btn btn-primary" onclick="addVendor()">保存</button>
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

<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
<script type="text/javascript">
    let basepath = "<%=request.getContextPath()%>";
    let token = getCookie("access_token");
    let table;

    $(document).ready(function(){
        loadVendorList();
    });


    function loadVendorList() {
        table = $('#dataTable').DataTable({
            ajax:  {
                url: basepath + '/api/vendor',
                type: "GET",
                contentType : 'application/json;charset=utf-8',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authorization", "Bearer " + token);
                }
            },
            columns: [
                { data: null, render: function(data, type, row){
                        return '<a href="'+basepath+'/vendor/project/'+row.uid+'">'+ row.project+ '</a>';
                    }, className: 'font-bold'},
                { data: null, render: function (data, type, row) {
                        if( row.financialVendor==null || row.financialVendor.name==null){
                            return "-";
                        } else{
                            return row.financialVendor.name;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.financialVendor==null || row.financialVendor.partner==null){
                            return "-";
                        } else{
                            return row.financialVendor.partner;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.financialVendor==null || row.financialVendor.conductor==null){
                            return "-";
                        } else{
                            return row.financialVendor.conductor;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.financialVendor==null || row.financialVendor.businessType==null){
                            return "-";
                        } else{
                            return row.financialVendor.businessType;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.financialVendor==null || row.financialVendor.charge==null){
                            return "-";
                        } else{
                            return row.financialVendor.charge;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.financialVendor==null || row.financialVendor.comment==null){
                            return "-";
                        } else{
                            return row.financialVendor.comment;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.lawVendor==null || row.lawVendor.name==null){
                            return "-";
                        } else{
                            return row.lawVendor.name;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.lawVendor==null || row.lawVendor.partner==null){
                            return "-";
                        } else{
                            return row.lawVendor.partner;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.lawVendor==null || row.lawVendor.conductor==null){
                            return "-";
                        } else{
                            return row.lawVendor.conductor;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.lawVendor==null || row.lawVendor.businessType==null){
                            return "-";
                        } else{
                            return row.lawVendor.businessType;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.lawVendor==null || row.lawVendor.charge==null){
                            return "-";
                        } else{
                            return row.lawVendor.charge;
                        }
                    }},
                { data: null, render: function (data, type, row) {
                        if( row.lawVendor==null || row.lawVendor.comment==null){
                            return "-";
                        } else{
                            return row.lawVendor.comment;
                        }
                    }},
            ],
            fixedColumns: { leftColumns: 1 }, searching: true, // 可搜索
            order: [[0, 'asc']], autoWidth: false, iDisplayLength: 10,
            scrollX: true,	scrollCollapse: true
        });
    }

    function addNewProjectModal() {
        $.ajax({
            url: basepath + '/api/fund',
            type: "GET",
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            console.log(data);
            if(data.responseCode == "RESPONSE_OK"){
                let options = [];
                $.each(data.data, function (k, v) {
                    options.push("<option value='" + k + "'>" + v + "</option>");
                });
                $("#addProjectModalFund").html(options.join(''));
                $('#addProjectModal').modal('show');
            }
        });
    }

    function addNewVendorModal() {
        $.ajax({
            url: basepath + '/api/vendor/project',
            type: "GET",
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            if(data.responseCode == "RESPONSE_OK"){
                let options = []
                $.each(data.data, function (index, value) {
                    options.push("<option value='" + value.uid + "'>" + value.name + "</option>");
                });
                $("#addVendorModalProject").html(options.join(''));
                $.ajax({
                    url: basepath + '/api/vendor/type',
                    type: "GET",
                    contentType : 'application/json;charset=utf-8',
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("authorization", "Bearer " + token);
                    }
                }).done(function (data) {
                    let options = []
                    $.each(data.data, function (k, v) {
                        options.push("<option value='" + k + "'>" + v + "</option>");
                    });
                    $("#addVendorModalType").html(options.join(''));
                    $('#addVendorModal').modal('show');
                });
            }
        });
    }

    function addProject() {
        let message="添加成功";
        let form = {
            "name": $("#addProjectModalName").val(),
            "fund": parseInt($("#addProjectModalFund").val()),
            "manager": $("#addProjectModalManager").val(),
        };

        let formData = JSON.stringify(form);

        $.ajax({
            url: basepath + '/api/vendor/project',
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
                    $('#addProjectModal input').val("");
                    $('#addProjectModal').modal('hide');
                });;
            } else {
                swal({
                    title: '参数错误', text: data.description, type: 'error', confirmButtonText: '返回'
                });
            }
        });
    }

    function addVendor() {
        let message="添加成功";
        let form = {
            "project": $("#addVendorModalProject").val(),
            "type": $("#addVendorModalType").val(),
            "name": $("#addVendorModalName").val(),
            "partner": $("#addVendorModalPartner").val(),
            "partnerContact": $("#addVendorModalPartnerContact").val(),
            "conductor": $("#addVendorModalConductor").val(),
            "conductorContact": $("#addVendorModalConductorContact").val(),
            "businessType": $("#addVendorModalBusinessType").val(),
            "charge": $("#addVendorModalCharge").val(),
            "costBearer": $("#addVendorModalCostBearer").val(),
            "comment": $("#addVendorModalComment").val(),
        };

        if(form["project"] =="" || form["type"] =="" || form["name"] ==0 || form["charge"]==""){
            swal({
                title: "带*的字段必须填写！", type: 'warning', confirmButtonText: '返回'
            });
            return;
        }

        let formData = JSON.stringify(form);

        $.ajax({
            url: basepath + '/api/vendor',
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