<%--
  Created by IntelliJ IDEA.
  User: VKC
  Date: 2019/4/24
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <div class="panel-title pull-left"><h3 id="projectNameTitle"></h3></div>

                </div>
                <div class="panel-body" id="container">
                    <br/>
                    <div class="row col-md-12">
                        <div class="col-md-12 panel-primary">
                            <div class="content-box-header panel-heading">
                                <div class="panel-title pull-left">项目简介</div>
                                <%--<div class="panel-title pull-right"><a onclick="changeProject()" href="#">修改</a></div>--%>
                            </div>
                            <div class="content-box-large box-with-header">
                                <form>
                                    <div class="form-group row">
                                        <label for="projectName" class="col-sm-2 col-md-2 col-form-label">项目名称：</label>
                                        <div class="col-sm-10 col-md-10">
                                            <p id="projectName"></p>
                                            <%--<input type="text" class="form-control" id="financialName" placeholder="e.g.PwC">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="projectFund" class="col-sm-2 col-md-2 col-form-label">所属基金：</label>
                                        <div class="col-sm-10 col-md-10">
                                            <p id="projectFund"></p>
                                            <%--<input type="text" class="form-control" id="addVendorModalPartner" placeholder="Vendor Partner">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="projectManager" class="col-sm-2 col-md-2 col-form-label">项目组联系人：</label>
                                        <div class="col-sm-10 col-md-10">
                                            <p id="projectManager"></p>
                                            <%--<input type="text" class="form-control" id="financialPartnerContact" placeholder="Vendor Partner Contact">--%>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <div class="col-md-6 panel-success">
                            <div class="content-box-header panel-heading">
                                <div class="panel-title pull-left">会计师事务所</div>
                                <div class="panel-title pull-right"><a id="changeFinanceBtn" style="cursor:pointer;"
                                                                       onclick="changeFinance()">修改</a></div>
                            </div>
                            <div class="content-box-large box-with-header">
                                <form>
                                    <div class="form-group row">
                                        <label for="financialName" class="col-sm-4 col-md-4 col-form-label">机构名称：</label>
                                        <div class="col-sm-8 col-md-8" id="financialName">
                                            <%--<input type="text" class="form-control" id="financialName" placeholder="e.g.PwC">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="financialPartner" class="col-sm-4 col-md-4 col-form-label">负责合伙人：</label>
                                        <div class="col-sm-8 col-md-8" id="financialPartner">
                                            <%--<input type="text" class="form-control" id="addVendorModalPartner" placeholder="Vendor Partner">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row" id="addModalRevenueGroup">
                                        <label for="financialPartnerContact" class="col-sm-4 col-md-4 col-form-label">联系方式：</label>
                                        <div class="col-sm-8 col-md-8" id="financialPartnerContact">
                                            <%--<input type="text" class="form-control" id="financialPartnerContact" placeholder="Vendor Partner Contact">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row" id="addModalNetIncomeGroup">
                                        <label for="financialConductor" class="col-sm-4 col-md-4 col-form-label">具体经办人：</label>
                                        <div class="col-sm-8 col-md-8" id="financialConductor">
                                            <%--<input type="text" class="form-control" id="financialConductor" placeholder="Vendor Conductor">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="financialConductorContact" class="col-sm-4 col-md-4 col-form-label">联系方式：</label>
                                        <div class="col-sm-8 col-md-8" id="financialConductorContact">
                                            <%--<input type="text" class="form-control" id="financialConductorContact" placeholder="Vendor Conductor Contact">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="financialBusinessType" class="col-sm-4 col-md-4 col-form-label">业务类型：</label>
                                        <div class="col-sm-8 col-md-8" id="financialBusinessType">
                                            <%--<input type="text" class="form-control" id="addVendorModalBusinessType" placeholder="e.g.FDD">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="financialCharge" class="col-sm-4 col-md-4 col-form-label">收费金额：</label>
                                        <div class="col-sm-8 col-md-8" id="financialCharge">
                                            <%--<input type="text" class="form-control" id="addVendorModalCharge" placeholder="请填写币种（e.g.USD 1000）">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="financialCostBearer" class="col-sm-4 col-md-4 col-form-label">费用承担方：</label>
                                        <div class="col-sm-8 col-md-8" id="financialCostBearer">
                                            <%--<input type="text" class="form-control" id="addVendorModalCostBearer" placeholder="">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="financialComment" class="col-sm-4 col-md-4 col-form-label">评价：</label>
                                        <div class="col-sm-8 col-md-8" id="financialComment">
                                            <%--<textarea class="form-control" id="addVendorModalComment" rows="3"></textarea>--%>
                                        </div>
                                    </div>
                                </form>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-success hidden" id="updateFinance" onclick="updateFinance()">提交</button>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 panel-info">
                            <div class="content-box-header panel-heading">
                                <div class="panel-title pull-left">律师事务所</div>
                                <div class="panel-title pull-right"><a id="changeLawBtn" style="cursor:pointer;"
                                                                       onclick="changeLaw()">修改</a></div>
                            </div>
                            <div class="content-box-large box-with-header">
                                <form>
                                    <div class="form-group row">
                                        <label for="lawName" class="col-sm-4 col-md-4 col-form-label">机构名称：</label>
                                        <div class="col-sm-8 col-md-8" id="lawName">
                                            <%--<input type="text" class="form-control" id="financialName" placeholder="e.g.PwC">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawPartner" class="col-sm-4 col-md-4 col-form-label">负责合伙人：</label>
                                        <div class="col-sm-8 col-md-8" id="lawPartner">
                                            <%--<input type="text" class="form-control" id="addVendorModalPartner" placeholder="Vendor Partner">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawPartnerContact" class="col-sm-4 col-md-4 col-form-label">联系方式：</label>
                                        <div class="col-sm-8 col-md-8" id="lawPartnerContact">
                                            <%--<input type="text" class="form-control" id="financialPartnerContact" placeholder="Vendor Partner Contact">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawConductor" class="col-sm-4 col-md-4 col-form-label">具体经办人：</label>
                                        <div class="col-sm-8 col-md-8" id="lawConductor">
                                            <%--<input type="text" class="form-control" id="financialConductor" placeholder="Vendor Conductor">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawConductorContact" class="col-sm-4 col-md-4 col-form-label">联系方式：</label>
                                        <div class="col-sm-8 col-md-8" id="lawConductorContact">
                                            <%--<input type="text" class="form-control" id="financialConductorContact" placeholder="Vendor Conductor Contact">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawBusinessType" class="col-sm-4 col-md-4 col-form-label">业务类型：</label>
                                        <div class="col-sm-8 col-md-8" id="lawBusinessType">
                                            <%--<input type="text" class="form-control" id="addVendorModalBusinessType" placeholder="e.g.FDD">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawCharge" class="col-sm-4 col-md-4 col-form-label">收费金额：</label>
                                        <div class="col-sm-8 col-md-8" id="lawCharge">
                                            <%--<input type="text" class="form-control" id="addVendorModalCharge" placeholder="请填写币种（e.g.USD 1000）">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawCostBearer" class="col-sm-4 col-md-4 col-form-label">费用承担方：</label>
                                        <div class="col-sm-8 col-md-8" id="lawCostBearer">
                                            <%--<input type="text" class="form-control" id="addVendorModalCostBearer" placeholder="">--%>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="lawComment" class="col-sm-4 col-md-4 col-form-label">评价：</label>
                                        <div class="col-sm-8 col-md-8" id="lawComment">
                                            <%--<textarea class="form-control" id="addVendorModalComment" rows="3"></textarea>--%>
                                        </div>
                                    </div>
                                </form>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-info hidden" id="updateLaw" onclick="updateLaw()">提交</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

