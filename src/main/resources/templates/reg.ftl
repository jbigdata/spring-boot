<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0"/>
    <title>${systemName} - 登录</title>

    <link rel="stylesheet" type="text/css" href="${base}/static/assets/css/reg.css">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="${base}/static/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/assets/css/style.css">
    <script type="text/javascript" src="${base}/static/assets/js/jquery-1.10.2.min.js"></script>
    <script type="application/javascript">
        $(function () {
            $("#login-submit").on('click', function (event) {

                var username = $('#username').val();
                var passwd = $('#password').val();
                var npasswd = $('#npassword').val();
                var phone=$('#phone').val();
                var email=$('#email').val();
                // var verifyCode = $('.verifyCode').val();
                if(username == ''){
                    $.showTips('请输入用户名');
                }else if(phone == ''){
                    $.showTips('请输入手机号');
                }else if(email == ''){
                    $.showTips('请输入邮箱地址');
                }else if(passwd == ''){
                    $.showTips('请输入密码');
                }else if(npasswd == ''){
                    $.showTips('请输入确认密码');
                }else if(npasswd != passwd){
                    $.showTips('两次密码输入不一致');
                }else{
                    $.ajax2({
                        type: "post",//使用get方法访问后台
                        dataType: "json",//返回json格式的数据
                        url: "${base}/reg.shtml",//要访问的后台地址
                        data: {
                            loginName:$("#username").val(),
                            password:$("#password").val(),
                            email:$("#email").val(),
                            npassword:npasswd

                        },//要发送的数据
                        error: function (data) {
                            $.showTips(data);
                        },//AJAX请求完成时隐藏loading提示
                        success: function (data) {//msg为返回的数据，在这里做数据绑定
                            $.showTips(data.message);
                            if(data.code==data.code){
                                window.location.href=data.data;
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
    <div class=""> </div>
    <div class="head-info">
        <label class="lbl-0">用户注册</label>
        <label class="lbl-1"> </label>
        <label class="lbl-2"></label>
    </div>
    <div class="clear"> </div>
    <form>
        <input type="text" class="txt" name="username"  id="username" placeholder="用户名" >
        <input type="text" class="txt" name="phone"  id="username" placeholder="手机号" >
        <input type="text" class="txt" name="email"  id="phone" placeholder="邮箱" >
        <input type="password" class="txt" id="password"   placeholder="密码">
        <input type="password" class="txt" id="npassword"   placeholder="确认密码">
    </form>
    <div class="signin">
        <input type="button" id="login-submit" value="立即注册" >
    </div>
</div>
<div class="copy-rights">
    <p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.we-dian.com">we-dian</a></p>
</div>
</body>
</html>