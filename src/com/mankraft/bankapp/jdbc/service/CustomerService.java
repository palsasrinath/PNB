package com.mankraft.bankapp.jdbc.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;
import com.mankraft.bankapp.form.FundTransfer;
import com.mankraft.bankapp.form.ResetPassword;
import com.mankraft.bankapp.form.TrackReference;

@Service
public interface CustomerService {
	static final Logger LOGGER = Logger.getLogger(CustomerService.class);

	public String saveCustomer(CustomerForm customerForm);

	public void forgotPassword(ChangePassword changePassword);

	public boolean validateCustomerLogin(CustomerForm customerForm);

	public String trackReferenceNumber(TrackReference trackReference);

	public String changePassword(ChangePassword changePassword, String customerId);

	public void resetPassword(ResetPassword resetPassword);

	public String getcustomerId(CustomerForm customerForm);

	public List<String> getCustomerAccountNumbers();

	public String getCustomerBalance(String userName);
	
	public String getAccHolderNameBasedOnAccountNumber(String accountNumber);
	
	public String fundTransferToPayee(FundTransfer fundTransfer);
	
}
