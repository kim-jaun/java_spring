package com.ch.tiger.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Carpool {
	private int CP_num;					//매칭게시글번호
    private Date CP_regDate;			//작성일
    private String CP_startPoint;		//출발지
	private String CP_endPoint;			//도착지
	private Date CP_startDate;			//출발일
    private String CP_startTime;		//출발시간
    private int CP_fee;					//요금
    private int CP_passNum;				//총좌석수
    private int CP_passNumNow;			//매칭완료된좌석수
    private String CP_gendertype;		//성별제한
    private String CP_option;			//참고사항(애완동물허용, 조용한카풀, 음식물섭취, 마스크착용)
    private int CP_duration;			//예상소요시간
    private String CP_comment;			//기타요구사항
    private String CP_del;				//삭제여부
    private int MB_num;					//회원번호(드라이버)
    
    // 조인용
    private String MB_nickName;
    private String RSV_mConfirm;
    private String RSV_confirm;
    private int MB_numP;				//회원번호(탑승자)
    
	// paging용
	private int startRow;
	private int endRow;
	
	// 검색용
	private String search;
	private String keyword;
}
