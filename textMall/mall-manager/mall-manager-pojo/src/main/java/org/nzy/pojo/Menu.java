package org.nzy.pojo;

import java.util.ArrayList;
import java.util.List;

public class Menu {
	private String title;
	private List<TbMenus>list= new ArrayList<TbMenus>();
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<TbMenus> getList() {
		return list;
	}
	public void setList(List<TbMenus> list) {
		this.list = list;
	}
	public Menu(String title, List<TbMenus> list) {
		this.title = title;
		this.list = list;
	}
	
	public void addMenu(TbMenus tbMenus) {
		list.add(tbMenus);
	}
	
	
	public Menu() {
		
	}
	@Override
	public String toString() {
		return "Menu [title=" + title + ", list=" + list + "]";
	} 
	
}
