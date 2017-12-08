package com.mankraft.bankapp.controllers;

import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;
import com.mankraft.bankapp.form.FundTransfer;
import com.mankraft.bankapp.form.TrackReference;
import com.mankraft.bankapp.jdbc.service.CustomerService;

@Component
@Controller
public class CustomerController {

	static final Logger LOGGER = Logger.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = "/customer.htm", method = RequestMethod.GET)
	public ModelAndView showCustomerRegisterPage(@ModelAttribute("customerRegister") CustomerForm customerForm) {
		return new ModelAndView("customerRegister", "command", new CustomerForm());

	}

	@RequestMapping(value = "/customerLogin.htm", method = RequestMethod.GET)
	public ModelAndView showCustomerLoginPage(@ModelAttribute("customerLogin") CustomerForm customerForm) {
		return new ModelAndView("customerLogin", "command", new CustomerForm());

	}
	
	@RequestMapping(value = "/customerHomePageView.htm", method = RequestMethod.GET)
	public ModelAndView showCustomerHomePage(@ModelAttribute("customerHomePageView") CustomerForm customerForm) {
		return new ModelAndView("customerHomePage", "command", new CustomerForm());

	}
	
	@RequestMapping(value = "/customerLoginSubmit.htm", method = RequestMethod.POST)
	public ModelAndView submitCustomerLogin(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("customerLoginSubmit") CustomerForm customerForm, BindingResult result)
			throws DataAccessException {

		Cookie ck = new Cookie("customerLoginCookie", "customerLogged");
		
		ck.setMaxAge(2592000);
		/*ck.setDomain("localhost");
		ck.setHttpOnly(true); 
		ck.setSecure(true); 
		ck.setComment("CustomerLoggin"); */
		response.addCookie(ck);
	

		boolean customerExists = false;

		try {
			customerExists = customerService.validateCustomerLogin(customerForm);
		} catch (DataAccessException e) {
			e.printStackTrace();

			LOGGER.error(" customer login error failed due to incorrect login details");
		}

		if (customerExists == true) {
			
			String userName = customerForm.getUserName();

			LOGGER.info("userName is " + userName);
		    HttpSession session= request.getSession(false);
		    session.setAttribute("userName", userName);
		    
		String customerBalance = customerService.getCustomerBalance(userName);
		session.setAttribute("accBal",customerBalance);
		    List<String> accNumber=customerService.getCustomerAccountNumbers();
			LOGGER.info("accountNumbers are  " +accNumber);
			session.setAttribute("accountNumbers", accNumber);
			
     		return new ModelAndView("customerHomePage", "command", new CustomerForm());
		}

		return new ModelAndView("customerLogin", "command", new CustomerForm());

	}

	@RequestMapping(value = "/customerSubmit.htm", method = RequestMethod.POST)
	public String submitCustomerRegister(@ModelAttribute("customerRegister") CustomerForm customerForm,
			ChangePassword changePassword, BindingResult result, HttpServletRequest request,
			HttpServletResponse response) throws DataAccessException {

		String referenceNum = null;
		try {

			referenceNum = generateReferenceNumber();

			LOGGER.info("referenceNum in controller is" + referenceNum);

			customerForm.setReferenceNumber(referenceNum);

			customerService.saveCustomer(customerForm);

			request.setAttribute("referenceNumber", referenceNum);

		} catch (DataAccessException e) {
			e.printStackTrace();

			System.out.println("customer register error: failed due to incorrect data");

		}

		return "customerRegSuccess";

	}

	@RequestMapping(value = "/trackReferenceNumberSubmit.htm", method = RequestMethod.POST)
	public String trackReferenceNumber(@ModelAttribute("trackReferenceNumber") TrackReference trackReference,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {

		customerService.trackReferenceNumber(trackReference);

		return "trackReference";

	}

	@RequestMapping(value = "/trackReferenceNumber.htm", method = RequestMethod.GET)
	public ModelAndView showTrackReferenceNumberPage(
			@ModelAttribute("trackReferenceNumber") CustomerForm customerForm) {
		return new ModelAndView("trackReference", "command", new TrackReference());

	}

	
	@RequestMapping(method = RequestMethod.GET, value = "/getaccountHolderName.htm")
	public @ResponseBody String getaccountHolderName(@RequestParam(value = "name") String accountNumber)
			throws ClassNotFoundException, SQLException {

		String accNum = accountNumber;
        String accountHolderName=null;

		try {
			accountHolderName = customerService.getAccHolderNameBasedOnAccountNumber(accNum);
		} catch (DataAccessException e) {
			e.printStackTrace();

			System.out.println("No accountHolderName is available ");
		}

		return accountHolderName;

	}
	
	@RequestMapping(value = "/customerLogout.htm", method = RequestMethod.GET)
	public ModelAndView submitCustomerLogout(HttpSession session,HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("customerLogout") CustomerForm customerForm, BindingResult result)throws DataAccessException {
		
		Cookie ck = new Cookie("customerLoginCookie", "");
		
		//Cookie[] c = request.getCookies();
		
		
		ck.setMaxAge(0);
		
		response.addCookie(ck);
		
		session.getAttribute("userName");
		session.invalidate();
		
	return null;

	}
	
	@RequestMapping(value = "/fundsTransferPage.htm", method = RequestMethod.GET)
	public ModelAndView showFundsTransferPagePage(@ModelAttribute("fundsTransferPage") FundTransfer fundTransfer) {
		return new ModelAndView("fundsTransferPage", "command", new FundTransfer());

	}
	
	
	@RequestMapping(value = "/fundTransferSubmit.htm", method = RequestMethod.POST)
	public String fundTransferSubmit(@ModelAttribute("fundTransferSubmit") FundTransfer fundTransfer,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) throws DataAccessException {

	String customerRemBalance =	customerService.fundTransferToPayee(fundTransfer); 
	
	  HttpSession session= request.getSession(false);
	 session.setAttribute("accBal", customerRemBalance);
	    

		return "redirect:/fundsTransferPage.htm";


	}
	
	private String generateReferenceNumber() {
		UUID refIdGen = UUID.randomUUID();

		long hi = refIdGen.getMostSignificantBits();
		long lo = refIdGen.getLeastSignificantBits();

		byte[] bytes = ByteBuffer.allocate(16).putLong(hi).putLong(lo).array();

		BigInteger bigInteger = new BigInteger(bytes);
		String referenceNumber = bigInteger.toString();

		String refNumber = (referenceNumber.substring(2, 6));

		return refNumber;
	}
	


}
