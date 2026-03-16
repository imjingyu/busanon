package com.BusanOn.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BusinessDTO {
	
	private String PEN_ID;
	private String USER_ID;
	private String USER_TYPE;
	private String PEN_NAME;
	private String PEN_ZIPCODE;
	private String PEN_ADDRESS;
	private String PEN_NUMBER;
	private String PEN_IMAGE;
	private String PEN_INTRODUCE;
	private String RM_NAME;
	private String RM_CHECKIN;
	private String RM_CHECKOUT;
	private String RM_RESABLE_NUM;
	private String RM_PRICE;
	private String RM_IMAGE;
	private String RES_STATUS;
	private String RM_NUM;
//	private String ROOM_ID;
	private int ROOM_ID;
	private String BOOK;
	private String OVERLAP;
	
	
	public String getUSER_TYPE() {
		return USER_TYPE;
	}
	public void setUSER_TYPE(String uSER_TYPE) {
		USER_TYPE = uSER_TYPE;
	}
	public String getRM_NUM() {
		return RM_NUM;
	}
	public void setRM_NUM(String rM_NUM) {
		RM_NUM = rM_NUM;
	}
	public int getROOM_ID() {
		return ROOM_ID;
	}
	public void setROOM_ID(int rOOM_ID) {
		ROOM_ID = rOOM_ID;
	}
	public String getPEN_ID() {
		return PEN_ID;
	}
	public void setPEN_ID(String pEN_ID) {
		PEN_ID = pEN_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getPEN_NAME() {
		return PEN_NAME;
	}
	public void setPEN_NAME(String pEN_NAME) {
		PEN_NAME = pEN_NAME;
	}
	public String getPEN_ZIPCODE() {
		return PEN_ZIPCODE;
	}
	public void setPEN_ZIPCODE(String pEN_ZIPCODE) {
		PEN_ZIPCODE = pEN_ZIPCODE;
	}
	public String getPEN_ADDRESS() {
		return PEN_ADDRESS;
	}
	public void setPEN_ADDRESS(String pEN_ADDRESS) {
		PEN_ADDRESS = pEN_ADDRESS;
	}
	public String getPEN_NUMBER() {
		return PEN_NUMBER;
	}
	public void setPEN_NUMBER(String pEN_NUMBER) {
		PEN_NUMBER = pEN_NUMBER;
	}
	public String getPEN_IMAGE() {
		return PEN_IMAGE;
	}
	public void setPEN_IMAGE(String pEN_IMAGE) {
		PEN_IMAGE = pEN_IMAGE;
	}
	public String getPEN_INTRODUCE() {
		return PEN_INTRODUCE;
	}
	public void setPEN_INTRODUCE(String pEN_INTRODUCE) {
		PEN_INTRODUCE = pEN_INTRODUCE;
	}
	public String getRM_NAME() {
		return RM_NAME;
	}
	public void setRM_NAME(String rM_NAME) {
		RM_NAME = rM_NAME;
	}
	public String getRM_CHECKIN() {
		return RM_CHECKIN;
	}
	public void setRM_CHECKIN(String rM_CHECKIN) {
		RM_CHECKIN = rM_CHECKIN;
	}
	public String getRM_CHECKOUT() {
		return RM_CHECKOUT;
	}
	public void setRM_CHECKOUT(String rM_CHECKOUT) {
		RM_CHECKOUT = rM_CHECKOUT;
	}
	public String getRM_RESABLE_NUM() {
		return RM_RESABLE_NUM;
	}
	public void setRM_RESABLE_NUM(String rM_RESABLE_NUM) {
		RM_RESABLE_NUM = rM_RESABLE_NUM;
	}

	public String getRM_IMAGE() {
		return RM_IMAGE;
	}
	public void setRM_IMAGE(String rM_IMAGE) {
		RM_IMAGE = rM_IMAGE;
	}
	
	public String getRES_STATUS() {
		return RES_STATUS;
	}
	public void setRES_STATUS(String rES_STATUS) {
		RES_STATUS = rES_STATUS;
	}
	public String getRM_PRICE() {
		return RM_PRICE;
	}
	public void setRM_PRICE(String rM_PRICE) {
		RM_PRICE = rM_PRICE;
	}
	public String getBOOK() {
		return BOOK;
	}
	public void setBOOK(String bOOK) {
		BOOK = bOOK;
	}
	public String getOVERLAP() {
		return OVERLAP;
	}
	public void setOVERLAP(String oVERLAP) {
		OVERLAP = oVERLAP;
	}
	
	

}
