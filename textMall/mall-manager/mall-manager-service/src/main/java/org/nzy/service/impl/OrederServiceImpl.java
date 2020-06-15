package org.nzy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.nzy.mapper.TbOrderItemMapper;
import org.nzy.mapper.TbOrderMapper;
import org.nzy.mapper.TbOrderShippingMapper;
import org.nzy.pojo.Order;
import org.nzy.pojo.TbItem;
import org.nzy.pojo.TbOrder;
import org.nzy.pojo.TbOrderExample;
import org.nzy.pojo.TbOrderItem;
import org.nzy.pojo.TbOrderItemExample;
import org.nzy.pojo.TbOrderShipping;
import org.nzy.pojo.TbOrderShippingExample;
import org.nzy.pojo.TbOrderShippingExample.Criteria;
import org.nzy.service.OrederService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class OrederServiceImpl implements OrederService {
	
	Long limits = (long) 10;
	@Resource
	private TbOrderMapper tbOrderMapper;
	@Resource 
	private TbOrderShippingMapper tbOrderShippingMapper;
	@Resource
	private TbOrderItemMapper tbOrderItemMapper;
	/**
	 * 订单列表
	 */
	@Override
	public LayuiReplay findOrderBySplitPage(Integer page, int limit) {
		TbOrderExample example=new TbOrderExample();
		PageHelper.startPage(page, limit);
		List<TbOrder> list = tbOrderMapper.selectByExample(example);
		PageInfo<TbItem> info = new PageInfo(list);
		long total = info.getTotal();
		return LayuiReplay.ok((int)total,list);
	}

	/**
	 * 发货
	 */
	@Override
	public FjnyResult orderDeliver(TbOrder tbOrder) {
		System.out.println("service:"+tbOrder.toString());
		TbOrderExample example= new TbOrderExample();
		TbOrderExample.Criteria criteria = example.createCriteria();
		criteria.andOrderIdEqualTo(tbOrder.getOrderId());
		tbOrder.setStatus(4);
		tbOrderMapper.updateByExampleSelective(tbOrder, example);
		return FjnyResult.ok();
		
	}
	/***
	 * 删除订单
	 */
	@Override
	public FjnyResult deleteOrder(TbOrder tbOrder) {
		TbOrderExample example= new  TbOrderExample();
		TbOrderExample.Criteria criteria = example.createCriteria();
		criteria.andOrderIdEqualTo(tbOrder.getOrderId());
			tbOrderMapper.deleteByExample(example);
			return FjnyResult.ok();
	}
	/**
	  * 查看订单详情
	 */

}
