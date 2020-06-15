package org.nzy.order.pojo;

import java.util.List;

import org.nzy.pojo.TbOrder;
import org.nzy.pojo.TbOrderItem;
import org.nzy.pojo.TbOrderShipping;

public class Order extends TbOrder {

	private List<TbOrderItem> orderItems;
	private TbOrderShipping orderShipping;
	public List<TbOrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<TbOrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public TbOrderShipping getOrderShipping() {
		return orderShipping;
	}
	public void setOrderShipping(TbOrderShipping orderShipping) {
		this.orderShipping = orderShipping;
	}
	@Override
	public String toString() {
		return "Order [orderItems=" + orderItems + ", orderShipping=" + orderShipping + "]";
	}
	
	
}
