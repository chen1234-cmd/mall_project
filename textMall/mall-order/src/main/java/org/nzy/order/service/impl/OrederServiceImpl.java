package org.nzy.order.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.nzy.mapper.ChinaMapper;
import org.nzy.mapper.TbAddressMapper;
import org.nzy.mapper.TbAssessMapper;
import org.nzy.mapper.TbItemMapper;
import org.nzy.mapper.TbOrderItemMapper;
import org.nzy.mapper.TbOrderMapper;
import org.nzy.mapper.TbOrderShippingMapper;
import org.nzy.order.dao.JedisClient;
import org.nzy.order.pojo.Assess;
import org.nzy.order.pojo.Order;
import org.nzy.order.service.OrderService;
import org.nzy.pojo.China;
import org.nzy.pojo.ChinaExample;
import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbAddress;
import org.nzy.pojo.TbAddressExample;
import org.nzy.pojo.TbAssess;
import org.nzy.pojo.TbAssessExample;
import org.nzy.pojo.TbItem;
import org.nzy.pojo.TbItemExample;
import org.nzy.pojo.TbOrder;
import org.nzy.pojo.TbOrderExample;
import org.nzy.pojo.TbOrderExample.Criteria;
import org.nzy.pojo.TbOrderItem;
import org.nzy.pojo.TbOrderItemExample;
import org.nzy.pojo.TbOrderShipping;
import org.nzy.pojo.TbOrderShippingExample;
import org.nzy.utils.LayuiReplay;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service
public class OrederServiceImpl implements OrderService {
	
	@Resource
	private TbOrderMapper tbOrderMapper;
	
	@Resource
	private TbOrderItemMapper tbOrderItemMapper;
	
	@Resource
	private TbOrderShippingMapper tbOrderShippingMapper;
	
	@Resource
	private TbAssessMapper tbAssessMapper; 
	
	@Resource
	private JedisClient jedisClient;
	
	@Resource
	private TbAddressMapper tbAddressMapper;
	
	@Resource
	private TbItemMapper tbItemMapper;
	
	@Resource
	private ChinaMapper chinaMapper;
	
