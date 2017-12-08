package com.mankraft.bankapp.rowmapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.mankraft.bankapp.form.AdminForm;

public class AdminRowMapper implements RowMapper{

	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminForm adminRegister = new AdminForm();
		adminRegister.setEmail(rs.getString("email"));
		adminRegister.setPassword(rs.getString("password"));
		return adminRegister;
	}

}
