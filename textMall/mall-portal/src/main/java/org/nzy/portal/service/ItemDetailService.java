package org.nzy.portal.service;

import org.nzy.portal.pojo.ItemDetail;
import org.springframework.beans.factory.annotation.Value;

public interface ItemDetailService {
	ItemDetail getItemDetail(Long parentId);
}