	@Override
	public FjnyResult createOrder(TbOrder order, List<TbOrderItem> orderItems, TbOrderShipping orderShipping) {
		
		//添加订单
		//获取订单号
		
		String string = jedisClient.get("ORDER_GEN_KEY");
		if(StringUtils.isBlank(string)) {
			jedisClient.set("ORDER_GEN_KEY", "100000");
		}else {
			 jedisClient.incr("ORDER_GEN_KEY");
		}
		String orderId = jedisClient.get("ORDER_GEN_KEY");
		//补全pojo的属性
		order.setOrderId(orderId);
		//状态：1、未付款2、已付款3、未发货4、已发货5、交易成功6、交易关闭
		order.setStatus(1);
		Date date = new Date();
		order.setUpdateTime(date);
		order.setCreateTime(date);
		//0、未评价1、已评价
		order.setBuyerRate(0);
		tbOrderMapper.insert(order);
		//添加订单明细表
		for (TbOrderItem tbOrderItem : orderItems) {
			//补全订单明细
			//取得明细id
			jedisClient.incr("ORDER_DETAIL_GEN_KEY");
			String orderDetailId = jedisClient.get("ORDER_DETAIL_GEN_KEY");
			tbOrderItem.setId(orderDetailId);
			tbOrderItem.setOrderId(orderId);
			//插入数据库表
			tbOrderItemMapper.insert(tbOrderItem);
		}
		//插入物流表
		//补全物流表的属性
		orderShipping.setOrderId(orderId);
		orderShipping.setCreated(date);
		orderShipping.setUpdated(date);
		//插入数据库
		tbOrderShippingMapper.insert(orderShipping);
		return FjnyResult.ok(orderId);
	}
//获取收货地址
	@Override
	public FjnyResult getAddress() {
		List<TbAddress> list = tbAddressMapper.selectByExample(null);
		if(list.size()>0) {
			return FjnyResult.ok(list);
		}
		return FjnyResult.build(500,"未设置过地址");
	}
//根据userid获取收货地址
	@Override
	public FjnyResult getAddressByUserId(Long userid) {
		TbAddressExample example = new TbAddressExample();
		example.createCriteria().andUseridEqualTo(userid);
		List<TbAddress> list = tbAddressMapper.selectByExample(example);
		if(list.size()>0) {
			return FjnyResult.ok(list);
		}
		return FjnyResult.build(500,"未找到该地址");
	}
	
//根据addid获取收货地址
	@Override
	public FjnyResult getAddressByAddid(int addId) {
		TbAddressExample example = new TbAddressExample();
		example.createCriteria().andAddIdEqualTo(addId);
		List<TbAddress> list = tbAddressMapper.selectByExample(example);
		if(list.size()>0) {
			return FjnyResult.ok(list);
		}
		return FjnyResult.build(500,"未找到该地址");
	}
	@Override
	public FjnyResult delAddressByAddid(int addId) {
		TbAddressExample example = new TbAddressExample();
		example.createCriteria().andAddIdEqualTo(addId);
		int i = tbAddressMapper.deleteByExample(example);
		if(i>0) {
			return FjnyResult.ok();
		}else {
			return FjnyResult.build(500, "删除失败");
		}
		
	}
//添加收货地址
	@Override
	public FjnyResult newaddress(TbAddress address) {
		Integer status = address.getStatus();
		if(status==1) {
			TbAddressExample example = new TbAddressExample();
			TbAddress address1 = new TbAddress();
			address1.setStatus(0);
			tbAddressMapper.updateByExampleSelective(address1 , example);
		}
		int i = tbAddressMapper.insertSelective(address);
		if(i>0) {
			return FjnyResult.ok();
		}else {
			return FjnyResult.build(500, "新建地址失败");
		}
		
	}
//修改收货地址
	@Override
	public FjnyResult updAddress(TbAddress address) {
		Integer status = address.getStatus();
		if(status==1) {
			TbAddressExample example = new TbAddressExample();
			TbAddress address1 = new TbAddress();
			address1.setStatus(0);
			tbAddressMapper.updateByExampleSelective(address1 , example);
		}
		TbAddressExample example1 = new TbAddressExample();
		example1.createCriteria().andAddIdEqualTo(address.getAddId());
		int i = tbAddressMapper.updateByExampleSelective(address, example1);
		if(i>0) {
			return FjnyResult.ok();
		}else {
			return FjnyResult.build(500, "修改地址失败");
		}
	}
//获取全国地址
	@Override
	public FjnyResult getchina(int pid) {
		ChinaExample example = new ChinaExample();
		example.createCriteria().andPidEqualTo(pid);
		List<China> list = chinaMapper.selectByExample(example);
		if(list.size()>0) {
			return FjnyResult.ok(list);
		}
		return FjnyResult.build(500,"参数错误");
	}
//获取全部订单
	@Override
	public LayuiReplay getOrder() {
		List<TbOrder> orderList = tbOrderMapper.selectByExample(null);
		List<Order> orders = new ArrayList<Order>();
		for (TbOrder order : orderList) {
			Order order1 = new Order();
			order1.setOrderId(order.getOrderId());
			order1.setPayment(order.getPayment());
			order1.setPaymentType(order.getPaymentType());
			order1.setPostFee(order.getPostFee());
			order1.setStatus(order.getStatus());
			order1.setCreateTime(order.getCreateTime());
			order1.setUpdateTime(order.getUpdateTime());
			order1.setPaymentTime(order.getPaymentTime());
			order1.setConsignTime(order.getConsignTime());
			order1.setEndTime(order.getEndTime());
			order1.setCloseTime(order.getCloseTime());
			order1.setShippingName(order.getShippingName());
			order1.setShippingCode(order.getShippingCode());
			order1.setUserId(order.getUserId());
			order1.setBuyerMessage(order.getBuyerMessage());
			order1.setBuyerNick(order.getBuyerNick());
			order1.setBuyerRate(order.getBuyerRate());
			//订单商品
			TbOrderItemExample example1 = new TbOrderItemExample();
			example1.createCriteria().andOrderIdEqualTo(order.getOrderId());
			List<TbOrderItem> orderItems = tbOrderItemMapper.selectByExample(example1);
			order1.setOrderItems(orderItems);	
			//订单收货人信息
			TbOrderShippingExample example2 = new TbOrderShippingExample();
			example2.createCriteria().andOrderIdEqualTo(order.getOrderId());
			List<TbOrderShipping> ordershipping =  tbOrderShippingMapper.selectByExample(example2);
			order1.setOrderShipping(ordershipping.get(0));
			orders.add(order1);
		}
		return LayuiReplay.ok(orders);
	}
//获取订单
	@Override
	public FjnyResult getOrderByUserId(Long userId) {
		TbOrderExample example = new TbOrderExample();
		example.createCriteria().andUserIdEqualTo(userId);
		List<TbOrder> orderList = tbOrderMapper.selectByExample(example);
		List<Order> orders = new ArrayList<Order>();
		for (TbOrder order : orderList) {
			Order order1 = new Order();
			order1.setOrderId(order.getOrderId());
			order1.setPayment(order.getPayment());
			order1.setPaymentType(order.getPaymentType());
			order1.setPostFee(order.getPostFee());
			order1.setStatus(order.getStatus());
			order1.setCreateTime(order.getCreateTime());
			order1.setUpdateTime(order.getUpdateTime());
			order1.setPaymentTime(order.getPaymentTime());
			order1.setConsignTime(order.getConsignTime());
			order1.setEndTime(order.getEndTime());
			order1.setCloseTime(order.getCloseTime());
			order1.setShippingName(order.getShippingName());
			order1.setShippingCode(order.getShippingCode());
			order1.setUserId(order.getUserId());
			order1.setBuyerMessage(order.getBuyerMessage());
			order1.setBuyerNick(order.getBuyerNick());
			order1.setBuyerRate(order.getBuyerRate());
			//订单商品
			TbOrderItemExample example1 = new TbOrderItemExample();
			example1.createCriteria().andOrderIdEqualTo(order.getOrderId());
			List<TbOrderItem> orderItems = tbOrderItemMapper.selectByExample(example1);
			order1.setOrderItems(orderItems);	
			//订单收货人信息
			TbOrderShippingExample example2 = new TbOrderShippingExample();
			example2.createCriteria().andOrderIdEqualTo(order.getOrderId());
			List<TbOrderShipping> ordershipping =  tbOrderShippingMapper.selectByExample(example2);
			order1.setOrderShipping(ordershipping.get(0));
			orders.add(order1);
		}
		return FjnyResult.ok(orders);
	}
	//根据orderId获取订单详情
	@Override
	public FjnyResult getOrderByOrderId(String orderId) {
		TbOrderExample example = new TbOrderExample();
		example.createCriteria().andOrderIdEqualTo(orderId);
		List<TbOrder> order2 = tbOrderMapper.selectByExample(example);
		TbOrder order = order2.get(0);
		Order order1 = new Order();
		order1.setOrderId(order.getOrderId());
		order1.setPayment(order.getPayment());
		order1.setPaymentType(order.getPaymentType());
		order1.setPostFee(order.getPostFee());
		order1.setStatus(order.getStatus());
		order1.setCreateTime(order.getCreateTime());
		order1.setUpdateTime(order.getUpdateTime());
		order1.setPaymentTime(order.getPaymentTime());
		order1.setConsignTime(order.getConsignTime());
		order1.setEndTime(order.getEndTime());
		order1.setCloseTime(order.getCloseTime());
		order1.setShippingName(order.getShippingName());
		order1.setShippingCode(order.getShippingCode());
		order1.setUserId(order.getUserId());
		order1.setBuyerMessage(order.getBuyerMessage());
		order1.setBuyerNick(order.getBuyerNick());
		order1.setBuyerRate(order.getBuyerRate());
		//订单商品
		TbOrderItemExample example1 = new TbOrderItemExample();
		example1.createCriteria().andOrderIdEqualTo(orderId);
		List<TbOrderItem> orderItems = tbOrderItemMapper.selectByExample(example1);
		order1.setOrderItems(orderItems);	
		//订单收货人信息
		TbOrderShippingExample example2 = new TbOrderShippingExample();
		example2.createCriteria().andOrderIdEqualTo(orderId);
		List<TbOrderShipping> ordershipping =  tbOrderShippingMapper.selectByExample(example2);
		order1.setOrderShipping(ordershipping.get(0));
		return FjnyResult.ok(order1);
	}
	//订单状态修改
	@Override
	public FjnyResult orderStatus(Order order) {

		TbOrderExample arg1 = new TbOrderExample();
		arg1.createCriteria().andOrderIdEqualTo(order.getOrderId());
		Date date = new Date();
		order.setUpdateTime(date);
		int i = tbOrderMapper.updateByExampleSelective(order, arg1);
		if(i>0) {
			return FjnyResult.ok();
		}
		return FjnyResult.build(500, "未完成！");
	}
	//退款申请
	@Override
	public FjnyResult orderBack(TbOrder order, List<TbOrderItem> orderItems, TbOrderShipping orderShipping) {
		TbOrderExample arg1 = new TbOrderExample();
		arg1.createCriteria().andOrderIdEqualTo(order.getOrderId());
		Date date = new Date();
		order.setUpdateTime(date);
		int i = tbOrderMapper.updateByExampleSelective(order, arg1);
		
		for (TbOrderItem tbOrderItem : orderItems) {
			TbOrderItemExample example = new TbOrderItemExample();
			example.createCriteria().andOrderIdEqualTo(order.getOrderId()).andItemIdEqualTo(tbOrderItem.getItemId());
			tbOrderItem.setStatus(1);
			tbOrderItemMapper.updateByExampleSelective(tbOrderItem, example);
		}
		if(i>0) {
			return FjnyResult.ok();
		}
		return FjnyResult.build(500, "未完成！");
	}
	//买家留言
	@Override
	public FjnyResult assess(TbAssess assess) {
		int i = tbAssessMapper.insertSelective(assess);
		if(i>0) {
			TbOrderExample example = new TbOrderExample();
			example.createCriteria().andOrderIdEqualTo(assess.getOrderid());
			TbOrder record = new TbOrder();
			record.setBuyerRate(1);
			tbOrderMapper.updateByExampleSelective(record , example);
			return FjnyResult.ok();
		}else {
			return FjnyResult.build(500, "留言未完成");
		}
		
	}
	//获取买家评价
	@Override
	public FjnyResult getAssessByItemId(TbAssess assess) {
		TbAssessExample example = new TbAssessExample();
		example.createCriteria().andItemidEqualTo(assess.getItemid());
		List<TbAssess> list = tbAssessMapper.selectByExample(example);
		if(list.size()>0) {
			return FjnyResult.ok(list);
		}
		return FjnyResult.build(500,"没找到该商品的评论");
	}

