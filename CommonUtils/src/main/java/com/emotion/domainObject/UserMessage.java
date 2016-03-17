package com.emotion.domainObject;

public class UserMessage {

	private int id;
	private int userId;
	private int emotionTypeId;
	private int messageType;
	private int seekHelp;
	private String messageText;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getEmotionTypeId() {
		return emotionTypeId;
	}
	public void setEmotionTypeId(int emotionTypeId) {
		this.emotionTypeId = emotionTypeId;
	}
	public int getMessageType() {
		return messageType;
	}
	public void setMessageType(int messageType) {
		this.messageType = messageType;
	}
	public int getSeekHelp() {
		return seekHelp;
	}
	public void setSeekHelp(int seekHelp) {
		this.seekHelp = seekHelp;
	}
	public String getMessageText() {
		return messageText;
	}
	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}
	
	
}
