package com.tts.TextToSpeak;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SpeakController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(SpeakController.class);
	
	@RequestMapping("/")
	public String speech() {
		logger.info("홈화면");
		
		return "speak";
	}
	
	@RequestMapping("/speak")
	@ResponseBody
	public String speak(HttpServletRequest request, HttpServletResponse response) {
	
			logger.info("ajax화면");
			APITTS apitts = new APITTS();
			String msg = request.getParameter("msg");
			System.out.println("msg : " + msg);
			apitts.speech(msg);
			System.out.println("APITTS : " + apitts);
		return "/";
	}
}
