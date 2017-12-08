package com.mankraft.bankapp.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.ResetPassword;
import com.mankraft.bankapp.jdbc.service.AdminService;
import com.mankraft.bankapp.jdbc.service.CustomerService;


@Component
@Controller
public class ForgotPasswordController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private AdminService adminService;
	
	static final Logger LOGGER = Logger.getLogger(ForgotPasswordController.class);
	
	@RequestMapping(value =  "/forgotPassword.htm" , method = RequestMethod.GET)
	public ModelAndView forgotPassword(@ModelAttribute("forgotPassword") ChangePassword changePassword) {
		return new ModelAndView("forgotPassword", "command", new ChangePassword());

	}
	
	@RequestMapping(value = "/changeFormSubmit.htm", method = RequestMethod.POST)
	public String forgetPassword(@ModelAttribute("changePassword") ChangePassword changePassword,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {

		try {
			
			adminService.forgotPassword(changePassword);
			customerService.forgotPassword(changePassword);

		} catch (DataAccessException e) {
			e.printStackTrace();

			System.out.println("customer register error: failed due to incorrect data");

		}

		return "redirect:/customer.htm";

	}
	@RequestMapping(value = "/resetFormSubmit.htm", method = RequestMethod.POST)
	public String resetPassword(@ModelAttribute("resetPassword") ResetPassword resetPassword,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {

		try {
			customerService.resetPassword(resetPassword);

		} catch (DataAccessException e) {
			e.printStackTrace();

			System.out.println("customer register error: failed due to incorrect data");

		}

		return "redirect:/customer.htm";

	}
	
	@RequestMapping(value =  "/changePasswordView.htm" , method = RequestMethod.GET)
	public ModelAndView showResetAdminPasswordView(@ModelAttribute("resetPassword") ChangePassword changePassword) {
		return new ModelAndView("changePassword", "command", new ChangePassword());

	}
	
	
	@RequestMapping(value = "/changeAdminPassword.htm", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request,HttpServletResponse response,HttpSession session,@ModelAttribute("changeAdminPassword")ChangePassword changePassword,
			BindingResult result) throws DataAccessException {

		   //String adminId=(String) session.getAttribute("adminId");
		
		   String changeAdminPassword=	adminService.changePassword(changePassword);
	
	       if(changeAdminPassword.equalsIgnoreCase("passowordChangeSuccess"))
	       {
	    	   return "changeAdminPasswordSuccess";
	       }
	  
		
		return "changePassword";
	}
	
	
	@RequestMapping(value =  "/changecustomerPasswordView.htm" , method = RequestMethod.GET)
	public ModelAndView showchangeCustomerPasswordView(@ModelAttribute("changePassword") ChangePassword changePassword) {
		return new ModelAndView("changeCustomerPassword", "command", new ChangePassword());

	}
	
	
	@RequestMapping(value = "/changeCustomerPassword.htm", method = RequestMethod.POST)
	public String changeCustomerPassword(HttpServletRequest request,HttpServletResponse response,HttpSession session,@ModelAttribute("changeCustomerPassword")ChangePassword changePassword,
			BindingResult result) throws DataAccessException {

		   String customerId=(String) session.getAttribute("customerId");
		
		   String changeCustomerPassword=	customerService.changePassword(changePassword,customerId);
	
	       if(changeCustomerPassword.equalsIgnoreCase("passowordChangeSuccess"))
	       {
	    	   return "changeCustomerPasswordSuccess";
	       }
	  
		
		return "changeCustomerPassword";
	}
}