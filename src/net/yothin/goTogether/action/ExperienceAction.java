package net.yothin.goTogether.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.yothin.goTogether.model.Experience;
import net.yothin.goTogether.service.ExperienceService;
import net.yothin.goTogether.vo.ExperienceVo;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("experienceAction")
@Scope("prototype")
public class ExperienceAction extends ActionSupport implements ModelDriven {
	
	public ExperienceVo experienceVo = new ExperienceVo();
	public Experience experience;
	public List<Experience> experiences;
	public ExperienceService experienceService;
	
	public ExperienceVo getExperienceVo() {
		return experienceVo;
	}

	public void setExperienceVo(ExperienceVo experienceVo) {
		this.experienceVo = experienceVo;
	}

	public Experience getExperience() {
		return experience;
	}

	public void setExperience(Experience experience) {
		this.experience = experience;
	}

	public List<Experience> getExperiences() {
		return experiences;
	}

	public void setExperiences(List<Experience> experiences) {
		this.experiences = experiences;
	}

	public ExperienceService getExperienceService() {
		return experienceService;
	}
	@Resource
	public void setExperienceService(ExperienceService experienceService) {
		this.experienceService = experienceService;
	}

	@Override
	public Object getModel() {
		return experienceVo;
	}
	
	/**
	 * 保存心得
	 * @return
	 */
	public String save(){
		if(ServletActionContext.getRequest().getSession().getAttribute("username")!=null){
			Date nowDate = new Date();
			Experience experience = new Experience();
			experience.setTitle(experienceVo.getTitle());
			experience.setContent(experienceVo.getContent());
			experience.setWriterName((String) ServletActionContext.getRequest().getSession().getAttribute("username"));
			experience.setWriteTime(nowDate);
			experience.setPass(0);
			this.experienceService.save(experience);
			ServletActionContext.getRequest().setAttribute("meg", "提交成功，正在等待审核...");
	        return "editSeccess";
		}
		ServletActionContext.getRequest().setAttribute("meg", "用户信息过期，请重新登录");
		return LOGIN;
	}
	
	/**
	 * 展示心得
	 * @return
	 */
	public String showById(){
		Experience experience = new Experience();
		experience.setId(experienceVo.getId());
		this.experience=experienceService.getById(experience);
		return "showExperience";
	}
	
	/**
	 * 管理心得展示
	 * @return
	 */
	public String adminShowById(){
		Experience experience = new Experience();
		experience.setId(experienceVo.getId());
		this.experience=experienceService.getById(experience);
		return "showAdminExperience";
	}
	
	/**
	 * 查询待审核的
	 * @return
	 */
	public String queryByPass(){
		Experience experience = new Experience();
		experience.setPass(0);
		this.experiences=experienceService.queryByPass(experience);
		return "adminExperience";
	}
	
	/**
	 * 审核
	 * @return
	 */
	public String updatePass(){
		Experience experience = new Experience();
		experience.setId(experienceVo.getId());
		experience.setPass(experienceVo.getPass());
		this.experienceService.updatePass(experience);
		
		experience.setPass(0);
		this.experiences=this.experienceService.queryByPass(experience);
		
		ServletActionContext.getRequest().setAttribute("meg", "审核成功！");
		return "adminExperience";
	}
	
	/**
	 * 按标题和是否通过审核查询
	 * @return
	 */
	public String queryByTitleAndPass(){
		Experience experience = new Experience();
		experience.setTitle(experienceVo.getTitle());
		experience.setPass(experienceVo.getPass());
		
		int pagesNum = this.experienceService.pagesNum(experience);
		ServletActionContext.getRequest().setAttribute("pagesNum", pagesNum);
		
		this.experiences=this.experienceService.queryByTitleAndPass(experience, experienceVo.getPageNum());
		ServletActionContext.getRequest().setAttribute("pageNum", experienceVo.getPageNum());
		return "guangli";
	}
	
	/**
	 * 用户删除
	 * @return
	 */
	public String delete(){
		Experience experience = new Experience();
		experience.setId(experienceVo.getId());
		this.experienceService.delete(experience);
		ServletActionContext.getRequest().setAttribute("meg", "删除成功！");
		ServletActionContext.getRequest().setAttribute("url", "user/userAction!getUserByName");
		return "updateSeccess";
	}
	
	/**
	 * 管理员审核时删除
	 * @return
	 */
	public String adminDelete(){
		Experience experience = new Experience();
		experience.setId(experienceVo.getId());
		this.experienceService.delete(experience);
		ServletActionContext.getRequest().setAttribute("meg", "删除成功！");
		return "adminExperience";
	}
	public String admindelete(){
		Experience experience = new Experience();
		experience.setId(experienceVo.getId());
		this.experienceService.delete(experience);
		ServletActionContext.getRequest().setAttribute("meg", "删除成功！");
		return "guangli";
	}
	
	public String queryByTime(){
		Experience experience = new Experience();
		experience.setPass(1);
		this.experiences=this.experienceService.queryByTime(experience);
		return "queryExperience";
	}
	
	public String queryByTitle(){
		Experience experience = new Experience();
		experience.setTitle(experienceVo.getTitle());
		experience.setPass(1);
		this.experiences=this.experienceService.queryByTitle(experience);
		return "queryExT";
	}
}
