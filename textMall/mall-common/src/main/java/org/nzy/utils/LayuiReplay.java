package org.nzy.utils;

import java.util.List;
import javax.xml.crypto.Data;

public class LayuiReplay {

   private int code;
   private String msg;
   private int count;
   private List<?> data;
   
public LayuiReplay(int code, String msg, int count, List<?> data) {
	this.code = code;
	this.msg = msg;
	this.count = count;
	this.data = data;
}


public LayuiReplay() {
	super();
}


public LayuiReplay(List<?> data) {
	this.code = 0;
	this.msg = "";
	this.count = 1000;
	this.data = data;
}



public LayuiReplay(Integer status, String msg2) {
	this.code = status;
	this.msg = msg2;
	this.count = 1000;
	this.data = data;
}


public void setCode(int code) {
        this.code = code;
    }
    public int getCode() {
        return code;
    }

   public void setMsg(String msg) {
        this.msg = msg;
    }
    public String getMsg() {
        return msg;
    }

   public void setCount(int count) {
        this.count = count;
    }
    public int getCount() {
        return count;
    }

   public void setData(List<?> data) {
        this.data = data;
    }
    public List<?> getData() {
        return data;
    }
    public static LayuiReplay ok(List<?> data) {
    	return new LayuiReplay(data);
    }
    public static LayuiReplay ok( int count, List<?> data) {
    	return new LayuiReplay(0,"获取数据成功",count,data);
    }
    public static LayuiReplay ok() {
    	return new LayuiReplay(null);
    }
    public static LayuiReplay build(Integer status, String msg) {
        return new LayuiReplay(status, msg);
    }
 
    
	@Override
	public String toString() {
		return "LayuiReplay [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
	}


	


    
}