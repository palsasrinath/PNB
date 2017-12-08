package com.mankraft.bankapp.form;

import java.io.Serializable;

import org.apache.log4j.Logger;

public class AssignAccNoToCustomer implements Serializable {

	static final Logger LOGGER = Logger.getLogger(AdminForm.class);

	private static final long serialVersionUID = 1L;

	private String userName;
	private String referenceNumber;
	private String accountNumber;

	public String getReferenceNumber() {
		return referenceNumber;
	}

	public void setReferenceNumber(String referenceNumber) {
		this.referenceNumber = referenceNumber;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
