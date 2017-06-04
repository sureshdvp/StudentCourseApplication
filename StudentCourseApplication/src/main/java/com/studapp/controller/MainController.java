package com.studapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/menu")
	
	public String showMenu(){
		return "menu";
	}
	
	@RequestMapping("/register")
	public String doRegister(){
		return "register";
	}
	@RequestMapping("/viewRegisteredStudents")
	public String viewRegisteredStudents(){
		return "viewRegisteredStudents";
	}
	
	

}
