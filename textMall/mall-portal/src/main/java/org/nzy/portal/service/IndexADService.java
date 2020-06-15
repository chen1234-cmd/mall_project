package org.nzy.portal.service;

import java.util.List;

import org.nzy.pojo.TbContent;

public interface IndexADService {
	//获取首页广告
	List<TbContent> getADList(String path);
}
