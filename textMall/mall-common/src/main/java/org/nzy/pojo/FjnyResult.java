package org.nzy.pojo;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class FjnyResult {
	//定义jackson对象
	private static final ObjectMapper MAPPER = new ObjectMapper();
	//相应业务状态
	private Integer status;
	//响应消息
	private String msg;
	//响应中的数据
	private Object data;
	
	 public static FjnyResult build(Integer status, String msg, Object data) {
	        return new FjnyResult(status, msg, data);
	    }

	 public static FjnyResult ok(Object data) {
	        return new FjnyResult(data);
	    }
	 public static FjnyResult ok() {
	        return new FjnyResult(null);
	    }
	 public FjnyResult() {

	    }

	    public static FjnyResult build(Integer status, String msg) {
	        return new FjnyResult(status, msg, null);
	    }
	    public FjnyResult(Integer status, String msg, Object data) {
	        this.status = status;
	        this.msg = msg;
	        this.data = data;
	    }

	    public FjnyResult(Object data) {
	        this.status = 200;
	        this.msg = "OK";
	        this.data = data;
	    }


	    public Integer getStatus() {
	        return status;
	    }

	    public void setStatus(Integer status) {
	        this.status = status;
	    }

	    public String getMsg() {
	        return msg;
	    }

	    public void setMsg(String msg) {
	        this.msg = msg;
	    }

	    public Object getData() {
	        return data;
	    }

	    public void setData(Object data) {
	        this.data = data;
	    }

	    /**
	     * 将json结果集转化为FjnyResult对象
	     * @param jsonData json数据
	     * @param clazz FjnyResult中的object类型
	     * @return
	     */
	    public static FjnyResult formatToPojo(String jsonData, Class<?> clazz) {
	        try {
	            if (clazz == null) {
	                return MAPPER.readValue(jsonData, FjnyResult.class);
	            }
	            JsonNode jsonNode = MAPPER.readTree(jsonData);
	            JsonNode data = jsonNode.get("data");
	            Object obj = null;
	            if (clazz != null) {
	                if (data.isObject()) {
	                    obj = MAPPER.readValue(data.traverse(), clazz);
	                } else if (data.isTextual()) {
	                    obj = MAPPER.readValue(data.asText(), clazz);
	                }
	            }
	            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
	        } catch (Exception e) {
	            return null;
	        }
	    }

	    /**
	     * 没有object对象的转化
	     * @param json
	     * @return
	     */
	    public static FjnyResult format(String json) {
	        try {
	            return MAPPER.readValue(json, FjnyResult.class);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    /**
	     * Object是集合转化
	     * @param jsonData json数据
	     * @param clazz 集合中的类型
	     * @return
	     */
	    public static FjnyResult formatToList(String jsonData, Class<?> clazz) {
	        try {
	            JsonNode jsonNode = MAPPER.readTree(jsonData);
	            JsonNode data = jsonNode.get("data");
	            Object obj = null;
	            if (data.isArray() && data.size() > 0) {
	                obj = MAPPER.readValue(data.traverse(),
	                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
	            }
	            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
	        } catch (Exception e) {
	            return null;
	        }
	    }

	


}
