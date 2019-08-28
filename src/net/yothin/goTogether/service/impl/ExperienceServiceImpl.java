package net.yothin.goTogether.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import net.yothin.goTogether.dao.ExperienceDao;
import net.yothin.goTogether.model.Experience;
import net.yothin.goTogether.service.ExperienceService;

@Component("experienceService")
public class ExperienceServiceImpl implements ExperienceService{
	
	public ExperienceDao experienceDao;
	
	public ExperienceDao getExperienceDao() {
		return experienceDao;
	}
	@Resource
	public void setExperienceDao(ExperienceDao experienceDao) {
		this.experienceDao = experienceDao;
	}

	@Override
	public void save(Experience experience) {
		this.experienceDao.save(experience);
	}

	@Override
	public Experience getById(Experience experience) {
		return this.experienceDao.getExperienceById(experience);
	}
	@Override
	public List<Experience> queryByNameAndPass(Experience experience) {

		return this.experienceDao.queryByNameAndPass(experience);
	}
	@Override
	public void updatePass(Experience experience) {
		this.experienceDao.updatePass(experience);
	}
	@Override
	public List<Experience> queryByPass(Experience experience) {
		return this.experienceDao.queryByPass(experience);
	}
	@Override
	public List<Experience> queryByTitleAndPass(Experience experience,
			int pageNum) {
		return this.experienceDao.queryByTitleAndPass(experience, pageNum);
	}
	@Override
	public int pagesNum(Experience experience) {
		
		return this.experienceDao.pagesNum(experience);
	}
	@Override
	public void delete(Experience experience) {
		this.experienceDao.delete(experience);
		
	}
	@Override
	public List<Experience> queryByTime(Experience experience) {
		
		return this.experienceDao.queryByTime(experience);
	}
	@Override
	public List<Experience> queryByTitle(Experience experience) {
		
		return this.experienceDao.queryByTitle(experience);
	}
	
}
