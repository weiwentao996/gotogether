package net.yothin.goTogether.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import net.yothin.goTogether.model.Program;
import net.yothin.goTogether.service.ProgramService;
import net.yothin.goTogether.vo.ProgramVo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("programAction")
@Scope("prototype")
public class ProgramAction extends ActionSupport implements ModelDriven{
	
	public ProgramVo programVo = new ProgramVo();
	public Program program;
	public List<Program> programs;
	public ProgramService programService;
	
	public ProgramVo getProgramVo() {
		return programVo;
	}

	public void setProgramVo(ProgramVo programVo) {
		this.programVo = programVo;
	}

	public Program getProgram() {
		return program;
	}

	public void setProgram(Program program) {
		this.program = program;
	}

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
	public Object getModel() {
		return programVo;
	}
	
	/**
	 * 保存方案
	 * @return
	 * @throws IOException
	 */
	public String save() throws IOException{
		if(ServletActionContext.getRequest().getSession().getAttribute("username")!=null){
			Date nowDate = new Date();
			Program program = new Program();
			program.setWriterName((String) ServletActionContext.getRequest().getSession().getAttribute("username"));
			program.setTitle(programVo.getTitle());
			program.setWriteTime(nowDate);
			program.setCourse(programVo.getCourse());
			program.setStartAddress(programVo.getStartAddress());
			program.setEndAddress(programVo.getEndAddress());
			program.setBasicNeed(programVo.getBasicNeed());
			program.setTransType(programVo.getTransType());
			program.setCost(programVo.getCost());
			program.setMold(programVo.getMold());
			program.setWriterInfo(programVo.getWriterInfo());
			program.setLevel(0);
			program.setPass(0);
			
			String root = ServletActionContext.getServletContext().getRealPath("/upload");
	        InputStream is = new FileInputStream(programVo.getFile());
	        OutputStream os = new FileOutputStream(new File(root, program.getWriterName()+""+program.getWriteTime().getTime()+".jpg"));
	        
	        byte[] buffer = new byte[500];
	        int length = 0;
	        
	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
	        {
	            os.write(buffer);
	        }
	        os.close();
	        is.close();
	        program.setPictureUrl(program.getWriterName()+""+program.getWriteTime().getTime()+".jpg");
	        this.programService.save(program);
	        ServletActionContext.getRequest().setAttribute("meg", "提交成功，正在等待审核...");
	        return "editSeccess";
		}
		ServletActionContext.getRequest().setAttribute("meg", "用户信息过期，请重新登录");
		return LOGIN;
	}
	
	/**
	 * 删除方案
	 * @param program
	 */
	public String delete(){
		Program program = new Program();
		program.setId(programVo.getId());
		program = this.programService.queryById(program);
		this.programService.delete(program);
		File file = new File(ServletActionContext.getServletContext().getRealPath("/upload")+"/"+program.getPictureUrl());
		System.out.println("删除"+program.getPictureUrl());
		file.delete();
		ServletActionContext.getRequest().setAttribute("meg", "删除成功！");
		ServletActionContext.getRequest().setAttribute("url", "user/userAction!getUserByName");
		return "updateSeccess";
	}
	
	/**
	 * 管理员审核时删除
	 * @return
	 */
	public String adminDelete(){
		Program program = new Program();
		program.setId(programVo.getId());
		program = this.programService.queryById(program);
		this.programService.delete(program);
		File file = new File(ServletActionContext.getServletContext().getRealPath("/upload")+"/"+program.getPictureUrl());
		System.out.println("删除"+program.getPictureUrl());
		file.delete();
		ServletActionContext.getRequest().setAttribute("meg", "删除成功！");
		return "adminProgram";
	}
	
	public String admindelete(){
		Program program = new Program();
		program.setId(programVo.getId());
		program = this.programService.queryById(program);
		this.programService.delete(program);
		File file = new File(ServletActionContext.getServletContext().getRealPath("/upload")+"/"+program.getPictureUrl());
		System.out.println("删除"+program.getPictureUrl());
		file.delete();
		ServletActionContext.getRequest().setAttribute("meg", "删除成功！");
		return "guangli";
	}
	/**
	 * 查询地点
	 * @return
	 */
	public String queryByAddress(){
		Program program = new Program();
		program.setStartAddress(programVo.getStartAddress());
		program.setEndAddress(programVo.getEndAddress());
		program.setMold(programVo.getMold());
		program.setPass(1);
		programs = this.programService.queryByAddressByMold(program);
		return "queryAddPer";
	}
	
	/**
	 * 浏览方案
	 * @return
	 */
	public String queryById(){
		Program program = new Program();
		program.setId(programVo.getId());
		this.program = this.programService.queryById(program);
		return "showProgram";
	}
	public String adminQueryById(){
		Program program = new Program();
		program.setId(programVo.getId());
		this.program = this.programService.queryById(program);
		return "showProgramAdmin";
	}
	
	/**
	 * 首页展示
	 * @return
	 */
	public String queryByLevelByMold(){
		Program program = new Program();
		program.setPass(1);
		program.setMold(programVo.getMold());
		this.programs=this.programService.queryByLevelByMold(program);
		if(program.getMold().equals("personplan")){
			ServletActionContext.getRequest().setAttribute("mold", "1");
		}
		else{
			ServletActionContext.getRequest().setAttribute("mold", "2");
		}
		return "index";
	}
	
	/**
	 * 按pass查询
	 * @return
	 */
	public String queryByPass(){
		Program program = new Program();
		program.setPass(0);
		this.programs = this.programService.queryByPass(program);
		return "adminProgram";
	}
	
	/**
	 * 审核
	 * @return
	 */
	public String updatePass(){
		Program program = new Program();
		program.setId(programVo.getId());
		program.setPass(programVo.getPass());
		this.programService.pass(program);
		
		program.setPass(0);
		this.programs = this.programService.queryByPass(program);
		
		ServletActionContext.getRequest().setAttribute("meg", "审核成功！");
		return "adminProgram";
	}
	
	/**
	 * 查看方案展示
	 * @return
	 */
	public String queryAll(){
		Program program = new Program();
		program.setPass(1);
		program.setMold(programVo.getMold());
		this.programs=this.programService.queryByLevelByMold(program);
		if(program.getMold().equals("personplan")){
			ServletActionContext.getRequest().setAttribute("mold", "1");
		}
		else{
			ServletActionContext.getRequest().setAttribute("mold", "2");
		}
		return "query";
	}
	
	public String queryByTitleAndPass(){
		Program program = new Program();
		program.setTitle(programVo.getTitle());
		program.setPass(programVo.getPass());
		
		int pagesNum=programService.pagesNum(program);
		ServletActionContext.getRequest().setAttribute("pagesNum", pagesNum);
		
		this.programs=this.programService.queryByTitleAndPass(program,programVo.getPageNum());
		ServletActionContext.getRequest().setAttribute("pageNum", programVo.getPageNum());

		return "guangli";
	}
	
}
