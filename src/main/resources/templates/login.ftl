<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>
    <title>登录</title>
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css">
    <script type="application/javascript">
        $(function () {
            $("#login-submit").on('click', function (event) {

                var username = $('#username').val();
                var passwd = $('#password').val();
                // var verifyCode = $('.verifyCode').val();
                if (username == '') {
                    $.showTips('请输入用户名/手机号/邮箱');
                } else if (passwd == '') {
                    $.showTips('请输入密码');
                } else {
                    $.ajax2({
                        type: "POST",
                        dataType: "text",
                        contentType: "application/x-www-form-urlencoded; charset=utf-8",
                        url: "/login.shtml",
                        data: {
                            username: $("#username").val(),
                            password: $("#password").val()
                        },
                        error: function (data) {
                            $.showTips("网络超时，请稍后再试");
                        },
                        success: function (data) {
                            $.showTips(data.message);
                            if (data.code == CODE_SUCCESS) {
                                window.location.href = data.data;
                            }

                        }
                    });
                }
            });
        });
    </script>
</head>

<body>
<nav class="navbar navbar-inverse" role="banner">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"><img src="/assets/images/logo.png" height="30" alt="logo"></a>
        </div>

        <div class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.html">首页</a></li>
                <li><a href="about-us.html">关于我们</a></li>
                <li><a href="services.html">我们的服务</a></li>
                <li><a href="portfolio.html">联系我们</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="blog-item.html">Blog Single</a></li>
                        <li><a href="pricing.html">Pricing</a></li>
                        <li><a href="404.html">404</a></li>
                        <li><a href="shortcodes.html">Shortcodes</a></li>
                    </ul>
                </li>
                <li><a href="blog.html">博客</a></li>
                <li><a href="contact-us.html">Contact</a></li>
            </ul>
        </div>
    </div><!--/.container-->
</nav><!--/nav-->
<!--SIGN UP-->
<div class="login-form">
    <div class=""></div>
    <div class="head-info">
        <label class="lbl-0">用户登录</label>
        <label class="lbl-1"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"></div>
    <div class="avtar">
        <img src="/assets/img/login/avtar.png"/>
    </div>
    <form>
        <input type="text" class="text" name="username" id="username" placeholder="用户名/手机号/邮箱">

        <div class="key">
            <input type="password" id="password" name="password" placeholder="密码">
        </div>
    </form>
    <div class="signin">
        <input type="button" id="login-submit" value="登录">
    </div>
</div>
<#include "/include/footer.ftl"  />