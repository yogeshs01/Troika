package com.emotion.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.emotion.domainObject.UserDetails;
import com.emotion.domainObject.EmotionType;
@Repository
public class UserDetailDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public boolean registerNewUser(UserDetails userDetails) {
		// TODO Auto-generated method stub
		
		SimpleJdbcInsert sji = new SimpleJdbcInsert(jdbcTemplate)
	    .withTableName("user_tbl")
	    .usingGeneratedKeyColumns("id"); 
		
		Map<String,Object>map=new HashMap<String, Object>();
		map.put("user_name", userDetails.getUserName());
		map.put("password", userDetails.getPassword());
		String userType=userDetails.getUserType()!=""?"S":"N";
		map.put("user_type", userType);
		map.put("email_id", userDetails.getEmailId());
		int user_id=sji.executeAndReturnKey(map).intValue();
		
		if(userDetails.getEmotionIdList()!=null){
		for(Integer emotionId: userDetails.getEmotionIdList()){
		String sql= "insert into user_emotions(user_id,emotion_id) values (?,?)";
		jdbcTemplate.update(sql,user_id,emotionId );
		}
		}
		
		return true;
	}
	
	public UserDetails checkUserExists(String userName) throws DataAccessException {
		String sql="select * from user_tbl where user_name=?";
		return (UserDetails)jdbcTemplate.queryForObject(sql,new Object[]{userName}, new BeanPropertyRowMapper(UserDetails.class));
	}
	
	public UserDetails loginUser(UserDetails userDetails) throws DataAccessException {
		String sql="select * from user_tbl where user_name=? and password=?";
		return (UserDetails)jdbcTemplate.queryForObject(sql,new Object[]{userDetails.getUserName(),userDetails.getPassword()},
				new BeanPropertyRowMapper(UserDetails.class));
	}
	
	public List<EmotionType> getUserEmotions(int userId){
		String sql="select b.* from user_emotions ue "+
					" inner join emotion_type_tbl et on ue.emotion_id=et.emotion_id "+
					" where ue.user_id=?";
		
		return jdbcTemplate.queryForList(sql, EmotionType.class, userId);
	}
}
