<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>VKC-CRM</title>
    <link rel="stylesheet" href="static/css/style1.css">

    <!-- For-Mobile-Apps-and-Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Impressive Multiple Form  Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //For-Mobile-Apps-and-Meta-Tags -->

</head>
<body>

<div class="container">

    <div class="right" style="padding-left:230px">
        <h3>用户登录</h3>
        <div class="sign-in">
            <form action="/login" method="post">
                <input type="text" class="name" name="username" placeholder="Username" required="">
                <input type="password" class="password" name="password" placeholder="Password" required="">
                <ul>
                    <li>
                        <input type="checkbox" id="brand1" value="">
                        <label for="brand1"><span></span>Remember me</label>
                    </li>
                </ul>
                <input type="submit" value="登录">
                <div class="clear"></div>
            </form>
        </div>

        <div class="socialicons w3">
            <ul>
                <li><a class="facebook" href="#"></a></li>
                <li><a class="twitter" href="#"></a></li>
                <li><a class="google" href="#"></a></li>
                <li><a class="pinterest" href="#"></a></li>
                <li><a class="linkedin" href="#"></a></li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>

</div>
<div class="footer agile">
    <p> &copy; All Rights Reserved | Design by Floyd </p>
</div>
</body>
</html>
