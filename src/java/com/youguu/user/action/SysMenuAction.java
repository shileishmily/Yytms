package com.youguu.user.action;

import com.alibaba.fastjson.JSONObject;
import com.youguu.core.util.ParamUtil;
import com.youguu.ui.LigerUiToTreeJson;
import com.youguu.user.pojo.Parameter;
import com.youguu.user.service.IAclService;
import com.youguu.user.service.IParameterService;
import com.youguu.util.ParameterUtil;
import com.youguu.util.ResponseUtil;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by SomeBody on 2016/8/16.
 */
@Controller("/manager/sysMenu")
public class SysMenuAction extends DispatchAction {

    @Resource
    private IParameterService parameterService;
    @Resource
    private IAclService aclService;

    /**
     * 动态加载系统左侧面板
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward loadAccordion(ActionMapping mapping,
                                           ActionForm form, HttpServletRequest request,
                                           HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String pid = ParamUtil.CheckParam(request.getParameter("id"), "");
        Parameter p = ParameterUtil.getParameter(pid);



        String accordionStr = "<div title=\"用户权限管理\" class=\"l-scroll\"><ul id=\"00020001\" style=\"margin-top: 3px;\"/></div><div title=\"商城管理\" class=\"l-scroll\"><ul id=\"00020002\" style=\"margin-top: 3px;\"/></div>";
//        String accordionStr = "eeeeeeeeeee";
        ResponseUtil.println(response, accordionStr);
        return null;
    }

    public ActionForward makePrivilegeTree(ActionMapping mapping,
                                  ActionForm form, HttpServletRequest request,
                                  HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String pid = ParamUtil.CheckParam(request.getParameter("id"), "");
        Parameter p = ParameterUtil.getParameter(pid);

        String treeJson = LigerUiToTreeJson.getInstance().privilegeTreeJson(p, request);
        System.out.println(treeJson);
        ResponseUtil.println(response, treeJson);
        return null;
    }

    public ActionForward makeTree(ActionMapping mapping,
                                           ActionForm form, HttpServletRequest request,
                                           HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String pid = ParamUtil.CheckParam(request.getParameter("id"), "");
        Parameter p = parameterService.queryId(pid);

        String treeJson = LigerUiToTreeJson.getInstance().commonTreeJson(p, request);
        System.out.println(treeJson);
        ResponseUtil.println(response, treeJson);
        return null;
    }

    public ActionForward makeRoleModuleTree(ActionMapping mapping,
                                  ActionForm form, HttpServletRequest request,
                                  HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String pid = ParamUtil.CheckParam(request.getParameter("id"), "");
        int roleid  = ParamUtil.CheckParam(request.getParameter("roleid"), 0);
        Parameter p = parameterService.queryId(pid);
        List<String> mList = aclService.queryRoleAcl(roleid);
        String treeJson = LigerUiToTreeJson.getInstance().roleTreeJson(p, mList, request);
        System.out.println(treeJson);
        ResponseUtil.println(response, treeJson);
        return null;
    }

    /**
     * 表格
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward menuTreeList(ActionMapping mapping,
                                  ActionForm form, HttpServletRequest request,
                                  HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int posStart = ParamUtil.CheckParam(request.getParameter("posStart"), 0);
        int pageSize = ParamUtil.CheckParam(request.getParameter("pageSize"), 50);

        String gridJson = parameterService.queryTreeParameter("0002");

        ResponseUtil.println(response, gridJson);
        return null;
    }

    public ActionForward addSysModule(ActionMapping mapping,
                                    ActionForm form, HttpServletRequest request,
                                    HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String parentId = ParamUtil.CheckParam(request.getParameter("parentId"), "");
        String id = ParamUtil.CheckParam(request.getParameter("id"), "");
        String name = ParamUtil.CheckParam(request.getParameter("name"), "");
        String type = ParamUtil.CheckParam(request.getParameter("type"), "");
        String url = ParamUtil.CheckParam(request.getParameter("url"), "");
        String exp2 = ParamUtil.CheckParam(request.getParameter("exp2"), "");

        Parameter p = new Parameter();
        p.setId(id);
        p.setParentId(parentId);
        p.setName(name);
        p.setCreatetime(new Date());
        p.setUrl(url);
        p.setExp2(exp2);
        p.setType(type);

        int dbFlag = parameterService.insert(p);
        JSONObject result = new JSONObject();
        if(dbFlag>0){
            ParameterUtil.InitParameter(parameterService);
            result.put("success", true);
            result.put("message", "添加成功");
        } else{
            result.put("success", false);
            result.put("message", "添加失败");
        }
        ResponseUtil.println(response, result);
        return null;
    }

    public ActionForward loadSysModule(ActionMapping mapping,
                                     ActionForm form, HttpServletRequest request,
                                     HttpServletResponse response) throws ParseException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String id = ParamUtil.CheckParam(request.getParameter("id"), "");

        String responseText = null;
        Parameter p = parameterService.queryId(id);
        if(p!=null){
            responseText = JSONObject.toJSONString(p);
        } else {
            JSONObject result = new JSONObject();
            result.put("success", false);
            result.put("message", "未检索到该条数据");
            responseText = result.toJSONString();

        }
        ResponseUtil.println(response, responseText);
        return null;
    }

    public ActionForward updateSysModule(ActionMapping mapping,
                                      ActionForm form, HttpServletRequest request,
                                      HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String parentId = ParamUtil.CheckParam(request.getParameter("parentId"), "");
        String id = ParamUtil.CheckParam(request.getParameter("id"), "");
        String name = ParamUtil.CheckParam(request.getParameter("name"), "");
        String type = ParamUtil.CheckParam(request.getParameter("type"), "");
        String url = ParamUtil.CheckParam(request.getParameter("url"), "");
        String exp2 = ParamUtil.CheckParam(request.getParameter("exp2"), "");

        Parameter p = parameterService.queryId(id);
        p.setId(id);
        p.setParentId(parentId);
        p.setName(name);
        p.setCreatetime(new Date());
        p.setUrl(url);
        p.setExp2(exp2);
        p.setType(type);
        int dbFlag = parameterService.update(p);
        JSONObject result = new JSONObject();
        if(dbFlag>0){
            ParameterUtil.InitParameter(parameterService);
            result.put("success", true);
            result.put("message", "修改成功");
        } else{
            result.put("success", false);
            result.put("message", "修改失败");
        }
        ResponseUtil.println(response, result);
        return null;
    }

    public ActionForward delSysModule(ActionMapping mapping,
                                      ActionForm form, HttpServletRequest request,
                                      HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String id = ParamUtil.CheckParam(request.getParameter("id"), "");

        int dbFlag = parameterService.delete(id);
        JSONObject result = new JSONObject();
        if(dbFlag>0){
            ParameterUtil.InitParameter(parameterService);
            result.put("success", true);
            result.put("message", "删除成功");
        } else{
            result.put("success", false);
            result.put("message", "删除失败");
        }
        ResponseUtil.println(response, result);
        return null;
    }
}
