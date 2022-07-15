package com.team.pj;

import org.springframework.web.multipart.MultipartFile;

public class UploadDTO {
	private String name;
	private MultipartFile file;

	public UploadDTO() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}