package com.jointree.responsive.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.jointree.responsive.service.LocaleService;

@Service("LocaleService")
public class LocaleServiceImpl implements LocaleService{

	@Override
	public List<Map<String,Object>> getLocaleList(String lang) throws Exception {
		Locale locale;
		String language = lang; // 언어선택

		List<Map<String,Object>> listMap = new ArrayList<>();
		

		for(String country : Locale.getISOCountries()) { //선택된 언어로 나라리스트 출력
            locale = new Locale(language,country);
            Map<String, Object>	localeMap = new HashMap<String, Object>();
            localeMap.put("country",country);
            localeMap.put("TranslateCountry", locale.getDisplayCountry(new Locale(language)));
            listMap.add(localeMap);
//            System.out.println(country); // ISO 코드
//            System.out.println(locale.getDisplayCountry(new Locale(language))); // 나라명
//            System.out.println("------------------");
		}
//		for (Locale locale2 : Locale.getAvailableLocales()) { // 선택된 언어를 사용하는 나라 목록
//			if(language == locale2.getLanguage()) {
//				System.out.println("getLanguage : " + locale2.getLanguage());
//                System.out.println("getCountry : " + locale2.getCountry()); 
//                System.out.println("getDisplayName : " + locale2.getDisplayName());
//                System.out.println("getDisplayLanguage : " + locale2.getDisplayLanguage());
//                System.out.println("getDisplayCountry : " + locale2.getDisplayCountry());
//                System.out.println("===================");
//	        }
//		}
		return listMap;
	}
}
