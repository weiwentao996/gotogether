package net.yothin.goTogether.action.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import net.yothin.goTogether.model.User;

public class PrivilegeInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		// 判断session中是否有登录用户的信息
		System.out.println("权限管理/////");
		String existUser = (String) ServletActionContext.getRequest().getSession().getAttribute("username");
		if(existUser == null){
			// 存错误信息,页面跳转到登录页面
			ActionSupport actionSupport = (ActionSupport) invocation.getAction();
			actionSupport.addActionError("您还没有登录！没有权限访问");
			return actionSupport.LOGIN;
		}else{
			// 已经登录：
			return invocation.invoke();
		}
	}

}
