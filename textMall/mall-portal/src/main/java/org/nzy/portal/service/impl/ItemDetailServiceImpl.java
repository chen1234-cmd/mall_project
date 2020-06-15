package org.nzy.portal.service.impl;

import org.nzy.pojo.FjnyResult;
import org.nzy.portal.pojo.ItemDetail;
import org.nzy.portal.service.ItemDetailService;
import org.nzy.utils.HttpClientUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class ItemDetailServiceImpl implements ItemDetailService {
	
	@Value("${BASE_URL}")
	private String BASE_URL;
	
	@Value("${DETAIL_URL}")
	private String DETAIL_URL;
	
	
	@Override
	public ItemDetail getItemDetail(Long parentId) {
		String url = BASE_URL + DETAIL_URL +parentId;
		String result = HttpClientUtil.doGet(url);
		FjnyResult fjnyResult = FjnyResult.formatToPojo(result, ItemDetail.class);
		ItemDetail itemDetail =  (ItemDetail) fjnyResult.getData();
		return itemDetail;
	}

}
