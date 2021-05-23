package com.jointree.common.vo;

import java.io.Serializable;
import java.util.List;

public class UserInfo implements Serializable{
	
	private static final long serialVersionUID = 2560896344769089139L;
	
//	유저 정보
	private String userId;
	private String password;
	private String authority;
	private boolean enabled;
	private String hostName;
	private String hostTel;
	
	
	// 계좌 정보
	private String accountSeq;
	private String bankName;
	private String depositorName;
	private String accountNumber;
	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getHostTel() {
		return hostTel;
	}
	public void setHostTel(String hostTel) {
		this.hostTel = hostTel;
	}
	
	
	
	
	public String getAccountSeq() {
		return accountSeq;
	}
	public void setAccountSeq(String accountSeq) {
		this.accountSeq = accountSeq;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getDepositorName() {
		return depositorName;
	}
	public void setDepositorName(String depositorName) {
		this.depositorName = depositorName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	
	
}
