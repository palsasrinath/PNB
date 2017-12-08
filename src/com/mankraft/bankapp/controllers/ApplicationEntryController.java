package com.mankraft.bankapp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Component
@Controller
@Scope("session")
public class ApplicationEntryController {
	
	static final Logger LOGGER = Logger.getLogger(ApplicationEntryController.class);
	
	
	@RequestMapping(value = {"/index.htm"}, method = RequestMethod.GET)
	public ModelAndView applicationStartup(HttpServletRequest request, HttpServletResponse response){
		
		String bank="Welcome to Manikanta Bank";
		HttpSession session=request.getSession();
		session.setAttribute("bank",bank);
		LOGGER.info("bank name is"+bank); 
		
		return new ModelAndView("index");
 		
	}
	

}
