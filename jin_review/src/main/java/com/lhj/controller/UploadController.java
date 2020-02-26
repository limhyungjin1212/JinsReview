package com.lhj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lhj.util.MediaUtils;
import com.lhj.util.UploadFileUtils;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {

	}

	// 폼태그를 활용한 파일 업로드
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		logger.info("byte :" + file.getBytes());
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
		// model.addAttribute("uploadPath", uploadPath);

		return "uploadResult";
	}

	private String uploadFile(String originalName, byte[] fileData) throws

	Exception {
		UUID uid = UUID.randomUUID(); // UUID(Universally Unique Identifier) : 범용 고유 식별자
		String savedName = uid.toString() + "_" + originalName;
		// 파일이름이 똑같으면 uuid랜덤으로 구별.
		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target); // 파일을 복사. 업로드 경로 + 이름

		return savedName;

	}

	// ajax를 이용한 파일 업로드
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
		logger.info("uploadAjaxGet");
	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST)
	/* @RequestMapping(value = "/uploadAjax", method = RequestMethod.POST) */
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());

		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	@ResponseBody
	@RequestMapping(value = "/displayFile")
	/* @RequestMapping(value = "/displayFile") */
	public ResponseEntity<byte[]> diplayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		// File file = new File(uploadPath+fileName);
		// logger.info("file :"+file);
		logger.info("fileName :" + fileName);
		
		
		try {
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 헤더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			// headers.add("Content-Type", Files.probeContentType(file.toPath()));
			// entity = new
			// ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
			in = new FileInputStream(uploadPath + fileName);
			logger.info("in="+in);
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(in), headers, HttpStatus.OK);
			logger.info("entity" + entity);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if (in != null)
				in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("deleteFile = " + fileName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);

			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteAllFile(@RequestParam("files[]") String[] files) {
		logger.info("deleteAllFile = " + files);

		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

		for (String fileName : files) {

			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

			MediaType mType = MediaUtils.getMediaType(formatName);

			if (mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);

				new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
			}
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
