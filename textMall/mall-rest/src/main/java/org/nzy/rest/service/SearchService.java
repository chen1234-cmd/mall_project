package org.nzy.rest.service;

import java.util.List;

import org.nzy.rest.pojo.Item;

public interface SearchService {
	List<Item> getSearchList(String name, Long page);
}
