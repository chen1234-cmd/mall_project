package org.nzy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoIndexController {
	
	@RequestMapping("/")
	public String index() {
		
		return "login";
	}
	
	@RequestMapping("/{page}")
	public String showpage(@PathVariable String page) {
		
		return page;
	}
	
	@RequestMapping("/admin/{page}")
	public String getadmin(@PathVariable String page) {
		return "admin/"+page;
	}
	@RequestMapping("/rolesmenu/{page}")
	public String rolesmenu(@PathVariable String page) {
		return "rolesmenu/"+page;
	}

}

