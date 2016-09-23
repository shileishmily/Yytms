<%@ page language="java" pageEncoding="UTF-8" %>
<%@page import="com.youguu.util.ParameterUtil" %>
<%@page import="com.youguu.core.util.ParamUtil" %>
<%@page import="java.util.List" %>
<%@page import="com.youguu.user.pojo.Parameter" %>
<%@page import="com.youguu.util.AclCheck" %>
<%
    StringBuffer toolbar = new StringBuffer("");
    toolbar.append("{");
    toolbar.append("items: [");
    toolbar.append("{text: '增加', click: addData, icon: 'add'},");
    toolbar.append("{line: true},");
    toolbar.append("{text: '修改', click: updateData, icon: 'modify'},");
    toolbar.append("{line: true},");
    toolbar.append("{text: '删除', click: delData, img: 'resources/ligerUI/skins/icons/delete.gif'},");
    toolbar.append("{line: true},");
    toolbar.append("{text: '冻结', click: freezeData, icon: 'modify'},");
    toolbar.append("{line: true},");
    toolbar.append("{text: '解冻', click: unfreezeData, icon: 'modify'},");
    toolbar.append("{line: true},");
    toolbar.append("{text: '重置密码', click: resetPwdData, icon: 'modify'}");
    toolbar.append("]");
    toolbar.append("}");

    out.print(toolbar);

%>
