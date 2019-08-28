package net.yothin.goTogether.service;

import java.util.List;

import net.yothin.goTogether.model.Program;

public interface ProgramService {
	public void save(Program program);
	public List<Program> queryByName(Program program);
	public List<Program> queryByAddressByMold(Program program);
	public Program queryById(Program program);
	public List<Program> queryByLevelByMold(Program program);
	public List<Program> queryByPass(Program program);
	public void delete(Program program);
	public void pass(Program program);
	public List<Program> queryAll(Program program);
	public List<Program> queryByTitleAndPass(Program program,int pageNum);
	public int pagesNum(Program program);
}