	/**
	 * 退款列表
	 */
	@Override
	public LayuiReplay OrderRefund(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbOrderExample orderExampler = new TbOrderExample();
		orderExampler.createCriteria().andStatusEqualTo(7);
		List<TbOrder> list = tbOrderMapper.selectByExample(orderExampler);
		List<Order> orders = new ArrayList<Order>();
		Order order =new Order();
		TbOrder tbOrder =list.get(0);
		order.setOrderId(tbOrder.getOrderId());
		order.setPayment(tbOrder.getPayment());
		order.setPaymentType(tbOrder.getPaymentType());
		order.setPostFee(tbOrder.getPostFee());
		order.setStatus(tbOrder.getStatus());
		order.setCreateTime(tbOrder.getCreateTime());
		order.setUpdateTime(tbOrder.getUpdateTime());
		order.setPaymentTime(tbOrder.getPaymentTime());
		order.setConsignTime(tbOrder.getConsignTime());
		order.setEndTime(tbOrder.getEndTime());
		order.setCloseTime(tbOrder.getCloseTime());
		order.setShippingName(tbOrder.getShippingName());
		order.setShippingCode(tbOrder.getShippingCode());
		order.setUserId(tbOrder.getUserId());
		order.setBuyerMessage(tbOrder.getBuyerMessage());
		order.setBuyerNick(tbOrder.getBuyerNick());
		order.setBuyerRate(tbOrder.getBuyerRate());
		//查询tbOrderItem
		TbOrderItemExample example =new TbOrderItemExample();
		example.createCriteria().andOrderIdEqualTo(tbOrder.getOrderId());
		List<TbOrderItem> tbOrderItem = tbOrderItemMapper.selectByExample(example);
		order.setOrderItems(tbOrderItem);
	
		TbOrderShippingExample example1 =new TbOrderShippingExample();
		example.createCriteria().andOrderIdEqualTo(tbOrder.getOrderId());
		List<TbOrderShipping> tbOrderShipping = tbOrderShippingMapper.selectByExample(example1);
		order.setOrderShipping(tbOrderShipping.get(0));
		orders.add(order);
		
		return LayuiReplay.ok(orders);
	}
	
