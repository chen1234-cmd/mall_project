package org.nzy.rest.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.nzy.mapper.TbItemCatMapper;
import org.nzy.pojo.FjnyResult;
import org.nzy.pojo.TbContent;
import org.nzy.pojo.TbItemCat;
import org.nzy.pojo.TbItemCatExample;
import org.nzy.pojo.TbItemCatExample.Criteria;
import org.nzy.rest.dao.JedisClient;
import org.nzy.rest.service.TbItemCatService;
import org.nzy.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class TbItemCatServiceImpl implements TbItemCatService {

	
	@Value("TBITEM_CAT_KEY")
	private String TBITEM_CAT_KEY;
	@Resource
	private	TbItemCatMapper tbItemCatMapper;
	@Resource
	private JedisClient jedisClient;
	
	@Override
	public FjnyResult getTbItemCat(Long parentId) {
		//从缓存中查询数据
		String hget = jedisClient.hget(TBITEM_CAT_KEY, parentId+"");
		if(hget!= null&& !hget.isEmpty()) {
			//把查询出的json字符串转换成list
			List<TbItemCat> resultList = JsonUtils.jsonToList(hget, TbItemCat.class);
			return FjnyResult.ok(resultList);
		}
		//从数据库查询数据
		TbItemCatExample example = new TbItemCatExample();
		Criteria criteria =  example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		List<TbItemCat> list = tbItemCatMapper.selectByExample(example );
		//把lists转换成json字符串
		String cacheString = JsonUtils.objectToJson(list);
		//写入缓存
		jedisClient.hset(TBITEM_CAT_KEY, parentId+"", cacheString);
		return FjnyResult.ok(list);
	}

}
