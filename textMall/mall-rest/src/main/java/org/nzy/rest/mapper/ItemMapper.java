package org.nzy.rest.mapper;

import java.util.List;

import org.nzy.rest.pojo.Item;

public interface ItemMapper {
	List<Item> getSearchList(Item item);

	Item getItemById(Long itemId);
}
