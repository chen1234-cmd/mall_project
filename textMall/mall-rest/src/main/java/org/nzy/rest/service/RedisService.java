package org.nzy.rest.service;

import org.nzy.pojo.FjnyResult;

public interface RedisService {
	FjnyResult delRedisKey(Long categoryId);
}
