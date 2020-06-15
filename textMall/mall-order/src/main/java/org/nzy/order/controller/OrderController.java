package org.nzy.order.controller;


import org.nzy.order.pojo.Order;
import org.nzy.order.service.OrderService;
import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbAddress;
import org.nzy.pojo.TbAssess;
import org.nzy.pojo.TbOrder;
import org.nzy.pojo.TbOrderItem;
import org.nzy.pojo.TbOrderShipping;
import org.nzy.utils.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	//订单创建
	@RequestMapping("/create")
	@ResponseBody
	public FjnyResult createOrder(@RequestBody Order order) {
		System.out.println("order:"+order.toString());
		return orderService.createOrder(order, order.getOrderItems(), order.getOrderShipping());
	}
	
	//获取收货地址信息
	@RequestMapping("/getaddress")
	@ResponseBody
	public FjnyResult getAddress() {
		return orderService.getAddress();
	}
	//根据userid获取收货地址
	@RequestMapping("/getAddressByUserId")
	@ResponseBody
	public FjnyResult getAddressByUserId(Long userid) {
		return orderService.getAddressByUserId(userid);
	}
	//根据addid获取收货地址
	@RequestMapping("/getAddressByAddid")
	@ResponseBody
	public FjnyResult getAddressByAddid(int addId) {
		return orderService.getAddressByAddid(addId);
	}
	//根据addid删除收货地址
	@RequestMapping("/delAddressByAddid")
	@ResponseBody
	public FjnyResult delAddressByAddid(int addId) {
		return orderService.delAddressByAddid(addId);
	}
	//修改收货地址
	@RequestMapping("/updAddress")
	@ResponseBody
	public FjnyResult updAddress(TbAddress address) {
		return orderService.updAddress(address);
	}
	//新建收货地址信息
	@RequestMapping("/newaddress")
	@ResponseBody
	public FjnyResult newaddress(TbAddress address) {
		return orderService.newaddress(address);
	}
	//获取全国地址信息
	@RequestMapping("/getchina")
	@ResponseBody
	public FjnyResult getchina(int pid) {
		return orderService.getchina(pid);
	}
	
	//获取全部订单
	@RequestMapping("/getOrder")
	@ResponseBody
	public LayuiReplay getOrder(Long orderId) {
		return orderService.getOrder();
	}
		
	//根据orderId获取订单
	@RequestMapping("/getOrderByUserId")
	@ResponseBody
	public FjnyResult getOrderByUserId(Long userId) {
		return orderService.getOrderByUserId(userId);
	}
	
	//根据orderId获取订单详情
	@RequestMapping("/getOrderByOrderId")
	@ResponseBody
	public FjnyResult getOrderByOrderId(String orderId) {
		return orderService.getOrderByOrderId(orderId);
	}
	
	//订单状态修改
	@RequestMapping("/orderStatus")
	@ResponseBody
	public FjnyResult orderStatus(Order order) {
		System.out.println(order.toString());
		return orderService.orderStatus(order);
	}
	//退款处理
	@RequestMapping("/orderBack")
	@ResponseBody
	public FjnyResult orderBack(@RequestBody Order order) {
	System.out.println(order.toString());
	return orderService.orderBack(order, order.getOrderItems(), order.getOrderShipping());
	}
	//买家留言
	@RequestMapping("/assess")
	@ResponseBody
	public FjnyResult assess(TbAssess assess) {
		return orderService.assess(assess);
	}
	//获取买家评价
	@RequestMapping("/getAssessByItemId")
	@ResponseBody
	public FjnyResult getAssessByItemId(TbAssess assess) {
		return orderService.getAssessByItemId(assess);
	}

	
	//根据查询退款列表
		@RequestMapping("/OrderRefund")
		@ResponseBody
		public LayuiReplay OrderRefund(@RequestParam Integer page, @RequestParam Integer limit) {
				return orderService.OrderRefund(page,limit);
		}
	//处理退款  /refund
		@RequestMapping("/refund")
		@ResponseBody
		public FjnyResult refund(String orderId,String itemId ) {
			return orderService.refund(orderId,itemId);
		}
	//查询tbOrderItem表	
		@RequestMapping("/RefundList")
		@ResponseBody
		public LayuiReplay RefundList(@RequestParam Integer page, @RequestParam Integer limit ) {
			return orderService.RefundList(page,limit);
		}
		//撤销退款
		@RequestMapping("/RevokeRefund")
		@ResponseBody
		public FjnyResult RevokeRefund(String orderId,String itemId) {
			return orderService.RevokeRefund(orderId,itemId);
		}
		//修改收货人信息
		@RequestMapping("/updateAddressOrder")
		@ResponseBody
		public FjnyResult updateAddressOrder(TbOrderShipping tbOrderShipping,TbOrder tbOrder) {
			return orderService.updateAddressOrder(tbOrderShipping,tbOrder);
		}
		//删除订单
		@RequestMapping("/deleteOrder")
		@ResponseBody
		public FjnyResult deleteOrder(TbOrder tbOrder ,TbOrderShipping tbOrderShipping ,TbOrderItem tbOrderItem) {
			return orderService.deleteOrder(tbOrder,tbOrderShipping,tbOrderItem);
		}
		//评价列表
		@RequestMapping("/evaluate")
		@ResponseBody
		public LayuiReplay evaluate(Integer page, Integer limit) {
			return orderService.evaluate(page,limit);
		}
		//删除评价
		@RequestMapping("/deletaccess")
		@ResponseBody
		public FjnyResult deletaccess(int id) {
			return orderService.deletaccess(id);
		}
		//回复评价
		@RequestMapping("/Replyaccess")
		@ResponseBody
		public FjnyResult Replyaccess(int id,String bAssess) {
			return orderService.Replyaccess(id,bAssess);
		}
}
