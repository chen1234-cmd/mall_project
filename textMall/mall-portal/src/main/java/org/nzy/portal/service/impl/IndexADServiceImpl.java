package org.nzy.portal.service.impl;

import java.util.List;

import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbContent;
import org.nzy.portal.service.IndexADService;
import org.nzy.utils.HttpClientUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class IndexADServiceImpl implements IndexADService {
	
	@Value("${BASE_URL}")
	private String BASE_URL;
	
	//获取首页广告
	@Override
	public List<TbContent> getADList(String path) {
		//通过httpClient请求rest中conent/categoryId返回json
		System.out.println("url:"+BASE_URL+path);
		String result =HttpClientUtil.doGet(BASE_URL+path);
		System.out.println("result"+result);
		FjnyResult result2 = FjnyResult.formatToList(result, TbContent.class);
		List<TbContent> list = (List<TbContent>) result2.getData();
		return list;
	}

}
