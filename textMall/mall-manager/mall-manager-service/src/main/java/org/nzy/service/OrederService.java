package org.nzy.service;

import java.util.List;

import org.nzy.pojo.Order;
import org.nzy.pojo.TbOrder;
import org.nzy.pojo.TbOrderItem;
import org.nzy.pojo.TbOrderShipping;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;

public interface OrederService {
	LayuiReplay findOrderBySplitPage(Integer page ,int limit);//订单列表

	FjnyResult orderDeliver(TbOrder tbOrder);//发货

	FjnyResult deleteOrder(TbOrder tbOrder); //删除订单


	//FjnyResult findOrderById(TbOrder tbOrder); //查看商品详情
}
