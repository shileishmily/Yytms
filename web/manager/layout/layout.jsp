<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    HttpSession userSession = request.getSession();
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
    <link rel="stylesheet" type="text/css" id="mylink" />
    <link href="resources/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css">
    <script src="resources/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/ligerui.all.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/plugins/ligerTab.js"></script>
    <script src="resources/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="resources/js/jquery.cookie.js"></script>
    <script src="resources/js/json2.js"></script>

    <style type="text/css">
        body, html {
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
            background: url('resources/images/topicon.gif') no-repeat 10px 5px;
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

    <script type="text/javascript">
        var tab = null;
        var accordion = null;
        var tree = null;
        var tree2 = null;
        var tabItems = [];
        var addChangePassword = "changePassword";

        $(function () {

            //加载左侧面板数据
            $.ajax({
                cache: false,
                type: "POST",
                url:"manager/sysMenu.do?method=loadAccordion",
                async: false,
                dataType:"html",
                error: function(request) {
                    alert("error");
                },
                success: function(responseHtml) {
                    $("#accordion1").html(responseHtml);
                    //遍历左侧面板，加载树对象
                    $("#accordion1 ul").each(function (i,element) {
                        loadTree(element.id);
                    });


                }
            });

            $("#layout1").ligerLayout({
                leftWidth: 190,
                height: '100%',
                heightDiff: -34,
                space: 4,
                onHeightChanged: f_heightChanged
            });

            var height = $(".l-layout-center").height();

            //Tab
            $("#framecenter").ligerTab({
                height: height,
                showSwitchInTab: true,
                showSwitch: true,
                onAfterAddTabItem: function (tabdata) {
                    tabItems.push(tabdata);
                    //saveTabStatus();
                },
                onAfterRemoveTabItem: function (tabid) {
                    for (var i = 0; i < tabItems.length; i++) {
                        var o = tabItems[i];
                        if (o.tabid == tabid) {
                            tabItems.splice(i, 1);
                            //saveTabStatus();
                            break;
                        }
                    }
                },
                onReload: function (tabdata) {
                    var tabid = tabdata.tabid;
                    addFrameSkinLink(tabid);
                }
            });

            /**
             * 修改密码
             */
            $("#changePassword").click(function () {
                if (tab.isTabItemExist(addChangePassword)) {
                    tab.selectTabItem(addChangePassword);
                    tab.reload(addChangePassword);
                } else {
                    f_addTab(addChangePassword, "修改密码", "${baseURL}/user/changePassword.do");
                }
            });

            //面板
            $("#accordion1").ligerAccordion({
                height: height - 24, speed: null
            });

            $(".l-link").hover(function () {
                $(this).addClass("l-link-over");
            }, function () {
                $(this).removeClass("l-link-over");
            });

            tab = liger.get("framecenter");
            accordion = liger.get("accordion1");
            $("#pageloading").hide();

            css_init();
        });

        function loadTree(treeId){
            var tree = $("#"+treeId).ligerTree({
                url: "manager/sysMenu.do?method=makePrivilegeTree&id="+treeId,
                checkbox: false,
                slide: false,
                nodeWidth: 120,
                attribute: ['text', 'url'],
                onSelect: function (node) {
                    if (!node.data.url) return;
                    var tabid = $(node.target).attr("tabid");
                    var url = node.data.url;
                    if(node.data.url.indexOf("?")!=-1){
                        url = url + "&menuId=" + node.data.id;
                    }else{
                        url = url + "?menuId=" + node.data.id;
                    }

                    if (!tabid) {
                        tabid = new Date().getTime();
                        $(node.target).attr("tabid", tabid);
                        f_addTab(tabid, node.data.text, url);
                    } else {
                        if (tab.isTabItemExist(tabid)) {
                            tab.selectTabItem(tabid);
                            tab.reload(tabid);
                        } else {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid);
                            f_addTab(tabid, node.data.text, url);
                        }
                    }
                },
                onAfterAppend: function () {
                    tree.expandAll();
                }
            });
        }
        function css_init() {
            var css = $("#mylink").get(0), skin = getQueryString("skin");
            $("#skinSelect").val(skin);
            $("#skinSelect").change(function () {
                if (this.value) {
                    location.href = "${baseURL}/ligerUI/index.htm?skin=" + this.value;
                } else {
                    location.href = "${baseURL}/ligerUI/index.htm";
                }
            });


            if (!css || !skin) return;
            skin = skin.toLowerCase();
            $('body').addClass("body-" + skin);
            $(css).attr("href", skin_links[skin]);
        }

        function f_heightChanged(options) {
            if (tab)
                tab.addHeight(options.diff);
            if (accordion && options.middleHeight - 24 > 0)
                accordion.setHeight(options.middleHeight - 24);
        }

        function f_addTab(tabid, text, url) {
            tab.addTabItem({
                tabid: tabid,
                text: text,
                url: url,
                callback: function () {
                    //addShowCodeBtn(tabid);
                    addFrameSkinLink(tabid);
                }
            });
        }

        var skin_links = {
            "aqua": "lib/ligerUI/skins/Aqua/css/ligerui-all.css",
            "gray": "lib/ligerUI/skins/Gray/css/all.css",
            "silvery": "lib/ligerUI/skins/Silvery/css/style.css",
            "gray2014": "lib/ligerUI/skins/gray2014/css/all.css"
        };

        function addFrameSkinLink(tabid) {
            var prevHref = getLinkPrevHref(tabid) || "";
            var skin = getQueryString("skin");
            if (!skin) return;
            skin = skin.toLowerCase();
            attachLinkToFrame(tabid, prevHref + skin_links[skin]);
        }

        function attachLinkToFrame(iframeId, filename) {
            if (!window.frames[iframeId]) return;
            var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
            var fileref = window.frames[iframeId].document.createElement("link");

            if (!fileref) return;
            fileref.setAttribute("rel", "stylesheet");
            fileref.setAttribute("type", "text/css");
            fileref.setAttribute("href", filename);
            head.appendChild(fileref);
        }

        function getLinkPrevHref(iframeId) {
            if (!window.frames[iframeId]) return;
            var head = window.frames[iframeId].document.getElementsByTagName('head').item(0);
            var links = $("link:first", head);
            for (var i = 0; links[i]; i++) {
                var href = $(links[i]).attr("href");
                if (href && href.toLowerCase().indexOf("ligerui") > 0) {
                    return href.substring(0, href.toLowerCase().indexOf("lib"));
                }
            }
        }
    </script>

</head>
<body style="padding: 0px; background: #EAEEF5;">
<div id="pageloading"></div>
<div id="topmenu" class="l-topmenu">
    <div class="l-topmenu-logo">后台管理界面</div>
    <div class="l-topmenu-welcome">
        <span style="color:white">欢迎:<%=userSession.getAttribute("uname") %></span>
        <span class="space">|</span>
        <a href="loginAction.do?method=logout" class="l-link2">退出</a>
        <span class="space">|</span>
        <a style="cursor:pointer" class="l-link2" id="changePassword">修改密码</a>
    </div>
</div>

<div id="layout1" style="width: 99.2%; margin: 0 auto; margin-top: 4px;">
    <div position="left" title="导航" id="accordion1"></div>

    <div position="center" id="framecenter">
        <div tabid="home" title="欢迎" style="height: 100%">
            <iframe frameborder="0" name="home" id="home" src="manager/layout/welcome.jsp"></iframe>
        </div>
    </div>
</div>

<div style="height: 32px; line-height: 32px; text-align: center;">
    Copyright © 2011-2014 宏宏
</div>
<div style="display: none"></div>
</body>
</html>