	/**
	 * 处理退款
	 */
	@Override
	public FjnyResult refund(String orderId,String itemId) {
		
		TbOrderItemExample example = new TbOrderItemExample();
		TbOrderItemExample.Criteria createCriteria = example.createCriteria();
		createCriteria.andItemIdEqualTo(itemId);
		createCriteria.andOrderIdEqualTo(orderId);
		List<TbOrderItem> list = tbOrderItemMapper.selectByExample(example);
		
		TbOrderItem tbItem =list.get(0);
		tbItem.setStatus(2);
		tbOrderItemMapper.updateByExampleSelective(tbItem , example);
		/*
		 * TbOrderExample example1=new TbOrderExample();
		 * example1.createCriteria().andOrderIdEqualTo(orderId);
		 */
		TbOrderItemExample orderExample = new TbOrderItemExample();
		org.nzy.pojo.TbOrderItemExample.Criteria idEqualTo = orderExample.createCriteria().andOrderIdEqualTo(orderId);
		int sumItem = tbOrderItemMapper.countByExample(orderExample);
		System.out.println("总数:" + sumItem);
		
		idEqualTo.andStatusEqualTo(2);
		int sumRefundItem = tbOrderItemMapper.countByExample(orderExample);
		System.out.println("退款的数量:" + sumRefundItem);
		
		TbOrder order = tbOrderMapper.selectByPrimaryKey(orderId);
		String payment2 = order.getPayment();
		long orderPayment = Long.parseLong(payment2);
		order.setStatus(3);
		if(sumItem == sumRefundItem) {
			order.setStatus(6);
		}
		Long payment= orderPayment - tbItem.getTotalFee();
		System.out.println("payemrnt:"+payment);
		String payment1 =String.valueOf(payment.longValue());
		order.setPayment(payment1);
		System.out.println("价格："+payment1);
		tbOrderMapper.updateByPrimaryKeySelective(order);
		
		return FjnyResult.ok();
	}
	/**
	 * 查询tborderItem表
	 */
	@Override
	public LayuiReplay RefundList(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbOrderItemExample example= new TbOrderItemExample();
		example.createCriteria().andStatusEqualTo(1);
		List<TbOrderItem> list = tbOrderItemMapper.selectByExample(example);
		return LayuiReplay.ok(list);
	}
	//拒绝退款
	@Override
	public FjnyResult RevokeRefund(String orderId, String itemId) {
		TbOrderExample example1=new TbOrderExample();
		example1.createCriteria().andOrderIdEqualTo(orderId);
		List<TbOrder> list2 = tbOrderMapper.selectByExample(example1);
		TbOrder tbOrder= list2.get(0);
		int status=tbOrder.getStatus();
		
		TbOrderItemExample example =new TbOrderItemExample();
		TbOrderItemExample.Criteria criteria = example.createCriteria();
		criteria.andItemIdEqualTo(itemId);
		criteria.andOrderIdEqualTo(orderId);
		List<TbOrderItem> list = tbOrderItemMapper.selectByExample(example);
		TbOrderItem tbOrderItem =list.get(0);
		tbOrderItem.setStatus(0);
		tbOrderItemMapper.updateByExampleSelective(tbOrderItem , example);
		System.out.println("orderStatus:"+status);
		
		
		//判断是否有待退款商品
		TbOrderItemExample orderExample = new TbOrderItemExample();
		orderExample.createCriteria().andOrderIdEqualTo(orderId).andStatusEqualTo(1);
		 int num = tbOrderItemMapper.countByExample(orderExample);
		if(num == 0&&status==7) {
			tbOrder.setStatus(3);
		}
		
		tbOrderMapper.updateByExampleSelective(tbOrder , example1);
		System.out.println("当前tborder的状态为："+tbOrder.getStatus());
		return FjnyResult.ok();
	}
	
