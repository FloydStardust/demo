<%--
  Created by IntelliJ IDEA.
  User: Floyd
  Date: 2019/1/29
  Time: 21:37
  This page shows the detail information of a project from portfolio, including P&L, BL, CF and operation status.
  This page couble be heavy and mass, so I will change it later.
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
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
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

        .td-center {
            text-align: center;
        }
        .td-right {
            text-align: right;
        }
        .td-left {
            text-align: left;
        }
        .td-font-bold {
            font-weight: bold;
            font-family: "Microsoft YaHei";
        }
        .medium-font {
            font-size: larger;
        }
        .font-bold {
            font-weight: bold;
        }
        table.with-header thead tr {
            text-align: center;
            color: #FFFFFF;
            background: #a1c4fd ;
        }

        .table-op > tbody > tr > td {
            text-align: center;
        }
        .table-op > thead > tr > th {
            text-align: center;
        }
        th, td { white-space: nowrap;word-break:break-all; }
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

<div class="page-content" data-projectId="${projectId}">
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
                <div class="panel-heading">
                    <div class="panel-title"><h3 id="big-title"></h3></div>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-tabs" id="detailTab" role="tablist">
                        <li role="presentation" class="active">
                            <a id="intro-tab" data-toggle="tab" href="#intro" role="tab" aria-controls="intro">公司概览</a>
                        </li>
                        <li role="presentation">
                            <a id="PL-tab" data-toggle="tab" href="#PL" role="tab" aria-controls="PL">利润表</a>
                        </li>
                        <li role="presentation">
                            <a id="BS-tab" data-toggle="tab" href="#BS" role="tab" aria-controls="BS">资产负债表</a>
                        </li>
                        <li role="presentation">
                            <a id="CS-tab" data-toggle="tab" href="#CS" role="tab" aria-controls="CS">现金流量表</a>
                        </li>
                        <li role="presentation">
                            <a id="OP-tab" data-toggle="tab" href="#OP" role="tab" aria-controls="OP">业务报表</a>
                        </li>
                        <li role="presentation">
                            <a id="modify-tab"  data-toggle="tab" href="#modify" role="tab" aria-controls="modify">信息修改</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="detailTabContent">
                        <div class="tab-pane fade in active" id="intro" role="tabpanel">
                            <br/>
                            <div class="row col-md-12">
                                <div class="col-md-6 panel-primary">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">资产负债表摘要</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <table class="table table-bordered table-hover text-nowrap"
                                               id="BSSummaryTable" cellspacing="0" width="100%">
                                        </table>
                                    </div>
                                </div>

                                <div class="col-md-6 panel-primary">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">利润表摘要</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <table class="table table-bordered table-hover text-nowrap"
                                               id="PLSummaryTable" cellspacing="0" width="100%">
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <div class="col-md-6 panel-success">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">公司基本介绍</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        <div id="company_description">
                                        </div>
                                        <br />
                                    </div>
                                </div>
                                <div class="col-md-6 panel-success">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">现金流量表摘要</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        <div id="cash_flow_summary">
                                            现金流量表功能暂未开放  (๑•́ ₃ •̀๑)
                                        </div>
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <div class="col-md-12 panel-warning">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title ">当期业务完成情况</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        该公司未提交2019年财务目标数据  (つд⊂)
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="PL" role="tabpanel">
                            <br/>
                            <div class="row col-md-12">
                                <div class="col-md-9"> <h3>货币码：RMB 单位：千元</h3></div>
                                <div class="col-md-3">
                                    <div class="pull-left"><h3>历史数据</h3></div>
                                    <div class="pull-right">
                                        <%--<button type="button" class="btn btn-primary" id="loadHistory">加载历史数据</button>--%>
                                        <button type="button" class="btn btn-success">导出Excel</button>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="row col-md-12">
                                <div class="col-md-9 medium-font">
                                    <!-- 利润表 -->
                                    <table class="table table-bordered table-hover text-nowrap with-header" id="PLTable" cellspacing="0" width="100%">
                                    </table>
                                </div>
                                <div class="col-md-3 medium-font">
                                    <!-- 利润表历史数据 -->
                                    <table class="table table-bordered table-hover text-nowrap with-header" id="PLHistoryTable" cellspacing="0" width="100%">
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="BS" role="tabpanel">
                            <br/>
                            <div class="row col-md-12">
                                <div class="col-md-7"> <h3>货币码：RMB 单位：千元</h3></div>
                                <div class="col-md-5">
                                    <div class="pull-left"><h3>历史数据</h3></div>
                                    <div class="pull-right">
                                        <%--<button type="button" class="btn btn-primary" id="loadHistory">加载历史数据</button>--%>
                                        <button type="button" class="btn btn-success">导出Excel</button>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="row col-md-12">
                                <div class="col-md-7 medium-font">
                                    <!-- 资产负债表 -->
                                    <table class="table table-bordered table-hover text-nowrap with-header" id="BSTable" cellspacing="0" width="100%">
                                    </table>
                                </div>
                                <div class="col-md-5 medium-font">
                                    <!-- 资产负债表历史数据 -->
                                    <table class="table table-bordered table-hover text-nowrap with-header" id="BSHistoryTable" cellspacing="0" width="100%">
                                    </table>
                                </div>
                            </div>
                    </div>
                        <div class="tab-pane fade" id="CS" role="tabpanel">
                            <br/>
                            <div class="row">
                                <h2 class="col-md-12">该功能暂未开放，Floyd持续coding...(〃∀〃)</h2>
                            </div>
                            <br/>
                            <div class="col-md-7">
                                <!-- 现金流量表 -->
                                <table class="table table-bordered with-header" style="width:100%" id="CFTable">
                                    <thead>
                                    <tr>
                                        <th>项目</th>
                                        <th>行次</th>
                                        <th>本月金额</th>
                                        <th>本年累计</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><strong>一、经营活动产生的现金流量</strong></td>
                                        <td class="td-center">1</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>销售商品、提供劳务收到的现金</td>
                                        <td class="td-center">2</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>收到的税费返还</td>
                                        <td class="td-center">3</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>收到其他与经营活动有关的现金</td>
                                        <td class="td-center">4</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>经营活动现金流入小计</strong></em></td>
                                        <td class="td-center">5</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>购买商品、接受劳务支付的现金</td>
                                        <td class="td-center">6</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>支付给职工以及为职工支付的现金</td>
                                        <td class="td-center">7</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>支付的各项税费</td>
                                        <td class="td-center">8</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>支付其他与经营活动有关的现金</td>
                                        <td class="td-center">9</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>经营活动现金流出小计</strong></em></td>
                                        <td class="td-center">10</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>经营活动产生的现金流量净额</strong></em></td>
                                        <td class="td-center">11</td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td><strong>二、投资活动产生的现金流量</strong></td>
                                        <td class="td-center">12</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>收回投资收到的现金</td>
                                        <td class="td-center">13</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>取得投资收益收到的现金</td>
                                        <td class="td-center">14</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>处置固定资产、无形资产和其他长期资产收回的现金净额</td>
                                        <td class="td-center">15</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>处置子公司及其他营业单位收到的现金净额</td>
                                        <td class="td-center">16</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>收到其他与投资活动有关的现金</td>
                                        <td class="td-center">17</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>投资活动现金流入小计</strong></em></td>
                                        <td class="td-center">18</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>购建固定资产、无形资产和其他长期资产支付的现金</td>
                                        <td class="td-center">19</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>投资支付的现金</td>
                                        <td class="td-center">20</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>取得子公司及其他营业单位支付的现金净额</td>
                                        <td class="td-center">21</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>支付其他与投资活动有关的现金</td>
                                        <td class="td-center">22</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>投资活动现金流出小计</strong></em></td>
                                        <td class="td-center">23</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>投资活动产生的现金流量净额</strong></em></td>
                                        <td class="td-center">24</td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td><strong>三、筹资活动产生的现金流量</strong></td>
                                        <td class="td-center">25</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>吸收投资收到的现金</td>
                                        <td class="td-center">26</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>子公司吸收少数股东投资收到的现金</td>
                                        <td class="td-center">27</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>取得借款收到的现金</td>
                                        <td class="td-center">28</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>收到其他与筹资活动有关的现金</td>
                                        <td class="td-center">29</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>发行债券收到的现金</td>
                                        <td class="td-center">30</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>筹资活动现金流入小计</strong></em></td>
                                        <td class="td-center">31</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>偿还债务支付的现金</td>
                                        <td class="td-center">32</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>分配股利、利润或偿付利息支付的现金</td>
                                        <td class="td-center">33</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>子公司支付给少数股东的股利</td>
                                        <td class="td-center">34</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>支付其他与筹资活动有关的现金</td>
                                        <td class="td-center">35</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>筹资活动现金流出小计</strong></em></td>
                                        <td class="td-center">36</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><em><strong>筹资活动产生的现金流量净额</strong></em></td>
                                        <td class="td-center">37</td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td><strong>四、现金及现金等价物净增加额</strong></td>
                                        <td class="td-center">38</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>汇率变动对现金的影响</td>
                                        <td class="td-center">39</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>现金及现金等价物净增加额</td>
                                        <td class="td-center">40</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="OP" role="tabpanel">
                            <br/>
                            <div class="row">
                                <h2 class="col-md-11">该功能暂未开放，Floyd持续coding...(〃∀〃)</h2>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-success">导出Excel</button>
                                </div>
                            </div>
                            <br/>
                            <div class="table-responsive">
                                <!-- 业务表、运营情况表 -->
                                <table class="table table-bordered table-op" style="width:100%" id="OPTable">
                                    <thead>
                                    <tr class="active">
                                        <th>RMB K</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th colspan="4">收入</th>
                                        <th colspan="4">件数</th>
                                        <th colspan="4">客单价</th>
                                    </tr>
                                    <tr class="active">
                                        <th>Unit K</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th>19M01</th>
                                        <th>18M12</th>
                                        <th><em>MoM</em></th>
                                        <th><em>YoY</em></th>
                                        <th>19M01</th>
                                        <th>18M12</th>
                                        <th><em>MoM</em></th>
                                        <th><em>YoY</em></th>
                                        <th>19M01</th>
                                        <th>18M12</th>
                                        <th><em>MoM</em></th>
                                        <th><em>YoY</em></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td rowspan="2">公司</td>
                                        <td>收入合计</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <td>毛利合计</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="12">米家</td>
                                        <td rowspan="12">小米收入</td>
                                        <td rowspan="4">本月确认</td>
                                        <td>牙刷类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>刷头类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>剃须刀类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>小计</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="4">本月BOM</td>
                                        <td>牙刷类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>刷头类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>剃须刀类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>小计</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="4">本月合计</td>
                                        <td>牙刷类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>刷头类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>剃须刀类</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>小计</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="modify" role="tabpanel">
                            <h2 class="col-md-12">该功能暂未开放，Floyd持续coding...(〃∀〃)</h2>
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
<script src="https://code.jquery.com/jquery.js"></script>
<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/es6-promise/dist/es6-promise.auto.min.js"></script>

