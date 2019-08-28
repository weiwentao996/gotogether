package net.yothin.goTogether.dao;

import java.util.List;

import net.yothin.goTogether.model.User;

public interface UserDao {
	public void save(User user);
	public boolean isExists(User user);
	//分页查询
	public List<User> getUsers(int pageNum);
	public int count();
	public User loadUserByName(User user);
	public List<User> getUserByPhone(User user);
	public List<User> getUserByName(User user);
	public void updateByName(User user);
	public void updatePass(User user);
	//冻结用户
	public void freeze(User user);
	public void delete(User user);
	/**
	 * 
	 * @param phones
	 */
	public void delAllByPhone(String[] phones); 
}
