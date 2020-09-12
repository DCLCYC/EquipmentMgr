package com.fuyv.utils;


public class RandomStringUtils {

	public static String[] letter = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R",
		     "S","T","U","V","W","X","Y","Z"};
	
	public static String getRandomString() {
				
		String temp = new String();
		
		for(int i = 0;i < temp.length();i++) {
			int num = (int)(Math.random() * 36 + 1);
			temp += letter[num];
		}
		return temp;
	}
	
	public void test() {
		System.out.println(RandomStringUtils.getRandomString());
	}
	
}
