package md.rwplus.frontend.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {
	                                       // putem sa punem \\ sau /  merg ambele
	private static final String ABS_PATH = "D:/USM/Programe java SPRING MVC/TulipWebAppGit/frontend/src/main/webapp/assets/image/";
	private static String REAL_PATH = "";
    private static final Logger logger = LoggerFactory.getLogger(FileUploadUtility.class);
	
	public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {
	    
		// get the real server path
				REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/image/");
				
				logger.info(REAL_PATH);					
				
				// to make sure all the directories exists
				//please create the directories
				
				if(!new File(ABS_PATH).exists()) {
					//if not exists, create the directories
					new File(ABS_PATH).mkdirs();
				}
				
				if(!new File(REAL_PATH).exists()) {
					new File(REAL_PATH).mkdirs();
				}
				
				try {
					//transfer the file to both the location
					//server upload
					file.transferTo(new File(REAL_PATH + code + ".jpg"));
					// project directory upload
					file.transferTo(new File(ABS_PATH + code + ".jpg"));
				}
				catch(IOException ex) {
					ex.printStackTrace();
				}
			//	return true;
				
	}
}