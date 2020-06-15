package org.nzy.order.service;

import java.util.List;

import org.nzy.order.pojo.Order;
import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbAddress;
import org.nzy.pojo.TbAssess;
import org.nzy.pojo.TbOrder;
import org.nzy.pojo.TbOrderItem;
import org.nzy.pojo.TbOrderShipping;
import org.nzy.utils.LayuiReplay;

public interface OrderService {
	FjnyResult createOrder(TbOrder order, List<TbOrderItem> orderItems, TbOrderShipping orderShipping);
	FjnyResult getAddress();
	FjnyResult getAddressByUserId(Long userid);
	FjnyResult newaddress(TbAddress address);
	FjnyResult getAddressByAddid(int addId);
	FjnyResult delAddressByAddid(int addId);
	FjnyResult updAddress(TbAddress address);
	LayuiReplay getOrder();
	FjnyResult getOrderByUserId(Long userId);
	FjnyResult getOrderByOrderId(String orderId);
	FjnyResult orderStatus(Order order);
	FjnyResult assess(TbAssess assess);
	FjnyResult getchina(int pid);
	FjnyResult getAssessByItemId(TbAssess assess);
	FjnyResult orderBack(TbOrder order, List<TbOrderItem> orderItems, TbOrderShipping orderShipping);
	LayuiReplay OrderRefund(Integer page, Integer limit);
	FjnyResult refund(String orderId,String itemId); //处理退款列表
	LayuiReplay RefundList(Integer page, Integer limit); //查询TbOrderItem 列表
	FjnyResult RevokeRefund(String orderId, String itemId); //撤销退款
	FjnyResult updateAddressOrder(TbOrderShipping tbOrdershipping, TbOrder tbOrder); //修改收货地址
	FjnyResult deleteOrder(TbOrder tbOrder, TbOrderShipping tbOrderShipping, TbOrderItem tbOrderItem); //删除订单
	LayuiReplay getOrderAll();
	LayuiReplay evaluate(Integer page, Integer limit); //评价列表
	FjnyResult deletaccess(int id); //删除评价
	FjnyResult Replyaccess(int id, String bAssess);//回复评价
	//LayuiReplay getOrder(Long orderId); //检索订单
	
}
