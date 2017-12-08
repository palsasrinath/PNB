


package com.mankraft.bankapp.jdbc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;
import com.mankraft.bankapp.form.FundTransfer;
import com.mankraft.bankapp.form.TrackReference;

public class CustomerDAOImpl implements CustomerDAO {

	static final Logger LOGGER = Logger.getLogger(CustomerDAOImpl.class);

	@Autowired
	private DriverManagerDataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	/**
	 * @return the jdbcTemplate
	 */
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	/**
	 * @param jdbcTemplate
	 *            the jdbcTemplate to set
	 */
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * @return the dataSource
	 */
	public DriverManagerDataSource getDataSource() {
		return dataSource;
	}

	/**
	 * @param dataSource
	 *            the dataSource to set
	 */
	public void setDataSource(DriverManagerDataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public String saveCustomer(CustomerForm customerForm) throws DataAccessException {

		String referenceNum=customerForm.getReferenceNumber();
		 customerForm.setReferenceNumber(referenceNum); 
		
		 LOGGER.info("refNumber in dao is"+referenceNum); 

		String sql = "insert into t_customer_create(firstName,lastName,gender,email,userName,password,conformPassword,oldPassword,adhaarNumber,idProof,mobileNumber,address,city,state,country,submission_date,idNumber,referenceNumber)"
				+ "values('" + customerForm.getFirstName() + "','" + customerForm.getLastName() + "','"
				+ customerForm.getGender() + "','" + customerForm.getEmail() + "','" + customerForm.getUserName()
				+ "', '" + customerForm.getPassword() + "','" + customerForm.getConformPassword() + "','"
				+ customerForm.getConformPassword() + "','" + customerForm.getAdhaarNumber() + "','"
				+ customerForm.getIdProof() + "','" + customerForm.getMobileNumber() + "','" + customerForm.getAddress()
				+ "','" + customerForm.getCity() + "','" + customerForm.getState() + "','" + customerForm.getCountry()
				+ "',+ NOW(),'" + customerForm.getIdNumber() + "','" + customerForm.getReferenceNumber() + "')";
		LOGGER.info(sql);

		int record = jdbcTemplate.update(sql);
		
		LOGGER.info("record saved or not is"+ record);
		
		String selectCusTd= "select customer_id from t_customer_create where userName=?";
		
		int custId=jdbcTemplate.queryForObject(selectCusTd, new Object[] { customerForm.getUserName() }, Integer.class);
		String sql2="insert into customer_finance(customer_id,userName) values('"+custId+"','"+ customerForm.getUserName() +"')";
		
		LOGGER.info(sql2);

		int record2 = jdbcTemplate.update(sql2);
		
		LOGGER.info("record saved or not is"+ record2);
		

		return referenceNum;
	}

	@Override
	public void forgotPassword(ChangePassword changePassword) throws DataAccessException {

		String sql = "update  t_customer_create SET newPassword='" + changePassword.getNewPassword()
				+ "' where userName='" + changePassword.getUserName() + "'";
		LOGGER.info(sql);

		int record = jdbcTemplate.update(sql);

	}

	public String trackReferenceNumber(TrackReference trackReference) {

		String accNum = trackReference.getAccountNumber();
		String sql = "select account_number from t_customer_create where referenceNumber=?";

		String accNumber = (String) jdbcTemplate.queryForObject(sql, new Object[] { accNum }, String.class);

		return accNumber;

	}

	public boolean validateCustomerLogin(CustomerForm customerForm) {

		String sql = "SELECT count(*) from t_customer_create WHERE userName = ? and password=?";
	
		boolean customerExists = false;

		String userName = customerForm.getUserName();
		String password = customerForm.getPassword();


		int rowcount = jdbcTemplate.queryForObject(sql, new Object[] { userName, password }, Integer.class);

		LOGGER.info(rowcount);
		if (rowcount == 1) {
			return	customerExists = true;
		}
		

		return customerExists;

	}

	public String changePassword(ChangePassword changePassword,String customerId) {
		
		String newPassword=changePassword.getNewPassword();
		String confirmPassword=changePassword.getConformPassword();
		String oldPassword=changePassword.getOldPassword();
		
		String sql = "update  t_customer_create SET password= ? and conformPassword=? where oldPassword=?";
		LOGGER.info(sql);
		
		int rowcount = jdbcTemplate.queryForObject(sql, new Object[] { newPassword, confirmPassword,oldPassword }, Integer.class);
		
		LOGGER.info(rowcount);
		
		String sql2 = "update  t_customer_create SET password= '" + newPassword + "' , conformPassword='" + confirmPassword + "', oldPassword= '" + newPassword + "' ";
		
		int rowcount1 = jdbcTemplate.update(sql2);
		
		LOGGER.info(rowcount1);
		
		return "passowordChangeFailed";
	}

	@Override
	public List<String> getCustomerAccountNumbers() {
		
		String sql="select account_number from t_customer_create group by account_number";
		
		List<String> accountNumbersList = getJdbcTemplate().query(sql, new RowMapper<String>(){

			@Override
			public String mapRow(java.sql.ResultSet rs, int rowNum) throws SQLException {
				return rs.getString(1);
			}
			
					
       });
		return accountNumbersList;
	}

	@Override
	public String getcustomerId(CustomerForm customerForm) {
		return null;
	}

	@Override
	public String getCustomerBalance(String userName) {

		

		String sql3="select account_balance from customer_finance where  userName=?";
		
		LOGGER.info(sql3);

		String currentBal = (String)jdbcTemplate.queryForObject(sql3, new Object[] { userName}, String.class);
		
		return currentBal;
	}

	@Override
	public String getAccHolderNameBasedOnAccountNumber(String accountNumber) {

		
        String sql="select userName from t_customer_create where account_number=?";
		
		LOGGER.info(sql);

	    String accntHolderName = jdbcTemplate.queryForObject(sql, new Object[] { accountNumber}, String.class);
		
		return accntHolderName;
		
	}

	@Override
	public String fundTransferToPayee(FundTransfer fundTransfer) {
		
		String availBal = fundTransfer.getAvailableBalance();
		
		String amountToTransfer=fundTransfer.getAmountToTransfer();
		
		String userName =fundTransfer.getCustomer();
		
		String payeeAccntNum =fundTransfer.getAccountNumber();
		
		Integer updatedCusBalance= Integer.parseInt(availBal) - Integer.parseInt(amountToTransfer);
		
		String updatedCusBal= updatedCusBalance.toString();
		
		String sql="update customer_finance set account_balance='"+updatedCusBal+"' where userName='" + userName +"'";

		LOGGER.info(sql);

		int isCusBalUpdated = jdbcTemplate.update(sql);
		
	    //payeeBalance Update
		
        String sql3="select account_balance from customer_finance where  account_number=?";
		
		LOGGER.info(sql3);

		String payeeCurrentBal = jdbcTemplate.queryForObject(sql3, new Object[] { payeeAccntNum}, String.class);
		
		Integer payeeCurBal= Integer.parseInt(payeeCurrentBal);
		
		Integer amountTransferToPayee =Integer.parseInt(amountToTransfer);
		
		Integer totalPayeeAccountBalance = payeeCurBal+amountTransferToPayee;
		
		String payeeTotalAccountBalance= totalPayeeAccountBalance.toString();
		
		String sql2="update customer_finance set account_balance='"+payeeTotalAccountBalance+"' where account_number='" + payeeAccntNum +"'";

		LOGGER.info(sql2);

		int isPayeeBalUpdated = jdbcTemplate.update(sql2);
		
		if(isCusBalUpdated==1 && isPayeeBalUpdated==1)
		{
			return updatedCusBal;
		}
		
		
		return "transactionFailure";
	}

	
}
