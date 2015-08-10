<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>
    <title>${systemName} - 登录</title>

    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css">
    <script type="text/javascript" src="${base}/static/assets/js/jquery-1.10.2.min.js"></script>
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
                        url: "${base}/a/login.shtml",
                        data: {
                            username: $("#username").val(),
                            password: $("#password").val()
                        },
                        error: function (data) {
                            $.showTips("网络超时，请稍后再试");
                        },
                        success: function (result) {
                            alert(result.parseJSON());
                            var obj = result.parseJSON();//eval(result);
                            $.showTips(obj.message);
                            if (obj.code == CODE_SUCCESS) {
                                window.location.href = obj.data;
                            }

                        }
                    });
                }
            });
        });
    </script>
</head>

<body>
<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top on">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">${systemName}<br>we-dian.com</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${base}/index.html" class="page-scroll">首页</a></li>
            <@navigation_list>
                <#list navigations as navigation>
                    <li><a href="${navigation.url}" target="_self">${navigation.name}</a></li>
                </#list>
            </@navigation_list>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<!--SIGN UP-->
<div class="login-form">
    <div class=""></div>
    <div class="head-info">
        <label class="lbl-0">用户登录</label>
        <label class="lbl-1"> </label>
        <label class="lbl-2"></label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"></div>
    <div class="avtar">
        <img src="${base}/static/assets/img/login/avtar.png"/>
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
<div class="copy-rights">
    <p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank"
                                                                 href="http://www.we-dian.com">we-dian</a></p>
</div>

</body>
</html>