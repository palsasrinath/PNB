package com.mankraft.bankapp.jdbc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;
import com.mankraft.bankapp.form.FundTransfer;
import com.mankraft.bankapp.form.ResetPassword;
import com.mankraft.bankapp.form.TrackReference;
import com.mankraft.bankapp.jdbc.dao.CustomerDAO;

public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDAO;

	@Autowired

	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public CustomerDAO getCustomerDAO() {
		return customerDAO;
	}

	@Override
	@Transactional
	public String saveCustomer(CustomerForm customerForm) {

		customerDAO.saveCustomer(customerForm);

		return null;

	}

	@Override
	@Transactional
	public void forgotPassword(ChangePassword changePassword) {

		customerDAO.forgotPassword(changePassword);

	}

	@Override
	public boolean validateCustomerLogin(CustomerForm customerForm) {
		return customerDAO.validateCustomerLogin(customerForm);
	}

	@Override
	public String trackReferenceNumber(TrackReference trackReference) {
		return customerDAO.trackReferenceNumber(trackReference);
	}

	@Override
	public String changePassword(ChangePassword changePassword,String customerId) {

		return customerDAO.changePassword(changePassword,customerId);
	}

	@Override
	public void resetPassword(ResetPassword resetPassword) {

	}

	@Override
	public String getcustomerId(CustomerForm customerForm) {
		return customerDAO.getcustomerId(customerForm);
	}

	@Override
	public List<String> getCustomerAccountNumbers() {
		return customerDAO.getCustomerAccountNumbers();
	}

	@Override
	public String getCustomerBalance(String userName) {

		
		
		return customerDAO.getCustomerBalance(userName); 
	}

	@Override
	public String getAccHolderNameBasedOnAccountNumber(String accountNumber) {
				
		return customerDAO.getAccHolderNameBasedOnAccountNumber(accountNumber);
		
	}

	@Override
	public String fundTransferToPayee(FundTransfer fundTransfer) {
		return customerDAO.fundTransferToPayee(fundTransfer); 
	}

}
