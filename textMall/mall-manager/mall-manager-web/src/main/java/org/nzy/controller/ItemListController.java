package org.nzy.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.nzy.pojo.TbContent;
import org.nzy.pojo.TbItem;
import org.nzy.pojo.TbItemCat;
import org.nzy.service.ItemListService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.IDUtils;
import org.nzy.utils.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.xmlrpc.base.Data;

@Controller
public class ItemListController {
	@Autowired
	private ItemListService itemListService;

	/**
	 * 查询商品列表
	 * 
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("/demo/table/user")
	@ResponseBody
	public LayuiReplay getItemList(@RequestParam Integer page, @RequestParam Integer limit) {
		LayuiReplay layuiReplay = itemListService.getItemlist(page, limit);
		System.out.println("Controller：查询商品列表");
		return layuiReplay;
	}
	/**
	 * 搜索商品
	 * 
	 */
	@RequestMapping("/findTitle")
	@ResponseBody
	public LayuiReplay findTitle(@RequestParam Integer page, @RequestParam Integer limit ,String title)
		throws UnsupportedEncodingException{
		LayuiReplay layuiReplay = null;
		if(title==null){
			 layuiReplay = itemListService.getItemlist(page, limit);
		}else {
			 layuiReplay = itemListService.getItemlist(page, limit,title);
		}
		
		
		return layuiReplay;
	}
	
	/**
	 * 新增商品
	 * goods/addGoods
	 */
	@RequestMapping("goods/addGoods")
	@ResponseBody
	public FjnyResult addGoods(TbItem tbItem) {
		
		Long itemId = IDUtils.getItemId();
		tbItem.setId(itemId);
		tbItem.setStatus((byte) 1);
		tbItem.setCreated(new Date());
		tbItem.setUpdated(new Date());
		return itemListService.addGoods(tbItem);
	}


	/**
	 * 商品分类选择 url /test/list
	 * 
	 */
	@RequestMapping("/test/list/{parentId}")
	@ResponseBody
	public FjnyResult list(TbItemCat tbItemCat, @PathVariable Long parentId) {
		tbItemCat.setParentId(parentId);
		return itemListService.list(tbItemCat);
	}

	/**
	 * 编辑商品信息
	 */
	@RequestMapping("/editItem ")
	@ResponseBody
	public FjnyResult editItem(TbItem tbItem) {
		System.out.println("controller：编辑商品");
		tbItem.setUpdated(new Date());
		return itemListService.editItem(tbItem);
	}

	/**
	 * 删除商品 test/deleteitem
	 */

	@RequestMapping("test/deleteitem")
	@ResponseBody
	public FjnyResult deleteitem(TbItem tbItem) {
		System.out.println("controoler：删除商品");
		return itemListService.deleteitem(tbItem);
	}
	
	/**
	 * 商品上架下架
	 * url：banner/changeBannerState
	 */
	@RequestMapping("banner/changeBannerState")
	@ResponseBody
	public FjnyResult changeBannerState(TbItem tbItem) {
		tbItem.setUpdated(new Date());
		return itemListService.changeBannerState(tbItem);
	}
	/**
	 * 批量删除商品
	 * URL:banner/batchDelete
	 */
	@RequestMapping("banner/batchDelete")
	@ResponseBody
	public FjnyResult batchDelete(@RequestParam (value="id")  List<Long> id) {
		return itemListService.batchDelete(id);
	}
	
	@RequestMapping("/colonse")
	public String FindItem(Model model) {
		return "colonse";
	}
}
