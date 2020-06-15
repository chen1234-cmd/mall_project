package org.nzy.order.dao.impl;

import org.nzy.order.dao.JedisClient;
import org.springframework.beans.factory.annotation.Autowired;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisClientSingle implements JedisClient {
	
	@Autowired
	private JedisPool redisClient;
	
	@Override
	public String set(String key, String value) {
		Jedis jedis = redisClient.getResource();
		String set = jedis.set(key, value);
		jedis.close();
		return set;
	}

	@Override
	public String get(String key) {
		Jedis jedis = redisClient.getResource();
		String get = jedis.get(key);
		jedis.close();
		return get;
	}

	@Override
	public Boolean exists(String key) {
		Jedis jedis = redisClient.getResource();
		Boolean exists = jedis.exists(key);
		jedis.close();
		return exists;
	}

	@Override
	public Long expire(String key, int seconds) {
		Jedis jedis = redisClient.getResource();
		Long expire = jedis.expire(key, seconds);
		jedis.close();
		return expire;
	}

	@Override
	public Long ttl(String key) {
		Jedis jedis = redisClient.getResource();
		Long ttl = jedis.ttl(key);
		jedis.close();
		return ttl;
	}

	@Override
	public Long incr(String key) {
		Jedis jedis = redisClient.getResource();
		Long incr = jedis.incr(key);
		jedis.close();
		return incr;
	}

	@Override
	public Long hset(String key, String field, String value) {
		Jedis jedis = redisClient.getResource();
		Long hset = jedis.hset(key, field, value);
		jedis.close();
		return hset;
	}

	@Override
	public String hget(String key, String field) {
		Jedis jedis = redisClient.getResource();
		String hget = jedis.hget(key, field);
		jedis.close();
		return hget;
	}

	@Override
	public Long hdel(String key, String... field) {
		Jedis jedis = redisClient.getResource();
		Long hdel = jedis.hdel(key, field);
		jedis.close();
		return hdel;
	}

}
