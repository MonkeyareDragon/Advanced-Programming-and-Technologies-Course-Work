package model;

public class Payment {
String paymentMethod;
String cardNo;
String cvcNo;
String expirationDate;
String userId;
public Payment(String paymentMethod, String cardNo, String cvcNo, String expirationDate, String userId) {
	super();
	this.paymentMethod = paymentMethod;
	this.cardNo = cardNo;
	this.cvcNo = cvcNo;
	this.expirationDate = expirationDate;
	this.userId = userId;
}
public String getPaymentMethod() {
	return paymentMethod;
}
public void setPaymentMethod(String paymentMethod) {
	this.paymentMethod = paymentMethod;
}
public String getCardNo() {
	return cardNo;
}
public void setCardNo(String cardNo) {
	this.cardNo = cardNo;
}
public String getCvcNo() {
	return cvcNo;
}
public void setCvcNo(String cvcNo) {
	this.cvcNo = cvcNo;
}
public String getExpirationDate() {
	return expirationDate;
}
public void setExpirationDate(String expirationDate) {
	this.expirationDate = expirationDate;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}



}
 