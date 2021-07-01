package com.jointree.responsive.service;

import java.util.List;
import java.util.Map;

public interface LocaleService {
	
	public List<Map<String,Object>> getLocaleList(String lang) throws Exception;

}
