package org.nzy.controller;

import java.util.Date;

import org.nzy.pojo.Order;
import org.nzy.pojo.TbOrder;
import org.nzy.service.OrederService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {
	@Autowired
	private OrederService orederService;

	@RequestMapping("order/findOrderBySplitPage")
	@ResponseBody
	public LayuiReplay findOrderBySplitPage(Integer page, int limit) {
		System.out.println("查询订单列表");
		return orederService.findOrderBySplitPage(page, limit);
	}

	

	/**
	 * oreder/orderDeliver 发货填写物流单号
	 */
	@RequestMapping("oreder/orderDeliver")
	@ResponseBody
	public FjnyResult orderDeliver(TbOrder tbOrder) {
		System.out.println("controller" + tbOrder.toString());
		tbOrder.setConsignTime(new Date());
		return orederService.orderDeliver(tbOrder);

	}

	/**
	 * 删除订单 order/deleteOrder
	 */
//	@RequestMapping("order/deleteOrder")
//	@ResponseBody
//	public FjnyResult deleteOrder(TbOrder tbOrder) {
//		return orederService.deleteOrder(tbOrder);
//	}
	/**
	 * 查看订单详情 order/findOrderById
	 *//*
		 * @RequestMapping("order/findOrderById")
		 * 
		 * @ResponseBody public FjnyResult findOrderById(Order order) {
		 * System.out.println("order:"+order.toString()); return
		 * orederService.findOrderById(order,order.getOrderItems(),order.
		 * getOrderShipping()); }
		 */
}
