package com.emotion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.emotion.domainObject.EmotionType;
import com.emotion.domainObject.UserDetails;
import com.emotion.domainObject.UserMessage;
import com.emotion.service.UserDetailService;

@Controller
@RequestMapping("/Emotion")
public class EmotionController {
	
	@Autowired
	private UserDetailService userDetailService;

	@RequestMapping("/index")
	 public ModelAndView hello(HttpServletRequest request) {
		ModelAndView model=new ModelAndView("index");
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		  if (inputFlashMap != null) {
			  request.setAttribute("messageLog",(String)inputFlashMap.get("message"));  
		  }
		model.addObject("loginForm",new UserDetails());
	   return model;

	 }
	
	@RequestMapping("/registerNewUser")
	public String registerNewUser(ModelMap model){
		model.addAttribute("userForm",new UserDetails());
		return "registration";
	}
	
	@RequestMapping("/userHomePage")
	public String userHomePage(ModelMap model){
		return "home";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String saveUserRegistration(@ModelAttribute("userForm") UserDetails userDetails,final RedirectAttributes redirectAttributes){
		try{
			userDetailService.registerNewUser(userDetails);
			redirectAttributes.addFlashAttribute("message",  "success");
		}catch(Exception e){
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message",  "fail");
		}
		return "redirect:http://localhost:8080/Emotion/Emotion/index";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public  ModelAndView loginUser(HttpServletRequest request, @ModelAttribute("loginForm") UserDetails userDetails){
		ModelAndView model= null;
		UserDetails user=null;
		try{
			
			user=userDetailService.loginUser(userDetails); 
			
		}catch(Exception e){
			e.printStackTrace();
		}
		if(user!=null){
			model = new ModelAndView("home");
			request.setAttribute("userName", user.getUserName());
			request.setAttribute("userId", user.getId());
			request.setAttribute("userType", user.getUserType());
			
		}
		else{

			 model = new ModelAndView("index");
			 model.addObject("loginForm", new UserDetails());
			 request.setAttribute("errorMessage", "Invalid credentials!!");

		}
		
		return model;
	}


	@RequestMapping(value="/checkUserExists",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> checkUserExists(@RequestParam("userName")	String userName){
		Map<String,String> map=new HashMap<String, String>();
		try{
			UserDetails	userDetails=userDetailService.checkUserExists(userName); 
			map.put("userExists", "Y");
		}catch(Exception e){
			e.printStackTrace();
			map.put("userExists", "N");
		}
		
		return map;
	}
	
	@RequestMapping("/createEmotion")
	public String createEmotion(ModelMap model){
		model.addAttribute("createEmotionForm", new UserMessage());
		return "createEmotion";
	}
}
