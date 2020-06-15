package org.nzy.rest.controller;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.service.ItemDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ItemDetailController {
	
	@Autowired
	private ItemDetailService itemDetailService;
	
	@RequestMapping("/getItemDetail/{id}")
	@ResponseBody
	public FjnyResult getItemDetail(@PathVariable("id") Long id ) {
		return itemDetailService.getItemDetail(id);
		
	}
}
