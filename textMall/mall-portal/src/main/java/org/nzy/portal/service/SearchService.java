package org.nzy.portal.service;

import java.util.List;

import org.nzy.portal.pojo.Item;

public interface SearchService {
	List<Item> searchOrder(String name);
}
