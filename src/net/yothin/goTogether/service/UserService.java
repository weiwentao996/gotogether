package net.yothin.goTogether.service;

import java.util.List;

import net.yothin.goTogether.model.User;

public interface UserService {
	public void save(User user);
	public boolean isExists(User user);
	//分页查询
	public List<User> getUsers(int pageNum);
	public int pagesNum();
	public User loadUserByName(User user);
	public User getUserByPhone(User user);
	public User getUserByName(User user);
	public void updateByName(User user);
	public void updatePass(User user);
	//冻结用户
	public void freeze(User user);
	public void delete(User user);
	//批量删除
	public void delAllByPhone(String[] ids); 
}
