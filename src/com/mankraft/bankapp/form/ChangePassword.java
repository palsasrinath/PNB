package com.mankraft.bankapp.form;

import java.io.Serializable;

public class ChangePassword implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private String newPassword;
	private String conformPassword;
	private String oldPassword;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

}
