package org.nzy.rest.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.nzy.mapper.TbOrderItemMapper;
import org.nzy.mapper.TbOrderMapper;
import org.nzy.mapper.TbOrderShippingMapper;
import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbOrder;
import org.nzy.pojo.TbOrderExample;
import org.nzy.pojo.TbOrderExample.Criteria;
import org.nzy.pojo.TbOrderItem;
import org.nzy.pojo.TbOrderItemExample;
import org.nzy.pojo.TbOrderShipping;
import org.nzy.rest.pojo.Order;
import org.nzy.rest.service.OrderService;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
@Service
public class OrderServiceImpl implements OrderService {

	@Resource
	private TbOrderMapper tbOrderMapper;
	
	@Resource
	private TbOrderItemMapper tbOrderItemMapper;
	
	@Resource 
	private TbOrderShippingMapper tbOrderShippingMapper;
	
	//订单列表展示
	@Override
	public FjnyResult getOrderlist(Long userId, int page, int rows) {
		TbOrderExample example = new TbOrderExample();
		PageHelper.startPage(page, rows);
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<TbOrder> list = tbOrderMapper.selectByExample(example);
		for (TbOrder tbOrder : list) {
			System.out.println(tbOrder.toString());
		}
		if(list == null||list.size() == 0) {
			FjnyResult.build(400,"无订单数据");
		}
		return FjnyResult.ok(list);
	}
	//订单详情展示
	@Override
	public FjnyResult getOrderInfo(Long orderId) {
		Order order = new Order();
		TbOrder tbOrder = tbOrderMapper.selectByPrimaryKey(orderId.toString());
		order.setOrderId(tbOrder.getOrderId());
		order.setPayment(tbOrder.getPayment());
		order.setPaymentType(tbOrder.getPaymentType());
		order.setPostFee(tbOrder.getPostFee());
		order.setStatus(tbOrder.getStatus());
		order.setCreateTime(tbOrder.getCreateTime());
		order.setUserId(tbOrder.getUserId());
		order.setBuyerMessage(tbOrder.getBuyerMessage());
		order.setBuyerNick(tbOrder.getBuyerNick());
		
		//写入TbOrderItem到order
		TbOrderItemExample example = new TbOrderItemExample();
		org.nzy.pojo.TbOrderItemExample.Criteria criteria = example.createCriteria();
		criteria.andOrderIdEqualTo(orderId.toString());
		List<TbOrderItem> tbOrderItems = tbOrderItemMapper.selectByExample(example );
		order.setOrderItems(tbOrderItems);
		
		//写入tbOrderShippingMapper到order
		TbOrderShipping tbOrderShipping = tbOrderShippingMapper.selectByPrimaryKey(orderId.toString());
		order.setOrderShipping(tbOrderShipping);
		return FjnyResult.ok(order);
	}

}
