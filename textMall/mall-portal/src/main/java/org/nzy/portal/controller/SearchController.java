package org.nzy.portal.controller;

import java.util.List;

import org.nzy.portal.pojo.Item;
import org.nzy.portal.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/goods")
	public String searchMeg(@RequestParam("name") String name ,Model model) {
		List<Item> goods = searchService.searchOrder(name);
		model.addAttribute("goods", goods);
		return "goods";
	}
	
}
