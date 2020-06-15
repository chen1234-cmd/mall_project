package org.nzy.portal.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nzy.pojo.FjnyResult;
import org.nzy.portal.pojo.Item;
import org.nzy.portal.service.SearchService;
import org.nzy.utils.HttpClientUtil;
import org.springframework.stereotype.Service;
@Service
public class searchServiceImpl implements SearchService {

	@Override
	public List<Item> searchOrder(String name) {
		Map<String, String> param = new HashMap<String,String>();
		param.put("name", name);
		String string =	HttpClientUtil.doPost("http://localhost:8891/rest/search", param);
		FjnyResult result = FjnyResult.formatToList(string, Item.class);
		List<Item> lists = (List<Item>) result.getData();
		return lists;
	}

}
