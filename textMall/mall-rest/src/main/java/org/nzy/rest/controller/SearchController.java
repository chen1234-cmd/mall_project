package org.nzy.rest.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.nzy.pojo.FjnyResult;
import org.nzy.rest.pojo.Item;
import org.nzy.rest.service.SearchService;
import org.nzy.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/search")
	@ResponseBody
	public FjnyResult getSearchList(@RequestParam("name")String name ,Long page) throws UnsupportedEncodingException {
		System.out.println(name);
//		String str = new String(name.getBytes("ISO8859-1"),"UTF-8");
		List<Item> searchList = searchService.getSearchList(name,page);
		
		return FjnyResult.ok(searchList);
	}
}
