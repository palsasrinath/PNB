package com.mankraft.bankapp.form;

import java.io.Serializable;

import org.apache.log4j.Logger;

public class FundTransfer implements Serializable {

	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(FundTransfer.class);

	private String customer;
	private String availableBalance;
	private String accountNumber;
	private String payeeName;

	private String amountToTransfer;

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getAvailableBalance() {
		return availableBalance;
	}

	public void setAvailableBalance(String availableBalance) {
		this.availableBalance = availableBalance;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getPayeeName() {
		return payeeName;
	}

	public void setPayeeName(String payeeName) {
		this.payeeName = payeeName;
	}

	public String getAmountToTransfer() {
		return amountToTransfer;
	}

	public void setAmountToTransfer(String amountToTransfer) {
		this.amountToTransfer = amountToTransfer;
	}

}
