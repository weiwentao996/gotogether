package net.yothin.goTogether.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import net.yothin.goTogether.model.Program;
import net.yothin.goTogether.service.ProgramService;

import com.opensymphony.xwork2.ActionSupport;

@Component("indexAction")
@Scope("prototype")
public class IndexAction extends ActionSupport{
	public List<Program> programs;
	public ProgramService programService;
	
	public List<Program> getPrograms() {
		return programs;
	}
	public void setPrograms(List<Program> programs) {
		this.programs = programs;
	}
	public ProgramService getProgramService() {
		return programService;
	}
	@Resource
	public void setProgramService(ProgramService programService) {
		this.programService = programService;
	}
	
	@Override
	public String execute(){
		Program program = new Program();
		program.setMold("personplan");
		program.setPass(1);
		this.programs = this.programService.queryByLevelByMold(program);
		ServletActionContext.getRequest().setAttribute("mold", "1");
		return "success";
	}
}
