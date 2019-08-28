package net.yothin.goTogether.service;

import java.util.List;

import net.yothin.goTogether.model.Experience;

public interface ExperienceService {
	public void save(Experience experience);
	public Experience getById(Experience experience);
	public List<Experience> queryByNameAndPass(Experience experience);
	public void updatePass(Experience experience);
	public List<Experience> queryByPass(Experience experience);
	public List<Experience> queryByTitleAndPass(Experience experience,int pageNum);
	public int pagesNum(Experience experience);
	public void delete(Experience experience);
	public List<Experience> queryByTime(Experience experience);
	public List<Experience> queryByTitle(Experience experience);
}
