package org.nzy.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.nzy.mapper.TbContentCategoryMapper;
import org.nzy.mapper.TbContentMapper;
import org.nzy.pojo.TbContent;
import org.nzy.pojo.TbContentCategory;
import org.nzy.pojo.TbContentCategoryExample;
import org.nzy.pojo.TbContentExample;
import org.nzy.pojo.TbItem;
import org.nzy.pojo.TbContentExample.Criteria;
import org.nzy.service.CommonService;
import org.nzy.utils.FjnyResult;
import org.nzy.utils.LayuiReplay;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CommonServiceImpl implements CommonService {
		/**
		 * 轮播图查询
		 */
		Long limits = (long) 10;
		@Resource
		private TbContentMapper tbContentMapper;
		@Resource 
		private TbContentCategoryMapper tbContentCategoryMapper;
		@Override
		public LayuiReplay bannerlist(Integer page, Integer limit) {
			TbContentExample example =new TbContentExample();
			PageHelper.startPage(page, limit);
			List<TbContent> list = tbContentMapper.selectByExample(example);
			PageInfo<TbContent> info = new PageInfo(list);
			long total = info.getTotal();
			 return LayuiReplay.ok((int)total,list);
		}
		//搜索轮播图
		@Override
		public LayuiReplay bannerlist(Integer page, Integer limit,String title) throws UnsupportedEncodingException {
			TbContentExample example =new TbContentExample();
			String str =new String(title.getBytes("ISO8859-1"),"UTF-8");
			String title1 = "%"+str+"%";
			System.out.println(title1);
			example.createCriteria().andTitleLike(title1);
			PageHelper.startPage(page, limit);
			List<TbContent> list = tbContentMapper.selectByExample(example);
			PageInfo<TbContent> info = new PageInfo<>(list);
			long total = info.getTotal();
			 return LayuiReplay.ok((int)total,list);

		};
		
		/**
		 * 修改轮播图内容
		 */
		@Override
		public LayuiReplay updateBanner(TbContent tbContent) {
			TbContentExample example =new TbContentExample();
			Criteria criteria = example.createCriteria();
			criteria.andIdEqualTo(tbContent.getId());
			 tbContentMapper.updateByExampleSelective(tbContent, example);
			 return LayuiReplay.ok();
		}
		/**
		 * 删除轮播广告图
		 */
		@Override
		public FjnyResult deleteBanner(TbContent tbContent) {
			TbContentExample example=new TbContentExample();
			Criteria criteria = example.createCriteria();
			criteria.andIdEqualTo(tbContent.getId());
			 tbContentMapper.deleteByExample(example);
			return FjnyResult.ok();
		}
		/**
		 * 添加轮播广告图
		 */
	
	  @Override 
	  public FjnyResult addBanner(TbContent tbContent) {
		 tbContentMapper.insertSelective(tbContent);
			return FjnyResult.ok();
	  }
	  /**
	   * 首页广告
	   */
		@Override
		public LayuiReplay category(Integer page, int limit) {
			TbContentCategoryExample example=new TbContentCategoryExample();
			List<TbContentCategory> list = tbContentCategoryMapper.selectByExample(example);
			return LayuiReplay.ok(list);
		}
	/**
	 * 广告列表分类
	 */
	@Override
	public FjnyResult content(TbContentCategory tbContentCategory) {
		TbContentCategoryExample example =new TbContentCategoryExample();
		List<TbContentCategory> list = tbContentCategoryMapper.selectByExample(example);
		return FjnyResult.ok(list);
	}
	//修改广告状态
	@Override
	public FjnyResult changeTypeState(TbContentCategory tbContentCategory) {
		TbContentCategoryExample example =new TbContentCategoryExample();
		example.createCriteria().andIdEqualTo(tbContentCategory.getId());
		Integer status = tbContentCategory.getStatus();
		if(status==1) {
			tbContentCategory.setStatus(2);
			tbContentCategoryMapper.updateByExampleSelective(tbContentCategory, example );
		}else{
			tbContentCategory.setStatus(1);
			tbContentCategoryMapper.updateByExampleSelective(tbContentCategory, example );
		}
		return FjnyResult.ok();
	}
	
	 
}
