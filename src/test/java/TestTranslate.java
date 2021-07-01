import com.google.cloud.translate.Translate;
import com.google.cloud.translate.Translation;
import com.google.cloud.translate.testing.RemoteTranslateHelper;

public class TestTranslate {
	
	/* pom.xml 에 추가해야함 */
//	<dependencyManagement>
//	  <dependencies>
//	    <dependency>
//	      <groupId>com.google.cloud</groupId>
//	      <artifactId>libraries-bom</artifactId>
//	      <version>20.6.0</version>
//	      <type>pom</type>
//	      <scope>import</scope>
//	    </dependency>
//	  </dependencies>
//	</dependencyManagement>
//	<dependencies>
//	
//		<dependency>
//		    <groupId>com.google.cloud</groupId>
//		    <artifactId>google-cloud-translate</artifactId>
//	  	</dependency>	
	
	private static final String[] LANGUAGES = {
    	    "ko", "en", "zh-CN", "zh-TW", "vi", "th", "ru", "ja", "fr", "ar", "es", "ms", "it", "id", "pt", "de"
    	  };

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Translate translate;
		
		RemoteTranslateHelper helper = RemoteTranslateHelper.create();
	    translate = helper.getOptions().getService();
	    
	    Translation translation;
	    String msg = "hi";
	    
	    for(int i=0;i<LANGUAGES.length;i++) {
	    	translation =
		    	    translate.translate(
		    	        msg,
		    	        Translate.TranslateOption.targetLanguage(LANGUAGES[i]));
//		    	        Translate.TranslateOption.sourceLanguage("en"),
		    	        // Use "base" for standard edition, "nmt" for the premium model.
//	    				Translate.TranslateOption.model("nmt"));z
	    	System.out.println("[" + LANGUAGES[i] + "] Translated Msg : "+ translation.getTranslatedText());
	    	if (i == LANGUAGES.length -1) {
	    		System.out.println("Translated Msg : "+ translation.getSourceLanguage()); // 번역 대상의 언어 형태
			}
	    	
	    	
	    }
	    
		
	}

}
