package org.nzy.utils;



import java.util.Random;

public class IDUtils {
	public static Long getItemId() {
		//获取当前的时间戳
		long timeMillis = System.currentTimeMillis();
		//两位数随机数
		Random random = new  Random();
		int nextInt = random.nextInt(99);
		String randomStr = "";
		
		if(nextInt<10) {
			randomStr = "0"+nextInt;
		}else {
			randomStr = ""+nextInt;
		}
		randomStr = timeMillis+ randomStr;
		System.out.println("随机id为："+randomStr);
		return new Long(randomStr);
	}
}
