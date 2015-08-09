
<#include "/include/header.ftl"  />
<script type="application/javascript">
    $(function () {
        $("a[name='groupBtn']").bind("click", function () {
            $.ajax2({
                type: "get",//使用get方法访问后台
                dataType: "json",//返回json格式的数据
                url: "/weixin/user/" + this.id,//要访问的后台地址
                data: "",//要发送的数据
                error: function (msg) {
                    //    alert(msg);
                },//AJAX请求完成时隐藏loading提示
                success: function (data) {//msg为返回的数据，在这里做数据绑定
                    $("#userTbody").html("");
                    for (var i = 0; i < data.data.length; i++) {
                        var tr="<tr>";
                        tr+="<th scope=\"row\"><input type='checkbox'></th>";
                        tr+="<td><img width='49' height='49' src=\"" + data.data[i].headimgurl + "\" class=\"img-responsive\" alt=\"...\"></td>";
                        tr+="<td>" + data.data[i].nickname + "</td>";
                        tr+="<td>" +(data.data[i].sex==1?"男":"女") + "</td>";
                        tr+="<td>" + data.data[i].country + "</td>";
                        tr+="<td>" + data.data[i].province + "</td>";
                        tr+="</tr>";
                        $("#userTbody").append(tr);
                    }
                }
            });
        });
    });
</script>
<div class="container-fluid">

    <div class="row row-offcanvas row-offcanvas-left">

        <div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">

        <#include "/include/menu.ftl"  />

        </div><!--/span-->

        <div class="col-sm-9 col-md-10 main">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">Library</a></li>
                <li class="active">Data</li>
            </ol>
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#home" data-toggle="tab">
                        新建发送消息
                    </a>
                </li>
                <li><a href="#ios" data-toggle="tab">已发送列表</a></li>

            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            群发对象：<select><option>全部</option></select>
                            性别：<select><option>全部</option></select>
                            群发地区：<select><option>全部</option></select>
                        </div>
                    </div>
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-th-list"></i> 图文消息</button>
                                <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-edit"></i> 文字</button>
                                <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-picture"></i> 图片</button>
                                <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-bullhorn"></i> 语音</button>
                                <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-facetime-video"></i> 视频</button>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 text-cente">
                                    <a href="javascript:;"  class="create_access" data-type="10" data-index="0">
                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    从素材库中选择</a></div>
                                <div class="col-xs-6 text-cente"><a href="javascript:;"  class="create_access">
                                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    新建图文消息</a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="ios">

                    <table class="table">
                        <thead>
                        <tr>
                            <th><input type="checkbox" name="chkAll"></th>
                            <th>消息类型</th>
                            <th>发送对象</th>
                            <th>发送时间</th>
                            <th>发送状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="messageTbody">
                        </tbody>
                    </table>

                </div>
            </div>

        </div><!--/row-->
    </div>
<#include "/include/footer.ftl" />

