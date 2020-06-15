package org.nzy.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.nzy.pojo.TbItem;
import org.nzy.pojo.TbItemCat;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.ui.Model;

public interface ItemListService {
	LayuiReplay getItemlist(Integer page, Integer limit);

	FjnyResult list(TbItemCat tbItemCat); //测试联动选择

	FjnyResult editItem(TbItem tbItem);//修改商品信息

	FjnyResult deleteitem(TbItem tbItem);//删除商品

	FjnyResult addGoods(TbItem tbItem);//添加商品

	FjnyResult changeBannerState(TbItem tbItem); //上架下架


	FjnyResult batchDelete(List<Long> id); //批量删除

	List<TbItem> FindItem(String page); //查询商品数量

	LayuiReplay getItemlist(Integer page, Integer limit, String title) throws UnsupportedEncodingException;//搜索商品




	
//	LayuiReplay ItemCat1(Integer page, Integer limit);//商品类目
	
}
