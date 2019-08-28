package net.yothin.goTogether.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import net.sf.json.JSONObject;
import net.yothin.goTogether.model.User;
import net.yothin.goTogether.service.UserService;

@Component("userAjaxAction")
@Scope("prototype")
public class UserAjaxAction {
	private String username;
	private String phoneNum;
	private UserService userService;
	//1为已存在，0为未存在
	private int nameResult;
	private int phoneResult;
	
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
	

	
	public int getNameResult() {
		return nameResult;
	}

	public void setNameResult(int nameResult) {
		this.nameResult = nameResult;
	}

	public int getPhoneResult() {
		return phoneResult;
	}

	public void setPhoneResult(int phoneResult) {
		this.phoneResult = phoneResult;
	}

	public String checkPhoneNum() {
		User user = new User();
		user.setPhoneNum(phoneNum);
		User u=userService.getUserByPhone(user);
		if(u.getUsername()!=null){
			phoneResult=1;
		}
		else
			phoneResult=0;
		
	    return "check";
	}
	
	public String checkUsername(){
		User user = new User();
		user.setUsername(username);
		User u=userService.getUserByName(user);
		if(u.getPhoneNum()!=null)
			nameResult=1;
		else
			nameResult=0;
		
		return "check";
	}
}
