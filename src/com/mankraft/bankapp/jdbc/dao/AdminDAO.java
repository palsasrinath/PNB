package com.mankraft.bankapp.jdbc.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mankraft.bankapp.form.AdminForm;
import com.mankraft.bankapp.form.AssignAccNoToCustomer;
import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;

@Component
@Repository
public interface AdminDAO {
	
	static final Logger LOGGER = Logger.getLogger(AdminDAO.class);

	public int saveAdmin(AdminForm adminRegister);
	
	public boolean validateAdminLogin(AdminForm adminRegister);

	public String changePassword(ChangePassword changePassword);

	public String forgotPassword(ChangePassword changePassword);


	public List<String> getCustomerReferenceNumbers();

	public List<CustomerForm> getCustomers();

	public String assignAccNoToCustomer(AssignAccNoToCustomer assignAccNoToCustomer);

	public int getadminId(AdminForm adminForm);



}
