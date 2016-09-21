package com.lakeside.user.action;

import com.youguu.core.logging.Log;
import com.youguu.core.logging.LogFactory;
import com.youguu.core.util.ParamUtil;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller("/loginAction")
public class LoginAction extends DispatchAction {
	
	private static final Log logger = LogFactory.getLog("");

	/**
	 * 用户登录
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 */
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String result = "";
		logger.debug("login start...");

		String username = ParamUtil.CheckParam(request.getParameter("username"), "");
		String password = ParamUtil.CheckParam(request.getParameter("password"), "");



		/***** 3.数据返回 ********************/
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.debug("login end...");
		return null;
	}


}
