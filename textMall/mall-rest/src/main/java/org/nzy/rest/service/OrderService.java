package org.nzy.rest.service;

import org.nzy.pojo.FjnyResult;

public interface OrderService {
	//订单列表展示
	FjnyResult getOrderlist(Long userId,int page,int rows);
	//订单详情展示
	FjnyResult getOrderInfo(Long orderId);
}
