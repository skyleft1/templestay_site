package com.templestay_site.start.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.templestay_site.start.model.ModelUser;
import com.templestay_site.start.service.IServiceUser;

@Controller
public class LoginController {
    
    @Autowired
    IServiceUser srv;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login(Model model
	        ) {
		logger.info("login");

		return "login/login";
	}
	
    @RequestMapping(value = "/login/loginAction", method = RequestMethod.POST)
    public String loginAction(Model model
            , @ModelAttribute ModelUser userinfo
            ) {
        logger.info("loginAction");

        ModelUser user = new ModelUser();
        
        user = srv.getUserOne(userinfo.getUserid());
        
        String db_user = user.getUserpassword();
        String input_user = userinfo.getUserpassword();
        
        if (db_user.equals(input_user)){
            return "redirect:/";
//            model.addAttribute("user", user);
        } else {
            return "redirect:/login/login";            
        }
        
    }
}
