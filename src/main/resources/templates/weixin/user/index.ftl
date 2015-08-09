
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
            <div class="media">
                <div class="parrent pull-left">
                    <ul class="nav nav-tabs nav-stacked">
                    <#list groups as group>
                        <li><a name="groupBtn"  href="#tab1" data-toggle="tab" class="analistic-01" id="${group.groupId}">${group.name}(${group.count})</a></li>
                    </#list>

                    </ul>
                </div>

                <div class="parrent media-body">
                    <div class="tab-content">
                        <div class="tab-pane fade" id="tab1">
                            <div class="panel-default">
                                <!-- Default panel contents -->
                                <div class="panel-heading">用户列表</div>

                                <!-- Table -->
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" name="chkAll"></th>
                                        <th>头像</th>
                                        <th>昵称</th>
                                        <th>性别</th>
                                        <th>国家</th>
                                        <th>地区</th>
                                    </tr>
                                    </thead>
                                    <tbody id="userTbody">
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div> <!--/.tab-content-->
                </div> <!--/.media-body-->
            </div>

        </div><!--/row-->
    </div>
<#include "/include/footer.ftl" />
