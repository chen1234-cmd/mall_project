package org.nzy.rest.pojo;

public class ItemDetail {
	Long id;
	String title;
	String sell_point;
	String image;
	Integer num;
	double price;
	String item_desc;
	String param_data;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSell_point() {
		return sell_point;
	}
	public void setSell_point(String sell_point) {
		this.sell_point = sell_point;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getItem_desc() {
		return item_desc;
	}
	public void setItem_desc(String item_desc) {
		this.item_desc = item_desc;
	}
	public String getParam_data() {
		return param_data;
	}
	public void setParam_data(String param_data) {
		this.param_data = param_data;
	}
	@Override
	public String toString() {
		return "ItemDetail [id=" + id + ", title=" + title + ", sell_point=" + sell_point + ", image=" + image
				+ ", num=" + num + ", price=" + price + ", item_desc=" + item_desc + ", param_data=" + param_data + "]";
	}
	
}
