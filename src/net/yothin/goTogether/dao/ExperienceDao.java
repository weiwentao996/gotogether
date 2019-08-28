package net.yothin.goTogether.dao;

import java.util.List;

import net.yothin.goTogether.model.Experience;

public interface ExperienceDao {
	public void save(Experience experience);
	public Experience getExperienceById(Experience experience);
	public List<Experience> queryByNameAndPass(Experience experience);
	public void updatePass(Experience experience);
	public List<Experience> queryByPass(Experience experience);
	public List<Experience> queryByTitleAndPass(Experience experience,int pageNum);
	public int pagesNum(Experience experience);
	public void delete(Experience experience);
	public List<Experience> queryByTime(Experience experience);
	public List<Experience> queryByTitle(Experience experience);
}
