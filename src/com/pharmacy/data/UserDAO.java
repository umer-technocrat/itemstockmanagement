package com.pharmacy.data;

import com.pharmacy.model.User;

public interface UserDAO {
	public void addUser(User user)
	throws Exception;
	public User getUser(String useerId)
	throws Exception;

}
// interface is used to make the blue print of the project so 
