package org.nzy.rest.service.impl;

import javax.annotation.Resource;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.dao.JedisClient;
import org.nzy.rest.service.RedisService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class RedisServiceImpl implements RedisService {
	
	@Value("${INDEX_CONTENT_KEY}")
	private String INDEX_CONTENT_KEY;
	
	@Resource
	private JedisClient jedisClient;
	
	@Override
	public FjnyResult delRedisKey(Long categoryId) {
		
		try {
			Long hdel = jedisClient.hdel(INDEX_CONTENT_KEY, categoryId+"");
			System.out.println("hdel:"+hdel);
		} catch (Exception e) {
			e.printStackTrace();
			FjnyResult.build(500, "删除失败");
		}
		return FjnyResult.ok();
	}

}
