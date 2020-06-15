package org.nzy.rest.service.impl;

import javax.annotation.Resource;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.mapper.ItemDetailMapper;
import org.nzy.rest.pojo.ItemDetail;
import org.nzy.rest.service.ItemDetailService;
import org.springframework.stereotype.Service;
@Service
public class ItemDetailServiceImpl implements ItemDetailService {
	
	@Resource
	private ItemDetailMapper itemDetailMapper;
		
	@Override
	public FjnyResult getItemDetail(Long id) {
		ItemDetail itemDetail = itemDetailMapper.getItemDetail(id);
		return FjnyResult.ok(itemDetail);
	}

}
