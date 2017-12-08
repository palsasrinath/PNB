package com.mankraft.bankapp.rowmapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.mankraft.bankapp.form.CustomerForm;

public class CustomerRowMapper implements RowMapper{

	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		CustomerForm customerForm = new CustomerForm();
		customerForm.setEmail(rs.getString("userName"));
		customerForm.setPassword(rs.getString("password"));
		return customerForm;
	}

}
