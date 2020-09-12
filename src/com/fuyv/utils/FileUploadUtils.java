package com.fuyv.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUploadUtils {

	public static void copyFile(File repairOrder_image,String path) {
		
		FileInputStream in = null;
		FileOutputStream out = null;
		try {
			out = new FileOutputStream(path);
            in = new FileInputStream(repairOrder_image);
            
            byte[] buffer = new byte[1024];
            int len = 0;
            while((len = in.read(buffer)) != -1) {
            	out.write(buffer, 0, len);
            }
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("文件复制出现异常！");
		}finally {
			try {
				out.flush();
				out.close();
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("输入输出流关闭出现异常！");
			}
			
		}
		
	}
}
