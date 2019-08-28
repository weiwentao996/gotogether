package net.yothin.goTogether.action;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import net.yothin.goTogether.model.Experience;
import net.yothin.goTogether.model.Program;
import net.yothin.goTogether.model.User;
import net.yothin.goTogether.service.ExperienceService;
import net.yothin.goTogether.service.ProgramService;
import net.yothin.goTogether.service.UserService;
import net.yothin.goTogether.vo.UserVo;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven{
	
	private UserVo userVo = new UserVo();
	private UserService userService;
	private List<User> users;
	private User user;
	private Program program;
	private ProgramService programService;
	private List<Program> programs;
	private Experience experience;
	private ExperienceService experienceService;
	private List<Experience> experiences;
	
	public UserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Program getProgram() {
		return program;
	}

	public void setProgram(Program program) {
		this.program = program;
	}
	
	public ProgramService getProgramService() {
		return programService;
	}
	@Resource
	public void setProgramService(ProgramService programService) {
		this.programService = programService;
	}

	public List<Program> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Program> programs) {
		this.programs = programs;
	}
	
	public Experience getExperience() {
		return experience;
	}

	public void setExperience(Experience experience) {
		this.experience = experience;
	}

	public ExperienceService getExperienceService() {
		return experienceService;
	}
	@Resource
	public void setExperienceService(ExperienceService experienceService) {
		this.experienceService = experienceService;
	}

	public List<Experience> getExperiences() {
		return experiences;
	}

	public void setExperiences(List<Experience> experiences) {
		this.experiences = experiences;
	}

	/**
	 * 用户登录
	 * @return
	 */
	public String login(){
		User user=new User();
		user.setPhoneNum(userVo.getPhoneNum());
		User u=userService.getUserByPhone(user);
		int i = u.getPro();
		System.out.println("权限："+i);
		if(i == 0 ){
			if(u.getPhoneNum()!=null){
				if(userVo.getPassword().equals(u.getPassword()) && u.getState()==0){
					ServletActionContext.getRequest().getSession().setAttribute("username", u.getUsername());
					Program program = new Program();
					program.setMold("personplan");
					program.setPass(1);
					this.programs = this.programService.queryByLevelByMold(program);
					ServletActionContext.getRequest().setAttribute("mold", "1");
					return "index";
				}
				if(u.getState()==1){
					ServletActionContext.getRequest().setAttribute("meg", "登录失败，帐号被冻结");
					return LOGIN;
				}
			}
		}else if(i==1) {
			if(u.getPhoneNum()!=null){
				if(userVo.getPassword().equals(u.getPassword())){
					ServletActionContext.getRequest().getSession().setAttribute("username", u.getUsername());
					return "admin";
				}
			}
		}
		ServletActionContext.getRequest().setAttribute("meg", "登录失败，帐号或密码错误");
		return LOGIN;	
	}
	
	
	/**
	 * 管理员登录
	 * @return
	 
	public String adminLogin(){
		User user=new User();
		user.setPhoneNum(userVo.getPhoneNum());
		User u=userService.getUserByPhone(user);
		if(u.getUsername().equals("yothin")){
			if(userVo.getPassword().equals(u.getPassword())){
				return "admin";
			}
		}
		ServletActionContext.getRequest().setAttribute("meg", "登录失败，帐号或密码错误");
		return "adminLoginFail";	
	}*/
	
	/**
	 * 用户退出登录
	 * @return
	 */
	public String exit(){
		ServletActionContext.getRequest().getSession().setAttribute("username", null);
		Program program = new Program();
		program.setMold("个人方案");
		program.setPass(1);
		this.programs = this.programService.queryByLevelByMold(program);
		ServletActionContext.getRequest().setAttribute("mold", "1");
		return "index";
	}
	
	/**
	 * 用户注册
	 * @return
	 */
	public String register(){
		User user = new User();
		user.setPhoneNum(userVo.getPhoneNum());
		user.setPassword(userVo.getPassword());
		user.setUsername(userVo.getUsername());
		user.setState(0);
		if(!userService.isExists(user)){
			try{
				userService.save(user);
				ServletActionContext.getRequest().setAttribute("meg", "注册成功！");
				ServletActionContext.getRequest().setAttribute("url", "go/index");
				return "updateSeccess";
			}catch(Exception e){
				return "register";
			}
		}
		return "register";
	}
	
	/**
	 * 获取用户信息
	 * @return
	 */
	public String getUserByName(){
		if(ServletActionContext.getRequest().getSession().getAttribute("username")!=null){
			User user=new User();
			user.setUsername((String) ServletActionContext.getRequest().getSession().getAttribute("username"));
			Program program=new Program();
			program.setWriterName((String) ServletActionContext.getRequest().getSession().getAttribute("username"));
			program.setPass(userVo.getPass());
			Experience experience=new Experience();
			experience.setWriterName((String) ServletActionContext.getRequest().getSession().getAttribute("username"));
			experience.setPass(userVo.getPass2());
			
			this.user=userService.getUserByName(user);
			
			this.programs=programService.queryByName(program);
			ServletActionContext.getRequest().setAttribute("pass", program.getPass());
			
			this.experiences=experienceService.queryByNameAndPass(experience);
			ServletActionContext.getRequest().setAttribute("pass2", experience.getPass());
			return "person";
		}
		ServletActionContext.getRequest().setAttribute("meg", "用户信息过期，请重新登录");
		return LOGIN;
	}
	
	/**
	 * 修改用户信息
	 * @return
	 */
	public String editUser(){
		if(ServletActionContext.getRequest().getSession().getAttribute("username")!=null){
			User user=new User();
			user.setUsername((String) ServletActionContext.getRequest().getSession().getAttribute("username"));
			user.setAge(userVo.getAge());
			user.setSex(userVo.getSex());
			user.setAddress(userVo.getAddress());
			userService.updateByName(user);
			this.user=userService.getUserByName(user);
			return "person";
		}
		ServletActionContext.getRequest().setAttribute("meg", "用户信息过期，请重新登录");
		return LOGIN;
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	public String editPassword(){
		if(ServletActionContext.getRequest().getSession().getAttribute("username")!=null){
			User user = new User();
			user.setUsername((String) ServletActionContext.getRequest().getSession().getAttribute("username"));
			user=userService.getUserByName(user);
			if(user.getPassword().equals(userVo.getPassword())){
				user.setPassword(userVo.getPassword2());
				userService.updatePass(user);
				ServletActionContext.getRequest().setAttribute("meg", "修改成功！");
				ServletActionContext.getRequest().setAttribute("url", "user/userAction!getUserByName?pass=1");
				return "updateSeccess";
			}
			else{
				ServletActionContext.getRequest().setAttribute("meg", "原密码错误");
				return "password";
			}
		}
		ServletActionContext.getRequest().setAttribute("meg", "用户信息过期，请重新登录");
		return LOGIN;
	}
	
	
	
	/**
	 * 分页查询用户
	 * @return
	 */
	public String adminUser(){
		
		int pagesNum=userService.pagesNum();
		ServletActionContext.getRequest().setAttribute("pagesNum", pagesNum);
		
		this.users=this.userService.getUsers(userVo.getPageNum());
		ServletActionContext.getRequest().setAttribute("pageNum", userVo.getPageNum());
		return "adminUser";
	}
	
	/**
	 * 通过手机号获取用户
	 * @return
	 */
	public String getUserByPhone(){
		User user=new User();
		user.setPhoneNum(userVo.getPhoneNum());
		this.user=userService.getUserByPhone(user);
		return "adminUser2";
	}
	
	/**
	 * 冻结用户
	 * @return
	 */
	public String freeze(){
		User user = new User();
		user.setPhoneNum(userVo.getPhoneNum());
		user.setState(1);
		userService.freeze(user);
		ServletActionContext.getRequest().setAttribute("meg", "冻结成功");
		return "admin";
	}
	
	/**
	 * 解冻用户
	 * @return
	 */
	public String notFreeze(){
		User user = new User();
		user.setPhoneNum(userVo.getPhoneNum());
		user.setState(0);
		userService.freeze(user);
		ServletActionContext.getRequest().setAttribute("meg", "解冻成功");
		return "admin";
	}
	
	/**
	 * 删除用户
	 * @return
	 */
	public String delete(){
		User user = new User();
		user.setPhoneNum(userVo.getPhoneNum());
		userService.delete(user);
		ServletActionContext.getRequest().setAttribute("meg", "删除成功");
		return "admin";
	}
	
	/**
	 * 批量删除：delAllByID
	 */
	public String delAll(){
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		System.out.println("批量删除：：：：");
		
		for (int i=0;i<ids.length;i++) {
			System.err.println("用户ID："+ids[i]);
		}
		userService.delAllByPhone(ids);
		ServletActionContext.getRequest().setAttribute("meg", "批量删除成功！");
		return "admin";
	}
	
	@Override
	public Object getModel() {
		return userVo;
	}
}
