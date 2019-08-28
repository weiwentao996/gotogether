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

import net.yothin.goTogether.dao.ProgramDao;
import net.yothin.goTogether.model.Program;
import net.yothin.goTogether.model.User;

@Component("programDao")
public class ProgramDaoImpl implements ProgramDao{

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void save(Program program) {
		this.hibernateTemplate.save(program);
		
	}

	@Override
	public void delete(Program program) {
		this.hibernateTemplate.delete(program);
		
	}

	@Override
	public List<Program> queryAll(Program program) {
		
		final String hql = "from Program p where p.mold = '" + program.getMold() + "' and p.pass = '" + program.getPass() + "' order by p.writeTime desc";
        List<Program> programList=null;
        programList =hibernateTemplate.executeFind(new HibernateCallback(){
            @Override
            public Object doInHibernate(Session arg0)
                    throws HibernateException, SQLException {
                // TODO Auto-generated method stub
                Query query= arg0.createQuery(hql);
                query.setFirstResult(0);
                query.setMaxResults(18);
                List<Program> list=query.list();
                return list;
            }
        });
        return programList;
	}
	

	@Override
	public List<Program> queryByAddressByMold(Program program) {	 
		return this.hibernateTemplate.find("from Program p where p.startAddress like '%" + program.getStartAddress() + "%' and p.endAddress like '%" + program.getEndAddress() + "%' and p.mold = '" + program.getMold() + "' and p.pass = '" + program.getPass() + "'");
	}

	@Override
	public List<Program> queryByPass(Program program) {
		List<Program> programs = hibernateTemplate.find("from Program p where p.pass = '" + program.getPass() + "'");
		return programs;
	}

	@Override
	public List<Program> queryByName(Program program) {
		List<Program> programs = hibernateTemplate.find("from Program p where p.writerName = '" + program.getWriterName() + "' and p.pass = '" + program.getPass() + "'");
		return programs;
	}

	@Override
	public void updatePass(Program program) {
		this.hibernateTemplate.getSessionFactory()
		.getCurrentSession().createQuery("Update Program p set p.pass = :pass where p.id = :id")
		.setInteger("pass", program.getPass())
		.setInteger("id", program.getId()).executeUpdate();
	}
	@Override
	public Program queryById(Program program) {
		return (Program) this.hibernateTemplate.get(Program.class, program.getId());
	}
	@Override
	public List<Program> queryByLevelByMold(Program program) {
		final String hql = "from Program p where p.mold = '" + program.getMold() + "' and p.pass = '" + program.getPass() + "' order by p.writeTime desc";
        List<Program> programList=null;
        programList =hibernateTemplate.executeFind(new HibernateCallback(){
            @Override
            public Object doInHibernate(Session arg0)
                    throws HibernateException, SQLException {
                // TODO Auto-generated method stub
                Query query= arg0.createQuery(hql);
                query.setFirstResult(0);
                query.setMaxResults(9);
                List<User> list=query.list();
                return list;
            }
        });
        return programList;
	}
	@Override
	public List<Program> queryByTitleAndPass(Program program,int pageNum) {
		final String hql = "from Program p where p.title like '%" + program.getTitle() + "%' and p.pass ='" + program.getPass() + "'";
		final int first=(pageNum-1)*10;
        List<Program> programList=null;
        programList =hibernateTemplate.executeFind(new HibernateCallback(){
            @Override
            public Object doInHibernate(Session arg0)
                    throws HibernateException, SQLException {
                // TODO Auto-generated method stub
                Query query= arg0.createQuery(hql);
                query.setFirstResult(first);
                query.setMaxResults(first+10);
                List<Program> list=query.list();
                return list;
            }
        });
        return programList;
	}
	@Override
	public int pagesNum(Program program) {
		int i=((Long) hibernateTemplate.getSessionFactory()
				.getCurrentSession().createQuery("select count(*) from Program p  where p.title like '%" + program.getTitle() + "%' and p.pass ='" + program.getPass() + "'").uniqueResult()).intValue();
		i=i%10==0?i/10:i/10+1;
		return i;

	}
	
}
