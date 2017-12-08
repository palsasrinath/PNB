package com.mankraft.bankapp.jdbc.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.mankraft.bankapp.form.AdminForm;
import com.mankraft.bankapp.form.AssignAccNoToCustomer;
import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;

@Service
public interface AdminService {
	
	static final Logger LOGGER = Logger.getLogger(AdminService.class);

	public void saveAdmin(AdminForm adminRegister);

	public boolean validateAdminLogin(AdminForm adminRegister);

	public String changePassword(ChangePassword changePassword, String adminId);

	public String forgotPassword(ChangePassword changePassword);
	
	public List<CustomerForm> getCustomers();
	
	public List<String> getCustomerReferenceNumbers();

	public String assignAccNoToCustomer(AssignAccNoToCustomer assignAccNoToCustomer);

	public int getadminId(AdminForm adminForm);

	public String changePassword(ChangePassword changePassword);


}
