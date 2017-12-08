package com.mankraft.bankapp.jdbc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mankraft.bankapp.form.AdminForm;
import com.mankraft.bankapp.form.AssignAccNoToCustomer;
import com.mankraft.bankapp.form.ChangePassword;
import com.mankraft.bankapp.form.CustomerForm;
import com.mysql.jdbc.ResultSet;

public class AdminDAOImpl implements AdminDAO {

	static final Logger LOGGER = Logger.getLogger(AdminDAOImpl.class);

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
	public int saveAdmin(AdminForm adminForm) throws DataAccessException {

		String sql = "insert into t_admin_create(firstName,lastName,email,password,gender,mobileNumber,dateofbirth,address,city,state,submission_date,update_date)  values('"
				+ adminForm.getFirstName() + "','" + adminForm.getLastName() + "','" + adminForm.getEmail() + "', '"
				+ adminForm.getPassword() + "','" + adminForm.getGender() + "','" + adminForm.getMobileNumber() + "', '"
				+ adminForm.getDateofbirth() + "','" + adminForm.getAddress() + "','" + adminForm.getCity() + "',  '"
				+ adminForm.getState() + "',+ NOW(), + NOW())";
		return jdbcTemplate.update(sql);
	}

	@Override
	public boolean validateAdminLogin(AdminForm adminForm) {

		String sql = "SELECT count(*) from t_admin_create WHERE email = ? and password=?";

		boolean userExists = false;

		String email = adminForm.getEmail();

		String password = adminForm.getPassword();

		int rowcount = jdbcTemplate.queryForObject(sql, new Object[] { email, password }, Integer.class);
		if (rowcount == 1) {
			userExists = true;
		}
		return userExists;
	}

	@Override
	public String changePassword(ChangePassword changePassword) {

		String newPassword = changePassword.getNewPassword();
		String confirmPassword = changePassword.getConformPassword();
		String oldPassword = changePassword.getOldPassword();

		String passwordChange = "passowordChangeSuccess";
		
		

		String sql = "update  t_admin_create SET password= '" + newPassword + "' , conformPassword='" + confirmPassword
				+ "' where oldPassword='" + oldPassword + "'";
		LOGGER.info(sql);

		int rowcount = jdbcTemplate.update(sql);
		
		LOGGER.info(rowcount);
		/*
		String sql2 = "update  t_admin_create SET password= '" + newPassword + "' , conformPassword='" + confirmPassword + "', oldPassword= '" + newPassword + "' ";
		LOGGER.info(sql2);

		int rowcount1 = jdbcTemplate.update(sql2);

		LOGGER.info(rowcount1);*/
		
		
		
		if (rowcount == 1) {

			String sql3 = "update t_admin_create SET oldPassword= '" + newPassword + "' where password='" + newPassword
					+ "'";
			LOGGER.info(sql3);

			int rowcount2 = jdbcTemplate.update(sql);

			return passwordChange;
		}
		return "passowordChangeFailed";
	}

	@Override
	public String forgotPassword(ChangePassword changePassword) {

		String sql = "update t_admin_create SET newPassword='" + changePassword.getNewPassword() + "' where userName='"+ changePassword.getUserName() + "'";
		
		LOGGER.info(sql);

		int record = jdbcTemplate.update(sql);

		return null;
	}

	public List<CustomerForm> getCustomers() {

		return jdbcTemplate.query(
				"select userName,account_number,mobileNumber,email,adhaarNumber,referenceNumber from t_customer_create",
				new RowMapper<CustomerForm>() {

					@Override
					public CustomerForm mapRow(java.sql.ResultSet rs, int row) throws SQLException {
						CustomerForm e = new CustomerForm();
						e.setUserName(rs.getString("userName"));
						e.setAccountNumber(rs.getString("account_number"));
						e.setMobileNumber(rs.getString("mobileNumber"));
						e.setEmail(rs.getString("email"));
						e.setAdhaarNumber(rs.getString("adhaarNumber"));
						e.setReferenceNumber(rs.getString("referenceNumber"));
						return e;
					}

				});
	}

	@Override
	public List<String> getCustomerReferenceNumbers() {
		
		//String sql="select referenceNumber from t_customer_create group by referenceNumber";
		
		String sql="select referenceNumber from t_customer_create where account_number is null";
		
		List<String> referenceNumbersList = getJdbcTemplate().query(sql, new RowMapper<String>(){

			@Override
			public String mapRow(java.sql.ResultSet rs, int rowNum) throws SQLException {
				return rs.getString(1);
			}
			
					
       });
		return referenceNumbersList;
	}

	@Override
	public String assignAccNoToCustomer(AssignAccNoToCustomer assignAccNoToCustomer) {
		
		
		
		String referenceNumber = assignAccNoToCustomer.getReferenceNumber();
		
		String selUserNameSql = "SELECT userName from t_customer_create WHERE referenceNumber = ?";


		String userName = (String)jdbcTemplate.queryForObject(selUserNameSql, new Object[] {referenceNumber}, String.class);
		
			
       String sql = "update t_customer_create set account_number='" + assignAccNoToCustomer.getAccountNumber() + "' where "
				+ "referenceNumber='" + assignAccNoToCustomer.getReferenceNumber() + "'";  

		LOGGER.info(sql);

		int record = jdbcTemplate.update(sql);
		
		String sql2="update customer_finance set account_balance=5000,account_number='"+assignAccNoToCustomer.getAccountNumber()+"' where userName='" + userName +"'";

		LOGGER.info(sql2);

		int record2 = jdbcTemplate.update(sql2);
	
		
	    return "";

	}

	@Override
	public int getadminId(AdminForm adminForm) {
		return 0;
	}

	
}
