package net.yothin.goTogether.dao.impl;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import net.yothin.goTogether.dao.ExperienceDao;
import net.yothin.goTogether.model.Experience;
import net.yothin.goTogether.model.Program;
import net.yothin.goTogether.model.User;

@Component("experienceDao")
public class ExperienceDaoImpl implements ExperienceDao{
	
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void save(Experience experience) {
		this.hibernateTemplate.save(experience);
	}

	@Override
	public Experience getExperienceById(Experience experience) {
		return (Experience) this.hibernateTemplate.get(Experience.class, experience.getId());
	}
	@Override
	public List<Experience> queryByNameAndPass(Experience experience) {
		List<Experience> experiences = this.hibernateTemplate.find("from Experience e where e.writerName = '" + experience.getWriterName() + "' and e.pass = '" + experience.getPass() + "'");
		return experiences;
	}
	@Override
	public void updatePass(Experience experience) {
		this.hibernateTemplate.getSessionFactory()
		.getCurrentSession().createQuery("Update Experience e set e.pass = :pass where e.id = :id")
		.setInteger("pass", experience.getPass())
		.setInteger("id", experience.getId()).executeUpdate();
	}
	@Override
	public List<Experience> queryByPass(Experience experience) {
		
		return this.hibernateTemplate.find("from Experience e where e.pass = '" + experience.getPass() + "'");
		
	}
	@Override
	public List<Experience> queryByTitleAndPass(Experience experience,int pageNum) {
		final String hql = "from Experience e where e.title like '%" + experience.getTitle() + "%' and e.pass ='" + experience.getPass() + "'";
		final int first=(pageNum-1)*10;
        List<Experience> experienceList=null;
        experienceList =hibernateTemplate.executeFind(new HibernateCallback(){
            @Override
            public Object doInHibernate(Session arg0)
                    throws HibernateException, SQLException {
                // TODO Auto-generated method stub
                Query query= arg0.createQuery(hql);
                query.setFirstResult(first);
                query.setMaxResults(first+10);
                List<Experience> list=query.list();
                return list;
            }
        });
        return experienceList;
	}
	@Override
	public void delete(Experience experience) {
		this.hibernateTemplate.delete(experience);
		
	}
	@Override
	public int pagesNum(Experience experience) {
		int i=((Long) hibernateTemplate.getSessionFactory()
				.getCurrentSession().createQuery("select count(*) from Experience e  where e.title like '%" + experience.getTitle() + "%' and e.pass ='" + experience.getPass() + "'").uniqueResult()).intValue();
		i=i%10==0?i/10:i/10+1;
		return i;
	}
	@Override
	public List<Experience> queryByTime(Experience experience) {
		final String hql = "from Experience e where e.pass = '" + experience.getPass() + "' order by e.writeTime desc";
        List<Experience> programList=null;
        programList =hibernateTemplate.executeFind(new HibernateCallback(){
            @Override
            public Object doInHibernate(Session arg0)
                    throws HibernateException, SQLException {
                // TODO Auto-generated method stub
                Query query= arg0.createQuery(hql);
                query.setFirstResult(0);
                query.setMaxResults(18);
                List<Experience> list=query.list();
                return list;
            }
        });
        return programList;
	}
	@Override
	public List<Experience> queryByTitle(Experience experience) {
		
		return this.hibernateTemplate.find("from Experience e where e.title like '%" + experience.getTitle() + "%' and e.pass ='" + experience.getPass() + "'");
		
	}
	
}
