package org.nzy.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.nzy.common.CookieUtils;
import org.nzy.pojo.FjnyResult;
import org.nzy.portal.pojo.Item;
import org.nzy.portal.service.CarService;
import org.nzy.utils.HttpClientUtil;
import org.nzy.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class CarServiceImpl implements CarService {

	@Value("${BASE_URL}")
	private String BASE_URL;
	
	@Value("${ITEMS_LIST}")
	private String ITEMS_LIST;
	
	@Value("${CAR_ITEMS_LIST_KEY}")
	private String CAR_ITEMS_LIST_KEY;
	
	@Override
	public List<Item> addCarItem(Long itemId, HttpServletRequest request, HttpServletResponse response) {
		//判断itemId是否在系统当中，或者数据库当中
		String string = HttpClientUtil.doGet(BASE_URL+ITEMS_LIST+itemId);
		FjnyResult fjnyResult = FjnyResult.formatToPojo(string, Item.class);
		if(fjnyResult.getStatus() != 200) {
			return null;
		}
		//从cookie里面获取购物车商品列表
		String cookieItemStr = CookieUtils.getCookieValue(request, CAR_ITEMS_LIST_KEY, true);
		List<Item> list = null;
		//是否有相同商品
		boolean isExists = false;
		if(!StringUtils.isBlank(cookieItemStr)) {
			list = JsonUtils.jsonToList(cookieItemStr, Item.class);
			for (Item item : list) {
				if(item.getId().longValue() == itemId.longValue()) {
					//购物车存在同样的商品，数量加1
					item.setNum(item.getNum() + 1);
					isExists = true;
				}
			}
		}
		//购物车没有该商品，直接添加到list
		if(!isExists) {
			if(list == null) {
				list = new ArrayList<>();
			}
			//直接添加到list
			Item formItem = (Item) fjnyResult.getData();
			formItem.setNum(1);
			list.add(formItem);
		}
		//将list保存到cookie里面
		CookieUtils.setCookie(request, response, CAR_ITEMS_LIST_KEY, JsonUtils.objectToJson(list),true);
		return list;
	}

	@Override
	public List<Item> editCarItem(Long itemId, Integer num, HttpServletRequest request, HttpServletResponse response) {
		String itemsStr = CookieUtils.getCookieValue(request, CAR_ITEMS_LIST_KEY,true);
		List<Item> list;
		if(!StringUtils.isBlank(itemsStr)) {
			list = JsonUtils.jsonToList(itemsStr, Item.class);
			for (Item item : list) {
				if(item.getId().longValue() == itemId.longValue()) {
					//购物车存在同样的商品，数量加1
					item.setNum(num);
					
				}
			}
		}else{
			list = new ArrayList<>();
		}
		CookieUtils.setCookie(request, response, CAR_ITEMS_LIST_KEY, 
				JsonUtils.objectToJson(list),true);
		return list;
	}

	@Override
	public List<Item> showCarItem(HttpServletRequest request) {
		String itemsStr = CookieUtils.getCookieValue(request, CAR_ITEMS_LIST_KEY,true);
		List<Item> list;
		if(!StringUtils.isBlank(itemsStr)) {
			list = JsonUtils.jsonToList(itemsStr, Item.class);
		}else {
			list = new ArrayList<>();
		}
		return list;
	}

}