<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>

<!-- datables-js引入-Floyd -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
<script type="text/javascript">
    let basepath = "<%=request.getContextPath()%>";
    let token = getCookie("access_token");
    let portfolioId = $(".page-content").attr("data-projectId");
    $(document).ready(function(){
        loadPlSummary();
        loadBsSummary();
        loadCompanyDescription();
        loadPlTable();
        loadBsTable();

        $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
            $($.fn.dataTable.tables(true)).DataTable()
                .columns.adjust()
                .fixedColumns().relayout();
        });
    });

    function loadBsSummary(){
        $.ajax({
            url: basepath + '/api/portfolio/balance_summary/' + portfolioId,
            type: 'GET',
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            if (data.responseCode == "RESPONSE_OK"){
                let bsSummaryData = transpose( data.data.map(unshiftColumnName));
                let header = genColumnConfig(bsSummaryData.shift());
                let configure = {
                    data: bsSummaryData ,
                    columns: header,
                    paging: false, ordering: false,
                    searching: false, autoWidth: true, info: false
                };
                let table = $('#BSSummaryTable').DataTable(configure);
            }
        });
    }

    function loadPlSummary() {
        $.ajax({
            url: basepath + '/api/portfolio/profit_summary/' + portfolioId,
            type: 'GET',
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            if (data.responseCode == "RESPONSE_OK"){
                let plSummaryData = transpose( data.data.map(unshiftColumnName));
                let header = genColumnConfig(plSummaryData.shift());
                let configure = {
                    data: plSummaryData ,
                    columns: header,
                    paging: false, ordering: false,
                    searching: false, autoWidth: true, info: false
                };
                let table = $('#PLSummaryTable').DataTable(configure);
            }
        });
    }

    function loadCompanyDescription() {
        $.ajax({
            url: basepath + '/api/portfolio/' + portfolioId,
            type: 'GET',
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            console.log(data.data)
            if (data.responseCode != "RESPONSE_OK" ||  data.data.intro==null ){
                $("#company_description").html("暂无公司介绍 ( ˘･з･)");
            }else {
                $("#big-title").html(data.data.name);
                $("#company_description").html(data.data.intro);
            }
        });
    }

    function loadBsTable(){
        $.ajax({
            url: basepath + '/api/portfolio/balance/' + portfolioId,
            type: 'GET',
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            if (data.responseCode == "RESPONSE_OK"){
               // console.log(data);
                let bsData = transpose( data.data.map(unshiftColumnName));
                let firstN = parseInt(data.description);
                let header = genColumnConfig(bsData.shift(), firstN);
                let configure1 = {
                    data: bsData.map(item => item.slice(0, firstN)) ,
                    columns: header.slice(0,firstN),
                    paging: false, ordering: false,
                    searching: false, autoWidth: true, info: false
                };
                let configure2 = {
                    data: bsData.map(item => item.slice(firstN,)) ,
                    columns: header.slice(firstN,),
                    paging: false, ordering: false, // false to disable sorting (or any other option)
                    scrollX: true,	scrollCollapse : true, // 水平滚动条
                    searching: false, autoWidth: true, info: false,
                }
                let table1 = $('#BSTable').DataTable(configure1);
                let table2 = $('#BSHistoryTable').DataTable(configure2);
            }
        });
    }

    function loadPlTable() {
        $.ajax({
            url: basepath + '/api/portfolio/profit/' + portfolioId,
            type: 'GET',
            contentType : 'application/json;charset=utf-8',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("authorization", "Bearer " + token);
            }
        }).done(function (data) {
            if (data.responseCode == "RESPONSE_OK"){
                // console.log(data);
                let plData = transpose( data.data.map(unshiftColumnName));
                let firstN = parseInt(data.description);
                let header = genColumnConfig(plData.shift(), firstN);
                let configure1 = {
                    data: plData.map(item => item.slice(0, firstN)) ,
                    columns: header.slice(0,firstN),
                    paging: false, ordering: false,
                    searching: false, autoWidth: true, info: false
                };
                let configure2 = {
                    data: plData.map(item => item.slice(firstN,)) ,
                    columns: header.slice(firstN,),
                    paging: false, ordering: false, // false to disable sorting (or any other option)
                    scrollX: true,	scrollCollapse : true, // 水平滚动条
                    searching: false, autoWidth: true, info: false,
                }
                let table1 = $('#PLTable').DataTable(configure1);
                let table2 = $('#PLHistoryTable').DataTable(configure2);
            }
        });
    }

    function genColumnConfig(obj, firstN) {
        let headers = []
        for(let i=0; i<obj.length; i++){
            let configure = {
                    title: obj[i],
                    orderable: false,
                    render: function (data, type, row, meta) {
                        return numberWithCommas(data);},
                };
            if(i==0){
                configure['width'] = '30%';
                configure['className'] = 'font-bold';
            }else{
                configure['className'] = 'td-right';
                if(i>=firstN){
                    configure['width'] = '15%';
                }
            }
            headers.push(configure);
        }
        return headers;
    }

    function unshiftColumnName(object) {
        object.numbers.unshift(object.columnsName);
        return object.numbers;
    }
    function transpose(array) {
        return array[0].map((col, i) => array.map(row => row[i]));
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
