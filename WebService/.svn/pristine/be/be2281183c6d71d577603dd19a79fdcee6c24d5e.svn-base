package com.emotion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.emotion.dao.UserDetailDao;
import com.emotion.domainObject.EmotionType;
import com.emotion.domainObject.UserDetails;

@Service
public class UserDetailServiceImp implements UserDetailService {

	
	@Autowired
	private UserDetailDao userDetailDao;
	
	//@Override
	public boolean registerNewUser(UserDetails userDetails) {
		// TODO Auto-generated method stub
		return  userDetailDao.registerNewUser(userDetails);
	}

	public UserDetails checkUserExists(String userName) throws DataAccessException{
		// TODO Auto-generated method stub
		return userDetailDao.checkUserExists(userName);
	}

	public UserDetails loginUser(UserDetails userDetails) throws DataAccessException{
		// TODO Auto-generated method stub
		return userDetailDao.loginUser(userDetails);
	}

	public List<EmotionType> getUserEmotions(int userId) {
		// TODO Auto-generated method stub
		return userDetailDao.getUserEmotions(userId);
	}

}
