package org.nzy.portal.controller;

import java.util.List;
import java.util.Map;

import org.nzy.portal.pojo.ItemDetail;
import org.nzy.portal.service.ItemDetailService;
import org.nzy.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemDetailController {
	
	@Autowired
	private ItemDetailService itemDetailService;
	
	@RequestMapping("/ui-product")
	public String getItemDetail(@RequestParam("id")Long id,Model model) {
		ItemDetail itemDetail = itemDetailService.getItemDetail(id);
	
		model.addAttribute("id",itemDetail.getId());
		model.addAttribute("title",itemDetail.getTitle());
		model.addAttribute("sell_point",itemDetail.getSell_point());
		model.addAttribute("price",itemDetail.getPrice());
		model.addAttribute("num",itemDetail.getNum());
		//图片
		String image = itemDetail.getImage();
		if(image!=null && !image.isEmpty()) {
			String[] images = image.split(",");
			model.addAttribute("images", images);
		}
		//商品描述
		String item_desc = itemDetail.getItem_desc();
		if(item_desc!=null && !item_desc.isEmpty()) {
			model.addAttribute("item_desc",item_desc);
		}
		//商品规格
		String param_data = itemDetail.getParam_data();
		if(param_data!=null && !param_data.isEmpty()){
			String loadParaData = loadParamData(param_data);
			System.out.println(loadParaData);
			model.addAttribute("param_data", loadParaData);
		}
		return "ui-product";
	}

	private String loadParamData(String paramData) {
		List<Map> maps = JsonUtils.jsonToList(paramData, Map.class);
		StringBuffer sb = new StringBuffer();
		
		for (Map map : maps) {
			String group = (String) map.get("group");
			List<Map> params = (List<Map>) map.get("params");
			for (Map map2 : params) {
				String k = (String) map2.get("k");
				String v = (String) map2.get("v");
			
			sb.append("<table border = 1>");
			sb.append("	<tbody>");
			sb.append("		<tr>");
			sb.append("			<td colspan=\"2\" class=\"group\">"
					+ group
					+ "</td>");
			sb.append("		</tr>");
			sb.append("		<tr>");
			sb.append("			<td class=\"param\"><span>"
					+ k
					+ "</span>: </td>");
			sb.append("			<td>"
					+ v
					+ "</td>");
			sb.append("		</tr>");
			sb.append("	</tbody>");
			sb.append("</table>");
			}
		}
		return sb.toString();
	}
	
}
