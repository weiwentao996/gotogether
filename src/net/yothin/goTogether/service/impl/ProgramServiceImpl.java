package net.yothin.goTogether.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import net.yothin.goTogether.dao.ProgramDao;
import net.yothin.goTogether.model.Program;
import net.yothin.goTogether.service.ProgramService;

@Component("programService")
public class ProgramServiceImpl implements ProgramService{

	private ProgramDao programDao;
	
	public ProgramDao getProgramDao() {
		return programDao;
	}
	@Resource
	public void setProgramDao(ProgramDao programDao) {
		this.programDao = programDao;
	}

	@Override
	public void save(Program program) {
		this.programDao.save(program);
		
	}
	@Override
	public List<Program> queryByName(Program program) {
		return this.programDao.queryByName(program);
	}
	@Override
	public void delete(Program program) {
		this.programDao.delete(program);	
	}
	@Override
	public List<Program> queryByAddressByMold(Program program) {
		return this.programDao.queryByAddressByMold(program);
	}
	@Override
	public Program queryById(Program program) {
		return this.programDao.queryById(program);
	}
	@Override
	public List<Program> queryByLevelByMold(Program program) {
		
		return this.programDao.queryByLevelByMold(program);
	}
	@Override
	public void pass(Program program) {
		this.programDao.updatePass(program);
		
	}
	@Override
	public List<Program> queryByPass(Program program) {
		
		return this.programDao.queryByPass(program);
	}
	@Override
	public List<Program> queryAll(Program program) {
	
		return this.programDao.queryAll(program);
	}
	@Override
	public List<Program> queryByTitleAndPass(Program program,int pageNum) {
	
		return this.programDao.queryByTitleAndPass(program,pageNum);
	}
	public int pagesNum(Program program){
		return this.programDao.pagesNum(program);
	}

}
