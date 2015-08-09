<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>${systemName} - ${systemDescription}</title>
[#include "/include/header.ftl"  /]
    <script type="application/javascript">
        $(function () {
            $("a[name='chkPub']").bind("click", function () {
                $.ajax2({
                    type: "get",//使用get方法访问后台
                    dataType: "json",//返回json格式的数据
                    url: "${base}/weixin/pub/change/" + this.id,//要访问的后台地址
                    data: "",//要发送的数据
                    error: function (msg) {
                        //    alert(msg);
                    },//AJAX请求完成时隐藏loading提示
                    success: function (data) {//msg为返回的数据，在这里做数据绑定
                                 alert(data);
                    }
                });
            });
        });
    </script>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-2">
            [#include "/include/menu.ftl" /]
            </div>
            <div class="col-md-10">
                <div class="col-xs-8 col-sm-9 pricing-span-body">
                [#list list as pub]
                    <div class="pricing-span">
                        <div class="widget-box pricing-box-small">
                            <div class="widget-header header-color-red3">
                                <h5 class="bigger lighter">${pub.name}</h5>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="list-unstyled list-striped pricing-table">
                                        <li> ${pub.email} </li>
                                        <li> ${pub.appid} </li>
                                        <li> [#if pub.secret?length gt 10] ${pub.secret?substring(0,10)}*******[/#if] </li>
                                        <li> ${pub.phone} </li>

                                        <li>
                                            <i class="icon-ok glyphicon glyphicon-ok red"></i>
                                        </li>
                                    </ul>
                                </div>

                                <div>
                                    <a href="#" name="chkPub" id="${pub.id}" class="btn btn-block btn-sm btn-danger">
                                        <span>选择</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                [/#list]

                </div>
            </div>
        </div>
    </div>
[#include "/include/footer.ftl" /]
