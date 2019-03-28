<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>VKC CRM v1.1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">
	  <link rel="stylesheet" href="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.css" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="login-bg">
  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-12">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="index.html">VKC-CRM管理系统</a></h1>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>

	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			                <h6>修改密码</h6>
                            <input id="old_password" class="form-control" type="password" placeholder="原密码" required="required">
			                <input id="password" class="form-control" type="password" placeholder="Password" required="required">
			                <input id="passwordRepeat" class="form-control" type="password" placeholder="Confirm Password" required="required">
			                <div class="action">
			                    <button class="btn btn-primary signup" onclick="register()">确认修改</button>
			                </div>                
			            </div>
			        </div>

			        <div class="already">
			            <p>Have an account already?</p>
			            <a href="/login">Login</a>
			        </div>
			    </div>
			</div>
		</div>
	</div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/js/cookieHelper.js"></script>
	<script type="text/javascript" src="https://cdn.bootcss.com/limonte-sweetalert2/7.33.1/sweetalert2.min.js"></script>
	<script type="text/javascript">
		var basepath = "<%=request.getContextPath()%>";
		var token = getCookie("access_token");

		function register() {
			var password = document.getElementById("password").value;
			var passwordRepeat = document.getElementById("passwordRepeat").value;

			if (password !== passwordRepeat) {
				alert("新密码不一致！");
				return;
			}

			let form = {
                "password": password
            };
            let formData = JSON.stringify(form);

			var xhr = new XMLHttpRequest();
			xhr.withCredentials = true;

			$.ajax({
				url: basepath + 'api/user',
				type: "PUT",
                data: formData,
                dataType: 'json',
                contentType:"application/json",
				beforeSend: function (xhr) {
					xhr.setRequestHeader("authorization", "Bearer " + token);
				}
			}).done(function (data) {
				if (data.responseCode == "RESPONSE_OK"){
					swal({
						title: '密码修改成功！', type: 'success', confirmButtonText: 'OK'
					}).then(function(result){
						window.location.href = '/login';
					});
				} else {
					swal({
						title: data.desciption, type: 'error', confirmButtonText: '返回'
					});
				}
            });
		}
	</script>
  </body>
</html>