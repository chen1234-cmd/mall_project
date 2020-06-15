package org.nzy.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.nzy.mapper.TbItemCatMapper;
import org.nzy.mapper.TbItemMapper;
import org.nzy.pojo.TbItem;
import org.nzy.pojo.TbItemCat;
import org.nzy.pojo.TbItemCatExample;
import org.nzy.pojo.TbItemCatExample.Criteria;
import org.nzy.pojo.TbItemExample;
import org.nzy.service.ItemListService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ItemListServiceImpl implements ItemListService {

	
	Long limits = (long) 10;
	@Resource
	private TbItemMapper tbItemMapper;
	@Resource
	private TbItemCatMapper tbItemCatMapper;
	@Override
	public LayuiReplay getItemlist(Integer page, Integer limit) {
		TbItemExample example=new TbItemExample();
		PageHelper.startPage(page, limit);
		//List<TbItem> list = tbItemMapper.selectByExample(example);
		List<TbItem> list = tbItemMapper.selectByExample(example);
		
		PageInfo<TbItem> info = new PageInfo(list);
		long total = info.getTotal();
		 return LayuiReplay.ok((int)total,list);
	}
	
	/**
	 * 搜索商品
	 * @throws UnsupportedEncodingException 
	 */
	@Override
	public LayuiReplay getItemlist(Integer page, Integer limit, String title) throws UnsupportedEncodingException {
		TbItemExample example=new TbItemExample();
		String str =new String(title.getBytes("ISO8859-1"),"UTF-8");
		String title1 = "%"+str+"%";
		System.out.println(title1);
		example.createCriteria().andTitleLike(title1);
		PageHelper.startPage(page, limit);
		List<TbItem> list = tbItemMapper.selectByExample(example);
		PageInfo<TbItem> info = new PageInfo<>(list);
		long total = info.getTotal();
		 return LayuiReplay.ok((int)total,list);
	}
	/**
	 * 测试联动选择
	 */
	@Override
	public FjnyResult list(TbItemCat tbItemCat) {
		TbItemCatExample example= new TbItemCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(tbItemCat.getParentId());
		List<TbItemCat> selectByExample = tbItemCatMapper.selectByExample(example);
		
		return FjnyResult.ok(selectByExample);
	}
	/**
	 * 修改商品信息
	 */
	@Override
	public FjnyResult editItem(TbItem tbItem) {
		TbItemExample example=new TbItemExample();
		TbItemExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(tbItem.getId());
		Long price = tbItem.getPrice();
		tbItem.setPrice(price*100);
		tbItemMapper.updateByExampleSelective(tbItem, example);
		return FjnyResult.ok();
	}
	/**
	 * 删除商品
	 */
	@Override
	public FjnyResult deleteitem(TbItem tbItem) {
		TbItemExample example =new TbItemExample();
		TbItemExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(tbItem.getId());
		tbItemMapper.deleteByExample(example );
		return FjnyResult.ok();
	}
	/**
	 * 添加商品
	 */
	@Override
	public FjnyResult addGoods(TbItem tbItem) {
		tbItem.setStatus((byte) 2);
		Long price = tbItem.getPrice();
		tbItem.setPrice(price*100);
		tbItemMapper.insert(tbItem);
		return FjnyResult.ok();
}	
	/**
	 * 上架下架
	 */
	@Override
	public FjnyResult changeBannerState(TbItem tbItem) {
		TbItemExample example=new TbItemExample();
		TbItemExample.Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(tbItem.getId());
		int status = tbItem.getStatus();
		if(status==1) {
			tbItem.setStatus((byte)2);
			tbItemMapper.updateByExampleSelective(tbItem, example);
		}else {
			tbItem.setStatus((byte)1);
			tbItemMapper.updateByExampleSelective(tbItem, example);
		}
		 return FjnyResult.ok();
	}
	/**
	 * 商品批量删除
	 * 
	 */
	@Override
	public FjnyResult batchDelete(List<Long> id) {
		TbItemExample example= new TbItemExample();
		TbItemExample.Criteria criteria = example.createCriteria();
		criteria.andIdIn(id);
		tbItemMapper.deleteByExample(example);
		return FjnyResult.ok();
	}
	/**
	 * 商品数量
	 */
	@Override
	public List<TbItem> FindItem(String page) {
		
		return null;
	}
	
	
	
	

}
