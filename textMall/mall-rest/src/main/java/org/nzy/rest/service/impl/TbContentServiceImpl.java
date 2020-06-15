package org.nzy.rest.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.nzy.mapper.TbContentMapper;
import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbContent;
import org.nzy.pojo.TbContentExample;
import org.nzy.pojo.TbContentExample.Criteria;
import org.nzy.rest.dao.JedisClient;
import org.nzy.rest.service.TbContentService;
import org.nzy.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class TbContentServiceImpl implements TbContentService {

	@Value("INDEX_CONTENT_KEY")
	private String INDEX_CONTENT_KEY;
	
	@Resource
	private TbContentMapper tbContentMapper;
	
	@Resource
	private JedisClient jedisClient;
	//首页广告
	@Override
	public FjnyResult getTbContentByCategoryId(Long categoryId) {
		//从缓存中查询数据
		String hget = jedisClient.hget(INDEX_CONTENT_KEY, categoryId+"");
		if(hget!= null&& !hget.isEmpty()) {
			//把查询出的json字符串转换成list
			List<TbContent> resultList = JsonUtils.jsonToList(hget, TbContent.class);
			return FjnyResult.ok(resultList);
		}
		//从数据库查询数据
		TbContentExample example = new TbContentExample();
		Criteria criteria = example.createCriteria();
		criteria.andCategoryIdEqualTo(categoryId);
		List<TbContent> lists= tbContentMapper.selectByExample(example);
		
		//把lists转换成json字符串
		String cacheString = JsonUtils.objectToJson(lists);
		//写入缓存
		jedisClient.hset(INDEX_CONTENT_KEY, categoryId+"", cacheString);
		
		return FjnyResult.ok(lists);
	}

}
