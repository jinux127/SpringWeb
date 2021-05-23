package com.jointree.trms.vo;

public class WorkplaceVO {

	//사업장 기본 정보	
	private String workplaceSeq;
	private String workplaceName;
	private String workplaceTel;
	private String workplaceStartTime;
	private String workplaceEndTime;
	private String workplaceStatus;
	private String hostSeq;
	
	//사업장 주소 정보
	private String zoneCode;
	private String roadAddress;
	private String detailAddress;
		
	//사업장 계좌 정보
	private String accountSeq;
	private String bankName;
	private String depositorName;
	private String accountNumber;
	
	//유저 ID
	private String hostId;

	public String getWorkplaceSeq() {
		return workplaceSeq;
	}

	public void setWorkplaceSeq(String workplaceSeq) {
		this.workplaceSeq = workplaceSeq;
	}

	public String getWorkplaceName() {
		return workplaceName;
	}

	public void setWorkplaceName(String workplaceName) {
		this.workplaceName = workplaceName;
	}

	public String getWorkplaceTel() {
		return workplaceTel;
	}

	public void setWorkplaceTel(String workplaceTel) {
		this.workplaceTel = workplaceTel;
	}

	public String getWorkplaceStartTime() {
		return workplaceStartTime;
	}

	public void setWorkplaceStartTime(String workplaceStartTime) {
		this.workplaceStartTime = workplaceStartTime;
	}

	public String getWorkplaceEndTime() {
		return workplaceEndTime;
	}

	public void setWorkplaceEndTime(String workplaceEndTime) {
		this.workplaceEndTime = workplaceEndTime;
	}

	public String getWorkplaceStatus() {
		return workplaceStatus;
	}

	public void setWorkplaceStatus(String workplaceStatus) {
		this.workplaceStatus = workplaceStatus;
	}

	public String getHostSeq() {
		return hostSeq;
	}

	public void setHostSeq(String hostSeq) {
		this.hostSeq = hostSeq;
	}

	public String getZoneCode() {
		return zoneCode;
	}

	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
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

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}

	public String getAccountSeq() {
		return accountSeq;
	}

	public void setAccountSeq(String accountSeq) {
		this.accountSeq = accountSeq;
	}
	
	
}
