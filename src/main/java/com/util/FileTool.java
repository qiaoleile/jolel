package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public class FileTool {
	//上传路径
	private static String path="upload";
	
	/***
	 * 生成新的文件名
	 * @param fileName 待上传文件名
	 * @return 新的文件名，有当前毫秒值构成
	 */
	public static String createFileName(String fileName){
		//取后缀名
		String p_n=fileName.substring(fileName.indexOf("."));
		
		//构建新文件名 =pic_当前时间毫秒值.后缀
		String newName="f_"+System.currentTimeMillis()+p_n;		
		
		return newName;
	}
	
	/***
	 * 上传文件
	 * @param request request对象
	 * @param file 待上传文件
	 * @return 成功与否
	 */
	public static boolean saveFile(HttpServletRequest request,MultipartFile file,String fileName){
		
		if(!file.isEmpty()){
			try {
				//上传路径对象
				File fileDir=new File(request.getServletContext().getRealPath("/")+path);
				System.out.println("--->"+fileDir.getAbsolutePath());
				
				if(!fileDir.exists()){
					fileDir.mkdirs();
				}
				
				//上传目标文件对象
				File f =new File(fileDir,fileName);
				
				//移动文件
				file.transferTo(f);
				
				return true;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	public static void dowloadFile(HttpServletRequest request,HttpServletResponse response,String fileName){
		try {
			File fileDir=new File(request.getServletContext().getRealPath("/")+path);
			File f =new File(fileDir,fileName);
			InputStream in =new FileInputStream(f);
			
			//响应对象重置
			response.reset();
			//设置响应格式
			response.setContentType("bin");
			//设置响应头
			response.addHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
			
			OutputStream out=response.getOutputStream();
			
			int len=0;
			byte[] b=new byte[1024];
			
			while((len=in.read(b))!=-1){
				out.write(b,0,len);
			}
			
			in.close();
			out.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
}
