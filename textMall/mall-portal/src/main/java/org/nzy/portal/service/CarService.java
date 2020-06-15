package org.nzy.portal.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nzy.portal.pojo.Item;

public interface CarService {
	List<Item> addCarItem(Long itemId,HttpServletRequest request,HttpServletResponse response);
	List<Item> editCarItem(Long itemId,Integer num,HttpServletRequest request,HttpServletResponse response);
	List<Item> showCarItem(HttpServletRequest request);
}
