package org.nzy.rest.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.nzy.rest.mapper.ItemMapper;
import org.nzy.rest.pojo.Item;
import org.nzy.rest.service.SearchService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Service
public class SearchServiceImpl implements SearchService {
	
	@Resource
	private ItemMapper itemMapper;

	@Override
	public List<Item> getSearchList(String name,Long page) {
		Item item = new Item();
		item.setTitle(name);
		item.setPage(page*16);
		List<Item> list = itemMapper.getSearchList(item);
		
		return list;
	}

}
