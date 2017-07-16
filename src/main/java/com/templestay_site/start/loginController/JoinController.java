package com.templestay_site.start.loginController;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.templestay_site.start.dao.DaoMember;
import com.templestay_site.start.model.ModelMember;

/**
 * Handles requests for the application home page.
 */
@Controller
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/join/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		logger.info("고고", locale);

//		model.addAttribute("serverTime", formattedDate );
		
		return "join/join";
	}

    @RequestMapping(value = "/join/joinAction", method = RequestMethod.POST)
    public String joinAction(
            Model model
            , @ModelAttribute ModelMember memberinfo
            ) {
        
        logger.info("고고");
        
        model.addAttribute("memberinfo", memberinfo );

        return "join/joinAction";
    }
}
