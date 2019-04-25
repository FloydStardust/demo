<%--
  Created by IntelliJ IDEA.
  User: Floyd
  Date: 2019/1/29
  Time: 21:35
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
        .font-bold {
            font-weight: bold;
        }
        /*th, td { white-space: nowrap; }*/


        /*table{*/
            /*margin: 0 auto;*/
            /*width: 100%;*/
            /*clear: both;*/
            /*border-collapse: collapse;*/
            /*table-layout: fixed; // ***********add this*/
            /*word-wrap:break-word; // ***********and this*/
        /*}*/

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
                    <li class="current"><a href="<%=request.getContextPath()%>/portfolio"> Portfolio</a></li>
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
                    <li><a href="<%=request.getContextPath()%>/vendor">Vendor</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading clearfix">
                    <div class="panel-title pull-left"><h3>已投项目列表(RMB K)</h3></div>
                    <div class="pull-right">
                        <button type="button" class="btn btn-primary" id="addModalBtn" data-toggle="modal" data-target="#addModal">添加项目</button>
                        <button type="button" class="btn btn-success">批量导入</button>
                    </div>
                </div>
                <div class="panel-body" id="container">
                    <!-- 已投项目表格 -->
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-striped table-bordered nowrap"
                           id="portfolioTable" style="width:100%">
                        <thead>
                        <tr>
                            <!-- <th>#</th> -->
                            <th>被投项目</th>
                            <th>基金名称</th>
                            <th>初投时间</th>
                            <th>股权性质</th>
                            <th>领/跟投</th>
                            <th>董事会席位</th>
                            <th>投资轮次</th>
                            <th>共同投资人</th>
                            <th>币种</th>
                            <th>投资金额</th>
                            <th>投资时股权比例（投后）</th>
                            <th>最新股权比例</th>
                            <th>项目来源</th>
                            <th>项目执行人</th>
                            <th>项目管理人</th>
                            <th>董事席位</th>
                            <th>一级行业分类</th>
                            <th>二级行业分类</th>
                            <th>所在地域</th>
                            <th>注册地</th>
                            <!-- <th>公司基本介绍</th> -->
                            <th>退出状态</th>
                            <th>退出方式</th>
                            <th>退出时间</th>
                            <th>已实现价值</th>
                            <th>未实现价值</th>
                            <th>总价值</th>
                            <th>回报倍数</th>
                            <th>Gross IRR</th>
                            <th>估值依据</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Portfolio Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="addModalTitle">添加Portfolio记录</h3>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group row">
                        <label for="addModalFundName" class="col-sm-2 col-form-label">基金名称</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalFundName">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalProjectName" class="col-sm-2 col-form-label">项目名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalProjectName" placeholder="Project Name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalInitialTime" class="col-sm-2 col-form-label">初投时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalInitialTime" placeholder="yyyy/MM/dd">
                        </div>
                    </div>

                    <%--<div class="form-group row">--%>
                        <%--<label for="addModalShareType" class="col-sm-2 col-form-label">目前状态</label>--%>
                        <%--<div class="col-sm-10">--%>
                            <%--<select class="form-control" id="addModalIPOStatus">--%>
                            <%--</select>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group row">
                        <label for="addModalShareType" class="col-sm-2 col-form-label">股权性质</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalShareType" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalInvestType" class="col-sm-2 col-form-label">领头/跟投</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalInvestType" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalBoardNum" class="col-sm-2 col-form-label">董事会席位</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalBoardNum" placeholder="1,2,3...">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalInvestRound" class="col-sm-2 col-form-label">投资轮次</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalInvestRound" placeholder="">
                        </div>
                        <!-- <select class="form-control" id="addModalInvestRound">
                            <option>天使轮</option>
                              <option>Pre-A</option>
                        </select> -->
                    </div>

                    <div class="form-group row">
                        <label for="addModalInvestPartner" class="col-sm-2 col-form-label">共同投资人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalInvestPartner" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalMoneyType" class="col-sm-2 col-form-label">币种</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addModalMoneyType">
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalInvestAccount" class="col-sm-2 col-form-label">投资金额</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalInvestAccount" placeholder="精确到个位">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalInvestShareRatio" class="col-sm-2 col-form-label">投资时股权比例</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalInvestShareRatio" placeholder="xx.xx%">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalCurrentShareRatio" class="col-sm-2 col-form-label">最新股权比例</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalCurrentShareRatio" placeholder="xx.xx%">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalSource" class="col-sm-2 col-form-label">项目来源</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalSource" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalDirector" class="col-sm-2 col-form-label">项目执行人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalDirector" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalManager" class="col-sm-2 col-form-label">项目管理人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalManager" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalBoarder" class="col-sm-2 col-form-label">董事席位</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalBoarder" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalIndustry" class="col-sm-2 col-form-label">一级行业</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalIndustry" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalIndustrySub" class="col-sm-2 col-form-label">二级行业</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalIndustrySub" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalProjectLocation" class="col-sm-2 col-form-label">所在地域</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalProjectLocation" placeholder="城市名">
                            <%--<select class="form-control" id="addModalProjectLocation">--%>
                                <%----%>
                                <%--<option>北京</option>--%>
                                <%--<option>上海</option>--%>
                                <%--<option>广州</option>--%>
                                <%--<option>深圳</option>--%>
                                <%--<option>成都</option>--%>
                                <%--<option>重庆</option>--%>
                                <%--<option>武汉</option>--%>
                                <%--<option>南京</option>--%>
                                <%--<option>杭州</option>--%>
                                <%--<option>郑州</option>--%>
                                <%--<option>济南</option>--%>
                            <%--</select>--%>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalRegisterLocation" class="col-sm-2 col-form-label">注册地</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalRegisterLocation" placeholder="城市名">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalCompanyIntro" class="col-sm-2 col-form-label">公司介绍</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="addModalCompanyIntro" rows="3"></textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalExitStatus" class="col-sm-2 col-form-label">退出状态</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalExitStatus" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalExitType" class="col-sm-2 col-form-label">退出方式</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalExitType" placeholder="">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalExitTime" class="col-sm-2 col-form-label">退出时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalExitTime" placeholder="YYYY/MM/DD">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalValueAchieved" class="col-sm-2 col-form-label">已实现价值</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalValueAchieved" placeholder="精确到个位">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalValueAchieving" class="col-sm-2 col-form-label">未实现价值</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalValueAchieving" placeholder="精确到个位">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalTotalValue" class="col-sm-2 col-form-label">总价值</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalTotalValue" placeholder="精确到个位">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalReturnMultiple" class="col-sm-2 col-form-label">回报倍数(x)</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalReturnMultiple" placeholder="xx.xx(无需输入x)">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="addModalGrossIRR" class="col-sm-2 col-form-label">Gross IRR(%)</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalGrossIRR" placeholder="xx.xx(无需输入%)">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="addModalValueEvidence" class="col-sm-2 col-form-label">估值依据</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="addModalValueEvidence" placeholder="">
                        </div>
                    </div>
                </form>
                <div class="float-right"><h3>提交前请再次检查</h3></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <button type="button" class="btn btn-primary" onclick="addPortfolio()">保存</button>
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

