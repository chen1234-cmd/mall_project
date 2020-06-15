package org.nzy.utils;

public class ProductPicResultBean {
	
	private Integer error;
	private String url;
	private String message;
	public Integer getError() {
		return error;
	}
	public void setError(Integer error) {
		this.error = error;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "ProductPicResultBean [error=" + error + ", url=" + url + ", message=" + message + "]";
	}
}