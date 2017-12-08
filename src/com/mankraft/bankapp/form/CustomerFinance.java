package com.mankraft.bankapp.form;

import java.io.Serializable;

import org.apache.log4j.Logger;

public class CustomerFinance implements Serializable {
	
	static final Logger LOGGER = Logger.getLogger(AdminForm.class); 
	
	private static final long serialVersionUID = 1L;
		
		private String accountBalance;
		private String demat;
		private String deposits;
		private String creditCards;
		private String loans;
		private String insurance;
		
		public String getAccountBalance() {
			return accountBalance;
		}
		public void setAccountBalance(String accountBalance) {
			this.accountBalance = accountBalance;
		}
		public String getDemat() {
			return demat;
		}
		public void setDemat(String demat) {
			this.demat = demat;
		}
		public String getDeposits() {
			return deposits;
		}
		public void setDeposits(String deposits) {
			this.deposits = deposits;
		}
		public String getCreditCards() {
			return creditCards;
		}
		public void setCreditCards(String creditCards) {
			this.creditCards = creditCards;
		}
		public String getLoans() {
			return loans;
		}
		public void setLoans(String loans) {
			this.loans = loans;
		}
		public String getInsurance() {
			return insurance;
		}
		public void setInsurance(String insurance) {
			this.insurance = insurance;
		}

}

