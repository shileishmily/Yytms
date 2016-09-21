<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <title>印刷耗材管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="resources/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css"/>
    <script src="resources/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {

            $("#layout1").ligerLayout({leftWidth: 200, heightDiff: -43});
        });

    </script>
    <style type="text/css">
        body,html {
            height: 100%;
        }

        body {
            padding: 0px;
            margin: 0;
            overflow: hidden;
        }

        .l-link {
            display: block;
            height: 26px;
            line-height: 26px;
            padding-left: 10px;
            text-decoration: underline;
            color: #333;
        }

        .l-link2 {
            text-decoration: underline;
            color: white;
            margin-left: 2px;
            margin-right: 2px;
        }

        .l-layout-top {
            background: #102A49;
            color: White;
        }

        .l-layout-bottom {
            background: #E5EDEF;
            text-align: center;
        }

        #pageloading {
            position: absolute;
            left: 0px;
            top: 0px;
            background: white url('resources/images/loading.gif') no-repeat center;
            width: 100%;
            height: 100%;
            z-index: 99999;
        }

        .l-link {
            display: block;
            line-height: 22px;
            height: 22px;
            padding-left: 16px;
            border: 1px solid white;
            margin: 4px;
        }

        .l-link-over {
            background: #FFEEAC;
            border: 1px solid #DB9F00;
        }

        .l-winbar {
            background: #2B5A76;
            height: 30px;
            position: absolute;
            left: 0px;
            bottom: 0px;
            width: 100%;
            z-index: 99999;
        }

        .space {
            color: #E7E7E7;
        }
        /* 顶部 */
        .l-topmenu {
            margin: 0;
            padding: 0;
            height: 31px;
            line-height: 31px;
            background: url('resources/images/top.jpg') repeat-x bottom;
            position: relative;
            border-top: 1px solid #1D438B;
        }

        .l-topmenu-logo {
            color: #E7E7E7;
            padding-left: 35px;
            line-height: 26px;
            background: url('resources/images/topicon.gif') no-repeat
            10px 5px;
        }

        .l-topmenu-welcome {
            position: absolute;
            height: 24px;
            line-height: 24px;
            right: 30px;
            top: 2px;
            color: #070A0C;
        }

        .l-topmenu-welcome a {
            color: #E7E7E7;
            text-decoration: underline
        }

        .body-gray2014 #framecenter {
            margin-top: 3px;
        }

        .viewsourcelink {
            background: #B3D9F7;
            display: block;
            position: absolute;
            right: 10px;
            top: 3px;
            padding: 6px 4px;
            color: #333;
            text-decoration: underline;
        }

        .viewsourcelink-over {
            background: #81C0F2;
        }

        .l-topmenu-welcome label {
            color: white;
        }

        #skinSelect {
            margin-right: 6px;
        }
    </style>
</head>
<body style="padding:1px">
<div id="topmenu" class="l-topmenu">
    <div class="l-topmenu-logo">后台管理界面</div>
    <div class="l-topmenu-welcome">
        <span style="color:white">欢迎:${user.name }</span>
        <span class="space">|</span>
        <a href="${baseURL }/user/logout.do" class="l-link2">退出</a>
        <span class="space">|</span>
        <a style="cursor:pointer" class="l-link2" id="changePassword">修改密码</a>
    </div>
</div>

<div id="layout1">
    <div position="left" title="主要菜单" id="accordion1"></div>
    <div position="center" title="标题"  id="framecenter">
        <div tabid="home" title="用户登录信息" style="height: 300px">
            <iframe frameborder="0" name="home" id="home" src=""></iframe>
        </div>
    </div>
</div>
<div style="height: 32px; line-height: 32px; text-align: center;">
    Copyright © 2011-2014 宏宏</div>
<div style="display: none"></div>
</body>
</html>
