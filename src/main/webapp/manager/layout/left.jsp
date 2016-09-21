<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <title>折叠面板</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="resources/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    </style>
    <script src="resources/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/plugins/ligerAccordion.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            $("#accordion1").ligerAccordion(
                    {
                        height: 300
                    });
        });

    </script>
    <style type="text/css">
        body {
            padding: 20px;
            margin: 0;
        }

        #accordion1 {
            width: 160px;
            overflow: hidden;
        }
    </style>
</head>
<body>
<div id="accordion1" class="l-accordion-panel" ligeruiid="accordion1" style="height: 300px;">
    <div class="l-accordion-header l-accordion-header-hasicon">
        <div class="l-accordion-toggle l-accordion-toggle-open"></div>
        <div class="l-accordion-header-inner">功能列表</div>
        <i><img src="../../lib/images/topicon.gif"></i></div>
    <div title="" data-icon="../../lib/images/topicon.gif" class="l-accordion-content" style="height: 225px;">
        <ul>
            <li>列表一</li>
            <li>列表二</li>
            <li>列表三</li>
            <li>列表四</li>
            <li>列表五</li>
        </ul>
    </div>
    <div class="l-accordion-header l-accordion-header-downfirst">
        <div class="l-accordion-toggle l-accordion-toggle-close"></div>
        <div class="l-accordion-header-inner">列表</div>
    </div>
    <div title="" class="l-accordion-content" style="display: none; height: 225px;">
        <ul>
            <li>列表一</li>
            <li>列表二</li>
            <li>列表三</li>
            <li>列表四</li>
            <li>列表五</li>
        </ul>
    </div>
    <div class="l-accordion-header">
        <div class="l-accordion-toggle l-accordion-toggle-close"></div>
        <div class="l-accordion-header-inner">其他</div>
    </div>
    <div title="" style="padding: 10px; display: none; height: 225px;" class="l-accordion-content">
        其他内容
    </div>
</div>

<div style="display:none;">

</div>
</body>
</html>
