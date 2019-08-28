package net.yothin.goTogether.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import net.yothin.goTogether.dao.UserDao;
import net.yothin.goTogether.model.User;
import net.yothin.goTogether.service.UserService;

@Component("userService")
public class UserServiceImpl implements UserService{
	
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void save(User user) {
		this.userDao.save(user);
	}

	@Override
	public boolean isExists(User user) {
	
		return this.userDao.isExists(user);
	}

	@Override
	public List<User> getUsers(int pageNum) {
		
		return this.userDao.getUsers(pageNum);
	}

	@Override
	public User loadUserByName(User user) {
		
		return this.userDao.loadUserByName(user);
	}

	@Override
	public void updateByName(User user) {
		this.userDao.updateByName(user);
		
	}

	@Override
	public void freeze(User user) {
		this.userDao.freeze(user);
		
	}

	@Override
	public void delete(User user) {
		this.userDao.delete(user);
		
	}
	@Override
	public User getUserByPhone(User user) {
		List<User> users = this.userDao.getUserByPhone(user);
		User u=new User();
		for(User uvo: users){
			u.setId(uvo.getId());
			u.setUsername(uvo.getUsername());
			u.setPassword(uvo.getPassword());
			u.setPhoneNum(uvo.getPhoneNum());
			u.setSex(uvo.getSex());
			u.setAge(uvo.getAge());
			u.setAddress(uvo.getAddress());
			u.setState(uvo.getState());
			u.setPro(uvo.getPro());
		}
		return u;
	}
	@Override
	public User getUserByName(User user) {
		List<User> users = this.userDao.getUserByName(user);
		User u=new User();
		for(User uvo: users){
			u.setUsername(uvo.getUsername());
			u.setPassword(uvo.getPassword());
			u.setPhoneNum(uvo.getPhoneNum());
			u.setSex(uvo.getSex());
			u.setAge(uvo.getAge());
			u.setAddress(uvo.getAddress());
			u.setState(uvo.getState());
			u.setPro(uvo.getPro());
		}
		return u;
	}
	@Override
	public void updatePass(User user) {
		this.userDao.updatePass(user);
	}
	@Override
	public int pagesNum() {
		return this.userDao.count();
		 
	}
	/**
	 * 
	 */
	@Override
	public void delAllByPhone(String[] phones) {
		this.userDao.delAllByPhone(phones);	
		
	}

}
