package com.emotion.service;

import java.util.List;

import com.emotion.domainObject.EmotionType;
import com.emotion.domainObject.UserDetails;

public interface UserDetailService {

	boolean registerNewUser(UserDetails userDetails );
	UserDetails checkUserExists(String userName);
	UserDetails loginUser(UserDetails userDetails);
	List<EmotionType> getUserEmotions(int userId);
}
