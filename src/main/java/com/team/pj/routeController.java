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
public class routeController {
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/login")
	public String uptest() {
		return "Login";
	}

	@RequestMapping(value = "/upload_ok", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest req, Model mod) throws IOException {
		String fileRealName = file.getOriginalFilename(); // ���쇰��� �살�대�� �� ���� 硫�����!
		long size = file.getSize(); // ���� �ъ�댁�

//		System.out.println("���쇰� : " + fileRealName);
//		System.out.println("�⑸���ш린(byte) : " + size);
		// ��踰��� ���ν�� ���쇱�대� fileextension�쇰� .jsp�대�곗���� ���μ�� 紐��� 援ы��
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		/* String uploadFolder = "resources/userimage/"; */
//		String path = req.getServletContext().getRealPath("/resources/imma/");
//		System.out.println("userimage 寃쎈�:"+path);

		
		String uploadPath = "/var/lib/tomcat9/webapps/pj/resources/assets/userimg/";
//		String imaUploadPath = uploadPath +File.separator +"userim";
//		System.out.println(imaUploadPath);
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
//		System.out.println("���깅�� 怨���臾몄����" + uniqueName);
//		System.out.println("���μ��紐�" + fileExtension);
		URL r = this.getClass().getResource("");
		String path = r.getPath();
//		System.out.println("寃쎈��대��?"+path);
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid ���� ��
		File saveFile = new File(uploadPath +uniqueName+ fileExtension);// ���� ��
		String name=uniqueName+ fileExtension;
		try {
			file.transferTo(saveFile); // �ㅼ�� ���� ���λ�����(filewriter ������ ���쎄� ��諛⑹�� 泥�由ы�댁���.)
		} catch (IllegalStateException e) {
		e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
//		mod.addAttribute("userim",name);
		mod.addAttribute("userim",name);
		return "";
	}
	
//	@RequestMapping("/pho")
//	public String pho(Model model) {
//		itest it = sqlSession.getMapper(itest.class);
//		boardVO bo = new boardVO();
//		bo=it.show();
//		it.intest(bo.getB_no(), "/resources/assets/image/"+name);
//		String aa=it.route(bo.getB_no());
//		model.addAttribute("userim",aa);
//		return "NewFile";
//	}
}
