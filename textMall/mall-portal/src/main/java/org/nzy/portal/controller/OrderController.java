package org.nzy.portal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nzy.portal.pojo.Item;
import org.nzy.portal.pojo.Order;
import org.nzy.portal.service.CarService;
import org.nzy.portal.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@Autowired
	private CarService carService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/order-show")
	public String showOrder(Double sum , HttpServletRequest request , Model model) {
		System.out.println("sum:"+sum);
		//去购物车商品列表
		List<Item> carList = carService.showCarItem(request);
		carList.size();
		model.addAttribute("carList", carList);
		model.addAttribute("sum", sum);
		return "order";
	}
	
	@RequestMapping("/create")
	public String createOrder(Order order,Model model) {
		System.out.println(order.toString());
		String orderId = orderService.create(order);
		model.addAttribute("orderId", orderId);
		model.addAttribute("payment", order.getPayment());
		return "order-success";
	}
}
