package com.mankraft.bankapp.jdbctemplate;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.mankraft.bankapp.form.AdminForm;

public class AdminJdbcTemplate {

	static final Logger LOGGER = Logger.getLogger(AdminJdbcTemplate.class);

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

	/**
	 * @return the jdbcTemplateObject
	 */

	public int populateAdminRegisterData(AdminForm adminForm) throws DataAccessException {

		String firstName = adminForm.getFirstName();
		String lastName = adminForm.getLastName();
		String email = adminForm.getEmail();
		String password = adminForm.getPassword();
		String gender = adminForm.getGender();
		String mobileNumber = adminForm.getMobileNumber();
		String dateofbirth = adminForm.getDateofbirth();
		String address = adminForm.getAddress();
		String city = adminForm.getCity();
		String state = adminForm.getState();

		Date submissionDate = new Date();

		String SQL = "insert into t_admin_register(firstName,lastName,email,password,gender,mobileNumber,dateofbirth,address,city,state,submission_date) values (?,?,?,?,?,?,?,?,?,?,?)";
		int i = jdbcTemplate.update(SQL, firstName, lastName, email, password, gender, mobileNumber, dateofbirth,
				address, city, state, submissionDate);

		System.out.println("Record Inserted");

		return i;
	}

}
