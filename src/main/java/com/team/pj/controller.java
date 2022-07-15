package com.team.pj;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.http.HttpHeaders;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class controller {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/login")
	public String uptest() {
		return "Login";
	}

	@RequestMapping(value = "/upload_ok", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest req, Model mod) throws IOException {
		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		/* String uploadFolder = "resources/userimage/"; */
//		String path = req.getServletContext().getRealPath("/resources/imma/");
//		System.out.println("userimage 경로:"+path);

		
		String uploadPath = "C:/Users/admin/팀프로젝트/teamP/src/main/webapp/resources/assets/image/";
//		String imaUploadPath = uploadPath +File.separator +"userim";
//		System.out.println(imaUploadPath);
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		URL r = this.getClass().getResource("");
		String path = r.getPath();
		System.out.println("경로어디?"+path);
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		File saveFile = new File(uploadPath +uniqueName+ fileExtension);// 적용 후
		String name=uniqueName+ fileExtension;
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
		e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mod.addAttribute("userim",name);
		return "NewFile";
	}
	
}
