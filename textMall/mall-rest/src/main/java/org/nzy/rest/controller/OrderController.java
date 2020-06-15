package org.nzy.rest.controller;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/list/{userId}/{page}/{rows}")
	@ResponseBody
	public FjnyResult getOrderlist(@PathVariable Long userId,@PathVariable 
			int page,@PathVariable int rows) {
		System.out.println("userId:"+userId);
		return orderService.getOrderlist(userId, page, rows);
	}
	
	@RequestMapping("/info/{orderId}")
	@ResponseBody
	public FjnyResult getOrderInfo(@PathVariable Long orderId) {
		System.out.println("userId:"+orderId);
		return orderService.getOrderInfo(orderId);
	}
}
