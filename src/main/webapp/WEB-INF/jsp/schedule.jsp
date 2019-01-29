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
                    <li>
                         <a href="#" id="PLW"> PLW
                            <span class="glyphicon glyphicon-triangle-bottom pull-right"></span>
                         </a>
                     </li>
                     <!-- Sub menu -->
                    <li><a href="pipeline.html">&emsp;&emsp;Pipeline</a></li>
                    <li><a href="leads.html">&emsp;&emsp;Leads</a></li>
                    <li><a href="watchlist.html">&emsp;&emsp;Watchlist</a></li>

                    <li class="current"><a href="schedule.html">Schedule</a></li>
                </ul>
             </div>
		  </div>
		  <div class="col-md-10">
  			<div class="content-box-large">
  				<div class="panel-heading clearfix">
					<div class="panel-title pull-left"><h3>2019/01/28-2019/02/01 VKC日程安排</h3></div>
					<div class="pull-right">
						<button type="button" class="btn btn-primary" id="addModalBtn" data-toggle="modal" data-target="#addModal">录入下周日程</button>
					</div>
				</div>
  				<div class="panel-body" id="container">
  					<!-- 已投项目表格 -->
  					<table cellpadding="0" cellspacing="0" border="0" class="table table-hover table-striped table-bordered" id="portfolioTable" style="width: 100%;">
						<thead>
							<tr>
								<!-- <th>#</th> -->
								<th>Name</th>
								<th>日期</th>
								<th>9:00-10:00</th>
								<th>10:00-11:00</th>
								<th>11:00-12:00</th>
								<th>12:00-13:00</th>
								<th>13:00-14:00</th>
								<th>14:00-15:00</th>
								<th>15:00-16:00</th>
								<th>16:00-17:00</th>
								<th>17:00-18:00</th>
								<th>18:00-19:00</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- <td></td> -->
								<td><a class="text-center">Floyd</a></td>	
								<td>2019/01/28<br/>周一</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活-IPO</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活%</td>
								<td>已退出</td>
							</tr>
							<tr>
								<td><a class="text-center">Floyd</a></td>
								<td>2019/01/29<br/>周二</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活-IPO</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活%</td>
								<td>已退出</td>
							</tr>
							<tr>
								<td><a class="text-center">Floyd</a></td>
								<td>2019/01/30<br/>周三</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活-IPO</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活%</td>
								<td>已退出</td>
							</tr>
							<tr>
								<td><a class="text-center">Floyd</a></td>
								<td>2019/01/31<br/>周四</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活-IPO</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活%</td>
								<td>已退出</td>
							</tr>
							<tr>
								<td><a class="text-center">Floyd</a></td>
								<td>2019/02/01<br/>周五</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活-IPO</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活</td>
								<td>干活%</td>
								<td>已退出</td>
							</tr>
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
							    	<option>VKC USD Fund I</option>
							      	<option>VKC USD Fund II</option>
							      	<option>VKC RMB Fund I</option>
							      	<option>VKC RMB Fund II</option>
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
					      		<input type="text" class="form-control" id="addModalInitialTime" placeholder="YYYY/MM">
					    	</div>
  						</div>

  						<div class="form-group row">
    						<label for="addModalShareType" class="col-sm-2 col-form-label">股权性质</label>
    						<div class="col-sm-10">
	    						<select class="form-control" id="addModalShareType">
							    	<option>普通股</option>
							      	<option>优先股</option>
							    </select>
							</div>
  						</div>

  						<div class="form-group row">
    						<label for="addModalInvestType" class="col-sm-2 col-form-label">领头/跟投</label>
    						<div class="col-sm-10">
    							<select class="form-control" id="addModalInvestType">
						    		<option>领投</option>
						      		<option>跟投</option>
						    	</select>
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
							    	<option>美元</option>
							      	<option>人民币</option>
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
					      		<select class="form-control" id="addModalExitStatus">
							    	<option>已退出</option>
							      	<option>未退出</option>
							    </select>
					    	</div>
  						</div>

  						<div class="form-group row">
    						<label for="addModalExitType" class="col-sm-2 col-form-label">退出方式</label>
    						<div class="col-sm-10">
					      		<select class="form-control" id="addModalExitType">
							    	<option>IPO</option>
							      	<option>并购</option>
							    </select>
					    	</div>
  						</div>

  						<div class="form-group row">
    						<label for="addModalExitTime" class="col-sm-2 col-form-label">退出时间</label>
    						<div class="col-sm-10">
					      		<input type="text" class="form-control" id="addModalExitTime" placeholder="YYYY/MM/DD">
					    	</div>
  						</div>

  						<div class="form-group row">
    						<label for="addModalValueAchievingalueAchieved" class="col-sm-2 col-form-label">已实现价值</label>
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
    <script type="text/javascript" src="js/dataTables.rowsGroup.js"></script>

    <script src="js/custom.js"></script>
    <script type="text/javascript">

        $(document).ready(function(){
            var table = $('#portfolioTable').DataTable({
                "columnDefs": [
                	{ width: '20%', targets: 0 },
                ],
                'rowsGroup': [0],
                'fixedColumns': true,
                'searching': true, // 可搜索
                'order': [[0, 'asc']],
                'scrollX': true,	// 水平滚动条
                'scrollCollapse': true,
                'autoWidth': true,
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

        });
    </script>
  </body>
</html>