package org.nzy.portal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nzy.portal.pojo.Item;
import org.nzy.portal.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	@Autowired
	private CarService carService;
	
	@RequestMapping("/add-car")
	public String addCar(@RequestParam("itemId") Long itemId,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model
			) {
		System.out.println("/add-car");
		List<Item> list = carService.addCarItem(itemId, request, response);
		if(list == null) {
			model.addAttribute("message","没有该商品");
			return "error";
		}
		model.addAttribute("carList",list);
		return "car";
	}
	
	@RequestMapping("/car")
	public String showCar(HttpServletRequest request,Model model) {
		System.out.println("/car");
		List<Item> list = carService.showCarItem(request);
		model.addAttribute("carList",list);
		return "car";
	}
	
	@RequestMapping("/edit-car")
	public String editCar(@RequestParam("itemId") Long itemId,
			@RequestParam("num") Integer num,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model

			) {
		System.out.println("/edit-car");
		List<Item> list = carService.editCarItem(itemId, num, request, response);
		model.addAttribute("carList",list);
		return "car";
	}
	
}
