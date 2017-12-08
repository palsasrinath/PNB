package com.mankraft.bankapp.form;

import java.io.Serializable;

import org.apache.log4j.Logger;

public class TrackReference implements Serializable{
	
	static final Logger LOGGER = Logger.getLogger(TrackReference.class);

	private static final long serialVersionUID = 1L;
	
	private String accountNumber;
	private String referenceNumber;
	
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getReferenceNumber() {
		return referenceNumber;
	}
	public void setReferenceNumber(String referenceNumber) {
		this.referenceNumber = referenceNumber;
	}

}
