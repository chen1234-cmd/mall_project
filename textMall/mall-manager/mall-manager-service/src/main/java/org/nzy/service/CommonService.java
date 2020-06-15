package org.nzy.service;

import java.io.UnsupportedEncodingException;

import org.nzy.pojo.TbContent;
import org.nzy.pojo.TbContentCategory;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;

public interface CommonService {
	LayuiReplay bannerlist(Integer page , Integer limit, String title) throws UnsupportedEncodingException ; //轮播图列表

	LayuiReplay updateBanner(TbContent tbContent); //修改轮播图内容

	FjnyResult addBanner(TbContent tbContent);//添加轮播图广告

	FjnyResult deleteBanner(TbContent tbContent2); //删除轮播图

	LayuiReplay category(Integer page, int limit); //首页广告

	FjnyResult content(TbContentCategory tbContentCategory); //查询广告分类

	LayuiReplay bannerlist(Integer page, Integer limit);

	FjnyResult changeTypeState(TbContentCategory tbContentCategory); //修改广告位置状态

}
