package org.nzy.rest.controller;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.service.TbContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TbContentController {
	@Autowired
	private TbContentService tbContentService;
	
	//首页广告
	@RequestMapping("/content/category/{categoryId}")
	@ResponseBody
	public FjnyResult getTbContentByCategoryId(@PathVariable Long categoryId) {
		return tbContentService.getTbContentByCategoryId(categoryId);
		
	}
}
