package com.yeong.bbs.model;

public class ErrorResponseDTO {
	
	private int errorCode;
	private String errorMsg;
	
	public ErrorResponseDTO() {
		// TODO Auto-generated constructor stub
	}

	public ErrorResponseDTO(int errorCode, String errorMsg) {
		super();
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	
	
	
}