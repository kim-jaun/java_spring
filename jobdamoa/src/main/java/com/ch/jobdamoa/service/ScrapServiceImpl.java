package com.ch.jobdamoa.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.jobdamoa.dao.ScrapDao;
import com.ch.jobdamoa.model.Scrap;
import com.ch.jobdamoa.model.ScrapJson;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;

@Service
public class ScrapServiceImpl implements ScrapService {

	@Autowired
	private ScrapDao sd;
	
	private static String path = "C:\\my_project\\spring\\final_project\\jobdamoa\\src\\main\\webapp\\python_scrap"; // 경로
	
	@Override
	public List<ScrapJson> scrapProgrammers(String fileName) {
		
		List<ScrapJson> prList = null;
		
		// JSON 데이터를 읽어와서 객체로 변환 후 해당 사이트로 보내줌
		try {
			// Json 파일을 읽어들임 (경로 지정 필수)
			Reader reader = new FileReader(path + "\\" + fileName);

			// 구글에서 제공하는 Gson으로 Json 데이터를 파싱
			Gson gson = new Gson();

			// JsonReader는 불러들인 JSON 파일 형식의 오류나 문제를 잡아주는 역할을 함
			JsonReader jreader = new JsonReader(reader);
			jreader.setLenient(true);

			// Type을 써서 배열로 구성된 Json을 Programmers 객체가 담긴 리스트로 변환
			@SuppressWarnings("serial")
			Type prListType = new TypeToken<ArrayList<ScrapJson>>() {
			}.getType();
			prList = gson.fromJson(jreader, prListType);
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		}
		return prList;
	}

	@Override
	public List<ScrapJson> scrapSaramin(String fileName) {
		
		List<ScrapJson> saramList = null;
		
		// JSON 데이터를 읽어와서 객체로 변환 후 해당 사이트로 보내줌
		try {
			// Json 파일을 읽어들임 (경로 지정 필수)
			Reader reader = new FileReader(path + "\\" + fileName);

			// 구글에서 제공하는 Gson으로 Json 데이터를 파싱
			Gson gson = new Gson();

			// JsonReader는 불러들인 JSON 파일 형식의 오류나 문제를 잡아주는 역할을 함
			JsonReader jreader = new JsonReader(reader);
			jreader.setLenient(true);

			// Type을 써서 배열로 구성된 Json을 Programmers 객체가 담긴 리스트로 변환
			@SuppressWarnings("serial")
			Type saramListType = new TypeToken<ArrayList<ScrapJson>>() {
			}.getType();
			saramList = gson.fromJson(jreader, saramListType);
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		}
		return saramList;
	}

	@Override
	public Scrap confirmScrap(Scrap scchk) {
		return sd.confirmScrap(scchk);
	}

	@Override
	public int getMaxNum() {
		return sd.getMaxNum();
	}

	@Override
	public int scrapSave(Scrap scrap2) {
		return sd.scrapSave(scrap2);
	}

	@Override
	public int getMyTotal(int mem_num) {
		return sd.getMyTotal(mem_num);
	}

	@Override
	public List<Scrap> scrapList(Scrap scrap) {
		return sd.scrapList(scrap);
	}

	@Override
	public int scrapDelete(int scrap_num) {
		return sd.scrapDelete(scrap_num);
	}

	@Override
	public String getDate(String fileName) {
		
		// 파일 동기화 시간을 불러오기 위한 코드
		File file = new File(path + "\\" + fileName);
		long lastModified = file.lastModified();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date lastModifiedDate = new Date(lastModified);
		String scrapDate = dateFormat.format(lastModifiedDate);
		
		return scrapDate;
	}

	@Override
	public List<Scrap> myxlslist(int mem_num) {
		return sd.myxlslist(mem_num);
	}
	
}
