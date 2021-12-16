package com.ch.jobdamoa.service;

import java.util.List;

import com.ch.jobdamoa.model.Scrap;
import com.ch.jobdamoa.model.ScrapJson;

public interface ScrapService {

	List<ScrapJson> scrapProgrammers(String fileName);

	Scrap confirmScrap(Scrap scchk);

	int getMaxNum();

	int scrapSave(Scrap scrap2);

	int getMyTotal(int mem_num);

	List<Scrap> scrapList(Scrap scrap);

	int scrapDelete(int scrap_num);

	List<ScrapJson> scrapSaramin(String fileName);

	String getDate(String fileName);

	List<Scrap> myxlslist(int mem_num);
	
}
