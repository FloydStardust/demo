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
        .td-font-bold {
            font-weight: bold;
        }

        .table-pl > thead > tr > th {
            text-align: center;
        }

        .table-op > tbody > tr > td {
            text-align: center;
        }
        .table-op > thead > tr > th {
            text-align: center;
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

<div class="page-content" data-projectId="${projectId}">
    <div class="row">
        <div class="col-md-2">
            <div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <li><a href="index.html"> Dashboard</a></li>
                    <li class="current"><a href="portfolio.html"> Portfolio</a></li>
                    <li class="submenu open">
                        <a href="#">
                            <i class="glyphicon glyphicon-list"></i> PLW
                            <span class="caret pull-right"></span>
                        </a>
                        <!-- Sub menu -->
                        <ul>
                            <li><a href="pipeline.html">Pipeline</a></li>
                            <li><a href="leads.html">Leads</a></li>
                            <li><a href="watchlist.html">Watchlist</a></li>
                        </ul>
                    </li>
                    <li><a href="schedule.html">Schedule</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10">
            <div class="content-box-large">
                <div class="panel-heading">
                    <div class="panel-title"><h3 id="big-title">500万彩票</h3></div>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-tabs" id="detailTab" role="tablist">
                        <li role="presentation">
                            <a id="intro-tab" data-toggle="tab" href="#intro" role="tab" aria-controls="intro">公司概览</a>
                        </li>
                        <li role="presentation" class="active">
                            <a id="PL-tab" data-toggle="tab" href="#PL" role="tab" aria-controls="PL">利润表</a>
                        </li>
                        <li role="presentation">
                            <a id="CS-tab" data-toggle="tab" href="#CS" role="tab" aria-controls="CS">现金流量表</a>
                        </li>
                        <li role="presentation">
                            <a id="BS-tab" data-toggle="tab" href="#BS" role="tab" aria-controls="BS">资产负债表</a>
                        </li>
                        <li role="presentation">
                            <a id="OP-tab" data-toggle="tab" href="#OP" role="tab" aria-controls="OP">业务报表</a>
                        </li>
                        <li role="presentation">
                            <a id="modify-tab"  data-toggle="tab" href="#modify" role="tab" aria-controls="modify">信息修改</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="detailTabContent">
                        <div class="tab-pane fade" id="intro" role="tabpanel">
                            <br/>
                            <div class="row col-md-12">
                                <div class="col-md-6 panel-success">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">公司基本介绍</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        500.com是中国历史最长、用户规模最大、唯一具备合法资质的民营互联网体彩销售服务平台。500.com也是唯一一家获得财政部批准试点进行互联网体育彩票销售服务的民营企业
                                        <br />
                                    </div>
                                </div>
                                <div class="col-md-6 panel-success">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">利润表摘要</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        这里是利润表摘要
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <div class="col-md-6 panel-primary">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">现金流量表摘要</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        这里是现金流量表摘要
                                        <br />
                                    </div>
                                </div>
                                <div class="col-md-6 panel-primary">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title">资产负债表摘要</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        这里是资产负债表摘要
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <div class="col-md-12 panel-warning">
                                    <div class="content-box-header panel-heading">
                                        <div class="panel-title ">当期业务情况简评</div>
                                    </div>
                                    <div class="content-box-large box-with-header">
                                        <br/>
                                        报告期：2018.11.01-2018.11.30
                                        <br/>
                                        这里是当期业务情况简评
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade in active" id="PL" role="tabpanel">
                            <br/>
                            <div class="row col-md-7">
                                <div class="pull-left"> <h4>货币码：RMB 单位：千元</h4> </div>
                                <div class="pull-right">
                                    <button type="button" class="btn btn-primary" id="loadHistory">加载历史数据</button>
                                    <button type="button" class="btn btn-success">导出Excel</button>
                                </div>
                            </div>
                            <br/>
                            <div class="col-md-7">
                                <!-- 利润表 -->
                                <table class="table table-bordered table-pl" style="width:100%" id="PLTable">
                                    <thead>
                                    <tr>
                                        <th>科目</th>
                                        <th id="PL-currentMonth">18 Nov</th>
                                        <th id="PL-lastMonth">18 Oct</th>
                                        <th>MoM</th>
                                        <th>YoY</th>
                                        <th id="PL-currentYTD">19 YTD</th>
                                        <th id="PL-lastYTD">18 YTD</th>
                                        <th>YoY</th>
                                        <th id="PL-currentEstimate">FY19-E</th>
                                        <th>完成%</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="CS" role="tabpanel">
                            <br/>
                            <div class="row">
                                <h4 class="col-md-6">报告期：2018.11.30 货币码：RMB 单位：元</h4>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-success">导出Excel</button>
                                </div>
                            </div>
                            <br/>
                            <div class="col-md-7">
                                <!-- 现金流量表 -->
                                <table class="table table-bordered" style="width:100%" id="CFTable">
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
                        <div class="tab-pane fade" id="BS" role="tabpanel">
                            <br/>
                            <div class="row">
                                <h4 class="col-md-6">报告期：2018.11.30 货币码：RMB 单位：千元</h4>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-success">导出Excel</button>
                                </div>
                            </div>
                            <br/>
                            <div class="col-md-10">
                                <!-- 资产负债表 -->
                                <table class="table table-bordered table-pl" style="width:100%" id="BSTable">
                                    <thead>
                                    <tr>
                                        <th>科目</th>
                                        <th>18 Nov</th>
                                        <th>17 Oct</th>
                                        <th>MoM</th>
                                        <th>FY18-E</th>
                                        <th>FY17</th>
                                        <th>YoY</th>
                                        <th>18 Sep</th>
                                        <th>18 Aug</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>货币资金</td>
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
                                        <td>交易性金融资产</td>
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
                                        <td>应收票据</td>
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
                                        <td>应收账款	</td>
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
                                        <td>预付账款</td>
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
                                        <td>应收利息</td>
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
                                        <td>其他应收款</td>
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
                                        <td>存货</td>
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
                                        <td>其他流动资产</td>
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
                                        <td><strong>流动资产合计</strong></td>
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
                                        <td>长期股权投资</td>
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
                                        <td>固定资产</td>
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
                                        <td>在建工程</td>
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
                                        <td>固定资产清理	</td>
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
                                        <td>无形资产</td>
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
                                        <td>长期待摊费用</td>
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
                                        <td>递延所得税资产</td>
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
                                        <td>其他非流动资产</td>
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
                                        <td><strong>非流动资产合计</strong></td>
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
                                        <td><strong>资产总计</strong></td>
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
                                        <td>短期借款</td>
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
                                        <td>交易性金融负债</td>
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
                                        <td>应付票据</td>
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
                                        <td>预收账款	</td>
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
                                        <td>应付职工薪酬</td>
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
                                        <td>应交税费</td>
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
                                        <td>应付利息</td>
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
                                        <td>应付股利</td>
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
                                        <td>其他应付款</td>
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
                                        <td>一年内到期的非流动负债</td>
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
                                        <td>其他流动负债</td>
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
                                        <td><strong>流动负债合计</strong></td>
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
                                        <td>长期借款</td>
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
                                        <td>应付债券</td>
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
                                        <td>长期应付款</td>
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
                                        <td>专项应付款</td>
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
                                        <td>预计负债</td>
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
                                        <td>递延收益</td>
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
                                        <td>递延所得税负债</td>
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
                                        <td>其他非流动负债</td>
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
                                        <td><strong>非流动负债合计</strong></td>
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
                                        <td><strong>负债合计</strong></td>
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
                                        <td>实收资本（或股本）</td>
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
                                        <td>资本公积	</td>
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
                                        <td>专项储备</td>
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
                                        <td>盈余公积</td>
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
                                        <td>未分配利润</td>
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
                                        <td>少数股东权益</td>
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
                                        <td>外币报表折算差异</td>
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
                                        <td><strong>所有者权益总计</strong></td>
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
                                        <td><strong>负债和权益总计</strong></td>
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
                        <div class="tab-pane fade" id="OP" role="tabpanel">
                            <br/>
                            <div class="row">
                                <h4 class="col-md-6">报告期：2018.11.30 货币码：RMB 单位：见左侧表头</h4>
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
                            <h4 class="offset-md-2"> Floyd持续Coding中...QAQ </h4>
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
            Copyright 2014 <a href='#'>Website</a>
        </div>

    </div>
</footer>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>

<script src="<%=request.getContextPath()%>/js/custom.js"></script>

<!-- datables-js引入-Floyd -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
<script type="text/javascript">

    $(document).ready(function(){
        var basepath = "<%=request.getContextPath()%>";
        var projectId = $(".page-content").attr("data-projectId");

        // load profit and loss table
        $.ajax({
            url: basepath + "/api/project_detail/" + projectId,
            method: "GET"
        }).done(function (data) {
            var response;
            try {
                response = JSON.parse(data)
            } catch (e) {
                console.log(e.message);
            }

            var currentDate = response.data[0].currentDate;
            var lastDate  = response.data[0].lastDate;
            var currentYear = parseInt(currentDate.split('-')[0]);
            var lastYear = currentYear - 1;

            // set table header
            $('#PL-currentMonth').html(currentDate);
            $('#PL-lastMonth').html(lastDate);
            $('#PL-currentYTD').html(currentYear+'YTD');
            $('#PL-lastYTD').html(lastYear+'YTD');
            $('#PL-currentEstimate').html('FY'+currentYear+'-E');

            var plData = [];
            $.each(response.data, function (index, value) {
                let row = [];
                row.push(value.rowName);
                row.push(numberWithCommas(value.currentMonthValue));
                row.push(numberWithCommas(value.lastMonthValue));
                row.push(value.moM*100 + '%');
                row.push(value.yoY*100 + '%');
                row.push(numberWithCommas(value.currentYTD));
                row.push(numberWithCommas(value.lastYTD));
                row.push(value.yTD_YoY*100 + '%');
                row.push(numberWithCommas(value.currentEstimate));
                row.push(value.completeRatio*100 + '%');
                plData.push(row);
            });

            $('#PLTable').DataTable({
                "data": plData,
                "ordering": false,
                "paging": false,
                "searching": false,
                "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
                    if ( aData[0] == "毛利"  || aData[0] == "营业利润" || aData[0] == "利润总额" || aData[0] == "净利润")
                    {
                        $('td', nRow).css('background-color', '#D3D3D3');
                        $('td', nRow).addClass('td-font-bold');
                    }
                }
            });
        });

        $(".page-content").on('click', '#loadHistory', function () {
            $.ajax({
                url: basepath + '/api/project_detail/history/' + projectId,
                method: 'GET'
            }).done(function (data) {

            });
        });

        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
    });
</script>
</body>
</html>
