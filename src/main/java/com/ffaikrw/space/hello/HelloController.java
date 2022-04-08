package com.ffaikrw.space.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@ResponseBody
	@RequestMapping("/hello")
	public String helloWorld() {
		return "Hellow world!";
	}
	
	@RequestMapping("/jsp_test")
	public String jspTest() {
		return "test";
	}
	
}
