package com.mankraft.bankapp.form;

import java.io.Serializable;

public class ResetPassword implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String password;
	private String newPassword;
	private String conformPassword;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConformPassword() {
		return conformPassword;
	}
	public void setConformPassword(String conformPassword) {
		this.conformPassword = conformPassword;
	}
}
