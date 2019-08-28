package net.yothin.goTogether.dao;

import java.util.List;

import net.yothin.goTogether.model.Program;

public interface ProgramDao {
	public void save(Program program);
	public void delete(Program program);
	public List<Program> queryAll(Program program);
	public List<Program> queryByAddressByMold(Program program);
	public Program queryById(Program program);
	public List<Program> queryByLevelByMold(Program program);
	public List<Program> queryByPass(Program program);
	public List<Program> queryByName(Program program);
	public List<Program> queryByTitleAndPass(Program program,int pageNum);
	public void updatePass(Program program);
	public int pagesNum(Program program);
}
