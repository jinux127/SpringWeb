package com.jointree.wifi.util;

import java.util.Map;

import org.apache.log4j.Logger;

import com.ibatis.common.logging.Log;

public class Tanimoto {
	
	Logger log = Logger.getLogger(this.getClass());

	public Double tanimoto(Map<String,String> map1, Map<String,String> map2) {
			
			Double offset = 90.0;
			
			Double a2 = 0.0;
			Double b2 = 0.0;
			Double ab = 0.0;
			
			for(String key : map1.keySet()) {
				a2 += Math.abs(Double.parseDouble(map1.get(key))+offset) * Math.abs(Double.parseDouble(map1.get(key))+offset);
				if(map2.get(key) != null) {
					ab += Math.abs(Double.parseDouble(map1.get(key))+offset) * Math.abs(Double.parseDouble(map2.get(key))+offset);
				} 
			}
			
			for(String key : map2.keySet()) {
				if(map2.get(key) != null) {
					b2 += Math.abs(Double.parseDouble(map2.get(key))+offset) * Math.abs(Double.parseDouble(map2.get(key))+offset);
				} 
			}
			
			return ab/(a2+b2-ab);
			
	}
	
	public Double tanimoto2(Map<String,String> map1, Map<String,String> map2) {

			Double a2 = 0.0;
			Double b2 = 0.0;
			Double ab = 0.0;
			
			for(String key : map1.keySet()) {
				a2 += Math.abs(Double.parseDouble(map1.get(key))) * Math.abs(Double.parseDouble(map1.get(key)));
				
				if(map2.get(key) != null) {
					ab += Math.abs(Double.parseDouble(map1.get(key))) * Math.abs(Double.parseDouble(map2.get(key)));
				} 
			}
			
			for(String key : map2.keySet()) {
				if(map2.get(key) != null) {
					b2 += Math.abs(Double.parseDouble(map2.get(key))) * Math.abs(Double.parseDouble(map2.get(key)));
				} 
			}
			
			return ab/(a2+b2-ab);
			
	}
}
