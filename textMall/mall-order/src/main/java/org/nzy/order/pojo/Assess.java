package org.nzy.order.pojo;

import java.util.List;

public class Assess {
    private Integer id;

    private String itemid;

    private String orderid;

    private String assess;

    private String start;
    
    private List<?> itemNames;
    

    
	public List<?> getItemNames() {
		return itemNames;
	}

	public void setItemNames(List<?> itemNames) {
		this.itemNames = itemNames;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid == null ? null : itemid.trim();
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    public String getAssess() {
        return assess;
    }

    public void setAssess(String assess) {
        this.assess = assess == null ? null : assess.trim();
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start == null ? null : start.trim();
    }
}