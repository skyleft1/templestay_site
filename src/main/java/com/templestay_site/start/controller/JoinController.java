package com.templestay_site.start.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.templestay_site.start.dao.DaoUser;
import com.templestay_site.start.model.ModelUser;

/**
 * Handles requests for the application home page.
 */
@Controller
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value = "/join/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		logger.info("고고", locale);
		
		return "join/join";
	}

    @RequestMapping(value = "/join/joinAction", method = RequestMethod.POST)
    public String joinAction(
            Model model
            , @ModelAttribute ModelUser userinfo
            ) {
        
        logger.info("고고");
        
        model.addAttribute("userinfo", userinfo );

        return "join/joinAction";
    }
}
