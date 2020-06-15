package org.nzy.portal.controller;

import java.util.List;

import org.nzy.pojo.TbContent;
import org.nzy.portal.service.IndexADService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexADController {
	@Autowired
	private IndexADService indexADService;

	
	@Value("${AD_URL_1}")
	private String AD_URL_1;
	@Value("${AD_URL_2}")
	private String AD_URL_2;
	@Value("${AD_URL_3}")
	private String AD_URL_3;
	@Value("${AD_URL_4}")
	private String AD_URL_4;
	
	@RequestMapping("/index")
	public String index(Model model) {
		List<TbContent> adlist1 = indexADService.getADList(AD_URL_1);
		List<TbContent> adlist2 = indexADService.getADList(AD_URL_2);
		List<TbContent> adlist3 = indexADService.getADList(AD_URL_3);
		List<TbContent> adlist4 = indexADService.getADList(AD_URL_4);
		
		model.addAttribute("adlist1", adlist1);
		model.addAttribute("adlist2", adlist2);
		model.addAttribute("adlist3", adlist3);
		model.addAttribute("adlist4", adlist4);
		return "index";
	}
	
	
}
