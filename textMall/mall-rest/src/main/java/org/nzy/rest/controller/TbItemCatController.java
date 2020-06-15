package org.nzy.rest.controller;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.service.TbItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TbItemCatController {
	@Autowired
	private TbItemCatService tbItemCatService;
	
	@RequestMapping("/getTbItemCat")
	@ResponseBody
	public FjnyResult getTbItemCat(@RequestParam("parentId") Long parentId) {
		return tbItemCatService.getTbItemCat(parentId);
	}
}