	//修改收货地址
	@Override
	public FjnyResult updateAddressOrder(TbOrderShipping tbOrdershipping, TbOrder tbOrder) {
		TbOrderShippingExample example=new TbOrderShippingExample();
		example.createCriteria().andOrderIdEqualTo(tbOrdershipping.getOrderId());
		tbOrderShippingMapper.updateByExampleSelective(tbOrdershipping, example);
		TbOrderExample example1 =new TbOrderExample();
		example1.createCriteria().andOrderIdEqualTo(tbOrder.getOrderId());
		String payment = tbOrder.getPayment();
		int pyam =Integer.parseInt(payment)*100;
		String py =String.valueOf(pyam);
		tbOrder.setPayment(py);
		tbOrderMapper.updateByExampleSelective(tbOrder , example1);
		return FjnyResult.ok();
		
	}
	//删除订单
	@Override
	public FjnyResult deleteOrder(TbOrder tbOrder, TbOrderShipping tbOrderShipping, TbOrderItem tbOrderItem) {
		TbOrderExample example =new TbOrderExample();
		Criteria criteria = example.createCriteria();
		List<TbOrder> list = tbOrderMapper.selectByExample(example);
		TbOrder tbOrder1 =list.get(0);
		int status =tbOrder1.getStatus();
		criteria.andOrderIdEqualTo(tbOrder.getOrderId());
		TbOrderShippingExample example1 =new TbOrderShippingExample();
		TbOrderItemExample example2 =new TbOrderItemExample();
		if(status==1||status==5||status==6||status==8) {
			tbOrderMapper.deleteByExample(example);
			example1.createCriteria().andOrderIdEqualTo(tbOrderShipping.getOrderId());
			tbOrderShippingMapper.deleteByExample(example1 );
			example2.createCriteria().andOrderIdEqualTo(tbOrderItem.getOrderId());
			tbOrderItemMapper.deleteByExample(example2 );
			return FjnyResult.ok();
		}
			return null;
	}
	//获取全部订单
	@Override
	public LayuiReplay getOrderAll() {
		List<TbOrder> orderList = tbOrderMapper.selectByExample(null);
		List<Order> orders = new ArrayList<Order>();
		for (TbOrder order : orderList) {
			Order order1 = new Order();
			order1.setOrderId(order.getOrderId());
			order1.setPayment(order.getPayment());
			order1.setPaymentType(order.getPaymentType());
			order1.setPostFee(order.getPostFee());
			order1.setStatus(order.getStatus());
			order1.setCreateTime(order.getCreateTime());
			order1.setUpdateTime(order.getUpdateTime());
			order1.setPaymentTime(order.getPaymentTime());
			order1.setConsignTime(order.getConsignTime());
			order1.setEndTime(order.getEndTime());
			order1.setCloseTime(order.getCloseTime());
			order1.setShippingName(order.getShippingName());
			order1.setShippingCode(order.getShippingCode());
			order1.setUserId(order.getUserId());
			order1.setBuyerMessage(order.getBuyerMessage());
			order1.setBuyerNick(order.getBuyerNick());
			order1.setBuyerRate(order.getBuyerRate());
			//订单商品
			TbOrderItemExample example1 = new TbOrderItemExample();
			example1.createCriteria().andOrderIdEqualTo(order.getOrderId());
			List<TbOrderItem> orderItems = tbOrderItemMapper.selectByExample(example1);
			order1.setOrderItems(orderItems);	
			//订单收货人信息
			TbOrderShippingExample example2 = new TbOrderShippingExample();
			example2.createCriteria().andOrderIdEqualTo(order.getOrderId());
			List<TbOrderShipping> ordershipping =  tbOrderShippingMapper.selectByExample(example2);
			order1.setOrderShipping(ordershipping.get(0));
			orders.add(order1);
		}
		return LayuiReplay.ok(orders);
	}
	//评价列表
	@Override
	public LayuiReplay evaluate(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbAssessExample example=new TbAssessExample();
		List<TbAssess> list = tbAssessMapper.selectByExample(example);
		return LayuiReplay.ok(list);
	}
	
	//删除评价
	@Override
	public FjnyResult deletaccess(int id) {
		TbAssessExample example =new TbAssessExample();
		example.createCriteria().andIdEqualTo(id);
		tbAssessMapper.deleteByExample(example );
		return FjnyResult.ok();
	}
	//回复评价
	@Override
	public FjnyResult Replyaccess(int id, String bAssess) {
		TbAssess record=new TbAssess();
		TbAssessExample example=new TbAssessExample();
		example.createCriteria().andIdEqualTo(id);
		record.setbAssess(bAssess);
		tbAssessMapper.updateByExampleSelective(record , example);
		return FjnyResult.ok();
	}
	
}
