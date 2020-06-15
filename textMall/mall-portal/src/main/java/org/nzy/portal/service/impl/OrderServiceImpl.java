package org.nzy.portal.service.impl;

import org.nzy.pojo.FjnyResult;
import org.nzy.portal.pojo.Order;
import org.nzy.portal.service.OrderService;
import org.nzy.utils.HttpClientUtil;
import org.nzy.utils.JsonUtils;
import org.springframework.stereotype.Service;
@Service
public class OrderServiceImpl implements OrderService {

	@Override
	public String create(Order order) {
		String json = JsonUtils.objectToJson(order);
		System.out.println(json);
		String doPostJson = HttpClientUtil.doPostJson("http://localhost:8894/order/create",json);
		FjnyResult result = FjnyResult.format(doPostJson);
		if(result.getStatus() == 200) {
			Object data = result.getData();
			return data.toString();
		}
		return "";
	}

}