<script type="text/javascript" src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.min.js"></script>

<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
<script type="text/javascript">
    let basepath = "<%=request.getContextPath()%>";
    let token = getCookie("access_token");
    let projectId = ${projectId};
    let project;

    $(document).ready(function(){
        $.ajax({
            url: basepath + '/api/vendor/project/' + projectId,
            type: "GET",
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            console.log(data);
            project = data.data;
            if(data.responseCode == "RESPONSE_OK"){
                $('#projectNameTitle').html(project.name);
                $('#projectName').html(project.name);
                $('#projectFund').html(project.fund);
                $('#projectManager').html(project.manager);
                $.each(project.vendors, function (index, value) {
                    if(value.type == 1){
                        $('#financialName').html(value.name);
                        $('#financialPartner').html(value.partner);
                        $('#financialPartnerContact').html(value.partnerContact);
                        $('#financialConductor').html(value.conductor);
                        $('#financialConductorContact').html(value.conductorContact);
                        $('#financialBusinessType').html(value.businessType);
                        $('#financialCharge').html(value.charge);
                        $('#financialCostBearer').html(value.costBearer);
                        $('#financialComment').html(value.comment);
                        $('#updateFinance').attr('data-id', value.uid);
                    }else if(value.type ==2){
                        $('#lawName').html(value.name);
                        $('#lawPartner').html(value.partner);
                        $('#lawPartnerContact').html(value.partnerContact);
                        $('#lawConductor').html(value.conductor);
                        $('#lawConductorContact').html(value.conductorContact);
                        $('#lawBusinessType').html(value.businessType);
                        $('#lawCharge').html(value.charge);
                        $('#lawCostBearer').html(value.costBearer);
                        $('#lawComment').html(value.comment);
                        $('#updateLaw').attr('data-id', value.uid);
                    }
                });
            }
        });
    });

    function changeProject() {
        console.log(111)
    }

    function changeFinance() {
        $('#changeFinanceBtn').removeAttr('onclick');
        genInputField($('#financialName'));
        genInputField($('#financialPartner'));
        genInputField($('#financialPartnerContact'));
        genInputField($('#financialConductor'));
        genInputField($('#financialConductorContact'));
        genInputField($('#financialBusinessType'));
        genInputField($('#financialCharge'));
        genInputField($('#financialCostBearer'));
        genTextarea($('#financialComment'));
        $('#updateFinance').removeClass('hidden');
    }

    function changeLaw() {
        $('#changeLawBtn').removeAttr('onclick');
        genInputField($('#lawName'));
        genInputField($('#lawPartner'));
        genInputField($('#lawPartnerContact'));
        genInputField($('#lawConductor'));
        genInputField($('#lawConductorContact'));
        genInputField($('#lawBusinessType'));
        genInputField($('#lawCharge'));
        genInputField($('#lawCostBearer'));
        genTextarea($('#lawComment'));
        $('#updateLaw').removeClass('hidden');
    }

    function updateFinance() {
        let form = {
            "uid": $('#updateFinance').attr('data-id'),
            "project": project.uid,
            "type": 1,
            "name": $("#financialName input").val(),
            "partner": $("#financialPartner input").val(),
            "partnerContact": $("financialPartnerContact input").val(),
            "conductor": $("#financialConductor input").val(),
            "conductorContact": $("#financialConductorContact input").val(),
            "businessType": $("#financialBusinessType input").val(),
            "charge": $("#financialCharge input").val(),
            "costBearer": $("#financialCostBearer input").val(),
            "comment": $("#financialComment textarea").val(),
        };
        updateVendor(form)
    }

    function updateLaw() {
        let form = {
            "uid": $('#updateLaw').attr('data-id'),
            "project": project.uid,
            "type": 2,
            "name": $("#lawName input").val(),
            "partner": $("#lawPartner input").val(),
            "partnerContact": $("lawPartnerContact input").val(),
            "conductor": $("#lawConductor input").val(),
            "conductorContact": $("#lawConductorContact input").val(),
            "businessType": $("#lawBusinessType input").val(),
            "charge": $("#lawCharge input").val(),
            "costBearer": $("#lawCostBearer input").val(),
            "comment": $("#lawComment textarea").val(),
        };
        updateVendor(form)
    }

    function updateVendor(form) {
        let message="更新成功";
        let formData = JSON.stringify(form);
        console.log(formData)

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

    function genInputField(obj) {
        let inputHtml = '<input type="text" class="form-control">';
        let value = obj.html();
        obj.html(inputHtml);
        obj.find('input').val(value);
    }

    function genTextarea(obj) {
        let textareaHtml = '<textarea class="form-control" rows="3"></textarea>';
        let value = obj.html();
        obj.html(textareaHtml);
        obj.find('textarea').val(value);
    }
</script>
</body>
</html>