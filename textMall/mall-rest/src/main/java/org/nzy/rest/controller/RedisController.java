package org.nzy.rest.controller;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedisController {
	
	@Autowired
	private RedisService redisService;
	
	@RequestMapping("/cache/sync/content/{categoryId}")
	public FjnyResult delRedisKey(@PathVariable Long categoryId) {
		System.out.println("cache：删除控制层");
		return redisService.delRedisKey(categoryId);
	}
}
