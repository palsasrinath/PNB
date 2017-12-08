package com.mankraft.bankapp.jdbc.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;
import com.mankraft.bankapp.form.FundTransfer;
import com.mankraft.bankapp.form.TrackReference;

@Component
@Repository
public interface CustomerDAO {

	public String saveCustomer(CustomerForm customerForm);

	public void forgotPassword(ChangePassword changePassword);

	public boolean validateCustomerLogin(CustomerForm customerForm);

	public String trackReferenceNumber(TrackReference trackReference);

	public String changePassword(ChangePassword changePassword, String customerId);

	public String getcustomerId(CustomerForm customerForm);

	public List<String> getCustomerAccountNumbers();

	public String getCustomerBalance(String userName);
	
	public String getAccHolderNameBasedOnAccountNumber(String accountNumber);
	
	public String fundTransferToPayee(FundTransfer fundTransfer);

}
