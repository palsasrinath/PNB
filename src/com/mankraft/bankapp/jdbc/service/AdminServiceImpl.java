package com.mankraft.bankapp.jdbc.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mankraft.bankapp.form.AdminForm;
import com.mankraft.bankapp.form.AssignAccNoToCustomer;
import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;
import com.mankraft.bankapp.jdbc.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	static final Logger LOGGER = Logger.getLogger(AdminServiceImpl.class);

	@Autowired
	private AdminDAO adminDAO;

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	@Transactional
	public void saveAdmin(AdminForm adminRegister) {

		adminDAO.saveAdmin(adminRegister);
		
	}

	@Override
	public boolean validateAdminLogin(AdminForm adminRegister) {
		return adminDAO.validateAdminLogin(adminRegister);
	}

	@Override
	@Transactional
	public String changePassword(ChangePassword changePassword) {
		return adminDAO.changePassword(changePassword);
	}

	@Override
	public String forgotPassword(ChangePassword changePassword) {
		return adminDAO.forgotPassword(changePassword);
		
	}

	@Override
	public List<CustomerForm> getCustomers() {
		return adminDAO.getCustomers();
	}

	@Override
	public List<String> getCustomerReferenceNumbers() {
		return adminDAO.getCustomerReferenceNumbers();
	}

	@Override
	public String assignAccNoToCustomer(AssignAccNoToCustomer assignAccNoToCustomer) {
		return adminDAO.assignAccNoToCustomer(assignAccNoToCustomer);
	}

	@Override
	public int getadminId(AdminForm adminForm) {

		return adminDAO.getadminId(adminForm);
	}

	@Override
	public String changePassword(ChangePassword changePassword, String adminId) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
