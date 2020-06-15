package org.nzy.rest.service.impl;

import javax.annotation.Resource;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.mapper.ItemMapper;
import org.nzy.rest.pojo.Item;
import org.nzy.rest.service.ItemService;
import org.springframework.stereotype.Service;
@Service
public class ItemServiceImpl implements ItemService {

	@Resource
	private ItemMapper itemMapper;
	
	@Override
	public FjnyResult getItemById(Long itemId) {
		Item item = itemMapper.getItemById(itemId);
		if(item==null) {
			return FjnyResult.build(400, "没有这类商品");
		}
		return FjnyResult.ok(item);
	}

}
