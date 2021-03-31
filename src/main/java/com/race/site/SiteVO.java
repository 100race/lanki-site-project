package com.race.site;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SiteVO {
	private int siteno          ;
	private int sitegrpno       ;
	private int seqno           ;
	private String link         ;
	private String sname        ;
	private String wname        ;
	private String content      ;
	private String filename     ;
	private int filesize        ;
	private int likecnt         ;
	private MultipartFile file1MF; //파일저장
}
