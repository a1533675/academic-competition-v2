package com.fuchen.academic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.ysh.springmvc.base.util.ResourcesUtil;
import org.ysh.springmvc.base.util.StringUtil;
import org.ysh.springmvc.base.vo.ResponseMsg;

/**
 * 上传controller
 *
 */
@Controller
@RequestMapping(value="/img")
public class ImageController {
	
	private static final Logger LOG = Logger.getLogger(ImageController.class);
	
	private static final String URL = ResourcesUtil.getResourcesURL() + "/images";
	
	/**
	 * 测试用
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/text",method=RequestMethod.GET)
	public ResponseMsg imageUpload(HttpSession session){
		ResponseMsg msg = new ResponseMsg();
		msg.getData().setSrc(session.getServletContext().getContextPath()+"/img/show?filename=111");
		return msg;
	}
	
	@ResponseBody
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	public ResponseMsg imageUpload(@RequestParam("file") MultipartFile file,HttpSession session){
		ResponseMsg msg = new ResponseMsg();
		if(null != file && file.getSize() > 0){
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.indexOf("."));
			String targetFileName = StringUtil.getUUID()+ext;
			try {
				file.transferTo(new File(URL + "/" + targetFileName));
				msg.getData().setSrc(session.getServletContext().getContextPath()+"/img/show?filename="+targetFileName);
			} catch (Exception e) {
				LOG.error("文件上传异常",e);
			} 
		}
		return msg;
	}
	
	@RequestMapping(value="/show")
	public void showImage(String filename,HttpServletResponse response){
		OutputStream out;
		InputStream fis;
		try {
			out = response.getOutputStream();
			fis = new FileInputStream(new File(URL+"/" + filename));
			byte[] data = new byte[1024];
			int len;
			while ((len = fis.read(data)) != -1) {
				out.write(data, 0, len);
			}
			out.flush();
		} catch (IOException e) {
			LOG.error("关闭ServletOutputStream异常",e);
		}
		
	}
	
}
