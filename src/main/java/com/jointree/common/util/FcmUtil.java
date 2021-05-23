package com.jointree.common.util;

import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.AndroidConfig;
import com.google.firebase.messaging.AndroidNotification;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;

@Component
public class FcmUtil {
	
//	참고 url: https://baessi.tistory.com/65
	
	public void send_FCM(String tokenId, String title, String content, String url, HttpServletRequest req) {
		
		
		String jsonPath = req.getSession().getServletContext().getRealPath("resources/fcm/wifilist-e1bc4-firebase-adminsdk-6ncx4-8a17073414.json");
		
		try {
//			파일 경로 입력
			FileInputStream refreshToken = new FileInputStream(jsonPath);//FCM ���� json ���� ��� �Է�
			
			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(refreshToken))
					.setDatabaseUrl("https://wifilist-e1bc4.firebaseio.com")//Firebase�� url
					.build();
			
//			Firebase  처음 호출 시 init
			if (FirebaseApp.getApps().isEmpty()) {
				FirebaseApp.initializeApp(options);
			}
			
//			안드로이드 토큰 입력
			String registrationToken = tokenId;
			
//			메시지 작성
			Message msg = Message.builder()
					.setAndroidConfig(AndroidConfig.builder()
							.setTtl(3600*1000)
							.setPriority(AndroidConfig.Priority.NORMAL)
							.setNotification(AndroidNotification.builder()
									.setTitle(title)
									.setBody(content)
									.setImage(url)
									.build())
							.build())
						.setToken(registrationToken)
						.build();
			
//			메시지를 Firebase MEssaging에 보내기
			String response = FirebaseMessaging.getInstance().send(msg);
//			결과 출력
			System.out.println("Succefully sent message: " + response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