<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
<script type="text/javascript">
    let basepath = "<%=request.getContextPath()%>";
    let token = getCookie("access_token");
    let fields = ${fields};
    let table;

    $(document).ready(function(){
        loadPortfolioTable();
        loadAddModalFields();
    });

    /**
     *  加载portfolio大表格
     */
    function loadPortfolioTable() {
        table = $('#portfolioTable').DataTable({
            ajax:  {
                url: basepath + '/api/portfolio',
                type: "GET",
                contentType : 'application/json;charset=utf-8',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("authorization", "Bearer " + token);
                }
            },
            columns: [
                {   data: null ,
                    render: function(data, type, row){
                        if(row.financeData){
                            return '<a href="'+basepath+'/portfolio/' + row.uid + '">'+ row.name+ '</a>';
                        }else{
                            return row.name;
                        }
                    },
                    className: 'font-bold', width: '80%'
                },
                { data: "fundName" }, { data: "date" }, { data: "shareType" }, { data: "investType" },
                { data: "boardNum" }, { data: "round" }, { data: "partner" }, { data: "moneyType" }, 
                { data: null, render: function (data, type, row) {
                        return numberWithCommas(row.investNum);
                    } },
                { data: "investRatio" }, { data: "currentRatio" }, { data: "source" }, { data: "director" }, { data: "manager" },
                { data: "boarder" }, { data: "industry" }, { data: "sector" }, { data: "location" }, { data: "registerLocation" },
                { data: "exitStatus" }, { data: "exitType" }, { data: "exitTime" }, 
                { data: null, render: function (data, type, row) {
                        return numberWithCommas(row.valueAchieved);
                    } },
                { data: null, render: function (data, type, row) {
                        return numberWithCommas(row.valueAchieving);
                    } },
                { data: null, render: function (data, type, row) {
                        return numberWithCommas(row.totalValue);
                    } },
                { data: null, render: function (data, type, row) {
                        return row.returnMultiple.toFixed(1)+ 'x';
                    } },
                { data: null, render: function (data, type, row) {
                        return (row.irr*100).toFixed(2) + '%';
                    } }, { data: "valueEvidence" }
            ],
            fixedColumns: true, iDisplayLength: 10,
            searching: true, // 可搜索
            order: [[2, 'desc']], scrollX: true,	// 水平滚动条
            scrollCollapse: true, autoWidth: false,

        });
        // 在第一列添加序号
        // t.on( 'order.dt search.dt', function () {
        //     t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
        //         cell.innerHTML = i+1;
        //     } );
        // } ).draw();
    }

    /**
     *  添加一条portfolio记录
     */
    function addPortfolio() {
        let formData = JSON.stringify({
            "name": $("#addModalProjectName").val(),
            "fundName": $("#addModalFundName").val(),
            "date": $("#addModalInitialTime").val(),
            "ipoStatus": $("#addModalIPOStatus").val(),
            "shareType": $("#addModalShareType").val(),
            "investType": $("#addModalInvestType").val(),
            "boardNum": $("#addModalBoardNum").val(),
            "round": $("#addModalInvestRound").val(),
            "investPartner": $("#addModalInvestPartner").val(),
            "moneyType": $("#addModalMoneyType").val(),
            "investNum": $("#addModalInvestAccount").val(),
            "investRatio": $("#addModalInvestShareRatio").val(),
            "currentRatio": $("#addModalCurrentShareRatio").val(),
            "source": $("#addModalSource").val(),
            "partner": $("#addModalPartner").val(),
            "manager": $("#addModalManager").val(),
            "boarder": $("#addModalBoarder").val(),
            "industry": $("#addModalIndustry").val(),
            "sector": $("#addModalIndustrySub").val(),
            "location": $("#addModalProjectLocation").val(),
            "registerLocation": $("#addModalRegisterLocation").val(),
            "exitStatus": $("#addModalExitStatus").val(),
            "exitType": $("#addModalExitType").val(),
            "exitTime": $("#addModalExitTime").val(),
            "valueAchieved": $("#addModalValueAchieved").val(),
            "valueAchieving": $("#addModalValueAchieving").val(),
            "totalValue": $("#addModalTotalValue").val(),
            "returnMultiple": $("#addModalReturnMultiple").val(),
            "irr": $("#addModalGrossIRR").val(),
            "valueEvidence": $("#addModalValueEvidence").val()
        });

        $.ajax({
            url: basepath + '/api/portfolio',
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
     * 加载add portfolio modal 中的各个<select>字段
     */
    function loadAddModalFields() {
        console.log(fields);
        let options = []
        $.each(fields.funds, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalFundName").html(options.join(''));

        options=[]
        $.each(fields.iPOStatus, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalIPOStatus").html(options.join(''));

        options=[]
        $.each(fields.shareType, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalShareType").html(options.join(''));

        options=[]
        $.each(fields.investType, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalInvestType").html(options.join(''));

        options=[]
        $.each(fields.moneyType, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalMoneyType").html(options.join(''));

        options=[]
        $.each(fields.exitStatus, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalExitStatus").html(options.join(''));

        options=[]
        $.each(fields.exitType, function (k, v) {
            options.push("<option value='" + k + "'>" + v + "</option>");
        });
        $("#addModalExitType").html(options.join(''));
    }

    function numberWithCommas(x) {
        if(typeof x == 'number'){
            x = (x/1000).toFixed(1);
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }else {
            return  '<a style="text-decoration:none;">'+ x +'</a>';
            // return x;
        }
    }
</script>
</body>
</html>
