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

import net.yothin.goTogether.dao.UserDao;
import net.yothin.goTogether.model.User;

@Component("userDao")
public class UserDaoImpl implements UserDao{
	
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void save(User user) {
		this.hibernateTemplate.save(user);
		
	}

	@Override
	public boolean isExists(User user) {
		List<User> users = hibernateTemplate.find("from User u where u.username = '" + user.getUsername() + "'");
		List<User> users2 = hibernateTemplate.find("from User u where u.phoneNum = '" + user.getPhoneNum() + "'");
		if(users != null && users.size() > 0 && users2 != null && users2.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<User> getUsers(int pageNum) {
		final String hql = "from User";
		final int first=(pageNum-1)*10;
        List<User> userList=null;
        userList =hibernateTemplate.executeFind(new HibernateCallback(){
            @Override
            public Object doInHibernate(Session arg0)
                    throws HibernateException, SQLException {
                // TODO Auto-generated method stub
                Query query= arg0.createQuery(hql);
                query.setFirstResult(first);
                query.setMaxResults(first+10);
                List<User> list=query.list();
                return list;
            }
        });
        return userList;
	}

	@Override
	public void updateByName(User user) {
		this.hibernateTemplate.getSessionFactory()
		.getCurrentSession().createQuery("Update User u set u.age = :age,u.sex = :sex,u.address = :address where u.username = :username")
		.setInteger("age", user.getAge())
		.setString("sex", user.getSex())
		.setString("address", user.getAddress())
		.setString("username", user.getUsername()).executeUpdate();
	}

	@Override
	public void freeze(User user) {
		this.hibernateTemplate.getSessionFactory()
		.getCurrentSession().createQuery("Update User u set u.state = :state where u.phoneNum = :phoneNum")
		.setInteger("state", user.getState())
		.setString("phoneNum", user.getPhoneNum()).executeUpdate();
		
	}

	@Override
	public void delete(User user) {
		this.hibernateTemplate.getSessionFactory()
		.getCurrentSession().createQuery("Delete User u where u.phoneNum = :phoneNum")
		.setString("phoneNum", user.getPhoneNum()).executeUpdate();
	}

	@Override
	public User loadUserByName(User user) {
		return (User) this.hibernateTemplate.load(User.class,user.getId());
	}

	@Override
	public List<User> getUserByPhone(User user) {
		return (List<User>) this.hibernateTemplate.find("from User u where u.phoneNum='"+user.getPhoneNum()+"'");
	}

	@Override
	public List<User> getUserByName(User user) {
		return (List<User>) this.hibernateTemplate.find("from User u where u.username='"+user.getUsername()+"'");
	}

	@Override
	public void updatePass(User user) {
		this.hibernateTemplate.getSessionFactory()
		.getCurrentSession().createQuery("Update User u set u.password = :password where u.username = :username")
		.setString("password", user.getPassword())
		.setString("username", user.getUsername()).executeUpdate();
	}

	@Override
	public int count() {
		int i=((Long) hibernateTemplate.getSessionFactory()
		.getCurrentSession().createQuery("select count(*) from User").uniqueResult()).intValue();
		i=i%10==0?i/10:i/10+1;
		return i;
	}
	
	@Override
	public void delAllByPhone(String[] phones) {
		for(int i =0;i<phones.length;i++) {
			System.out.println("DAO层的批量删除："+phones[i]);
			this.hibernateTemplate.getSessionFactory()
			.getCurrentSession().createQuery("Delete User u where u.phoneNum = :phoneNum")
			.setString("phoneNum", phones[i]).executeUpdate();
		}
		
	}

}
