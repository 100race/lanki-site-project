package com.race.sitegrp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SitegrpVO {
	private int sitegrpno        ;
	private int seqno            ;
	private String wname         ;
	private String wdate         ;
	private String title         ;
	private String grpcont       ;
	private String thumbname     ;
	private int thumbsize        ;
	private int viewcnt          ;
	private int likecnt          ;
	private int sitecnt          ;
	private MultipartFile file1MF; //파일저장
}
