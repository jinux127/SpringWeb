import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class TestJson {

	public static void main(String[] args) throws ParseException, JsonProcessingException {
		String myContentData = "{\"name\": \"식빵\", \"family\": \"웰시코기\",\"age\": 1,\"weight\": 2.14}";
		JSONParser jsonParse = new JSONParser(); // JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
		JSONObject jsonObj = (JSONObject) jsonParse.parse(myContentData);
		ObjectMapper mapper = new ObjectMapper();
		String contentData = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonObj);// json 데이터 보기쉽게 정렬
		
		System.out.println(contentData);
	}

}
