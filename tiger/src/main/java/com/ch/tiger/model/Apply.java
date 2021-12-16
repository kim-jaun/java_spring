package com.ch.tiger.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Apply {
	private int AP_num;
    private String AP_picture;
    private int MB_num;
 // paging용
    private int startRow;
    private int endRow;
    // 조인용
    private String MB_id;
    private String MB_name;
    private String MB_nickName;
    private String MB_gender;
    private String MB_driverConfirm;
    //검색용
    private String keyword;
    private String search;
    // 사진 업로드용
    private MultipartFile fileAp;
}
