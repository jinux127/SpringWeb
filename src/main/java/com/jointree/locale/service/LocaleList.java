package com.jointree.locale.service;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("LocaleList")
public class LocaleList {
	
	public Map<String,Object> LocaleList(){
		Locale locale; //언어, 나라 설정
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		for(String country : Locale.getISOCountries()) { //ISO 코드 출력
            System.out.println("========================================");
            System.out.println(country);//ISO 표준 나라 코드
            locale = new Locale("ko",country); //언어, 나라 설정
            map.put(locale.getDisplayCountry(), country);
            System.out.println(locale.getDisplayCountry());
            System.out.println(locale.getDisplayName());
		}
		
		return map;
		
	}
}
